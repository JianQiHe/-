//
//  GWDDViewController.m
//  家装
//
//  Created by mac on 16/5/14.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "GWDDViewController.h"
#import "GWDDTableViewCell.h"
@interface GWDDViewController ()<UITableViewDelegate,UITableViewDataSource>
@end

@implementation GWDDViewController
{
    UIButton *btn1;
    UIButton *btn2;
    UIButton *btn3;
    UIButton *btn4;
    UIButton *btn5;
    
    
    NSData *data;
    NSMutableDictionary *dict;
    NSString *String;
    UIView *backgroundView;//没有订单显示的view
    
    
    UITableView *tabview;
    NSString *UidStr;
    int a;
    NSString *order_nostr;
}

-(void)viewWillAppear:(BOOL)animated
{
    

    [[self navigationController] setNavigationBarHidden:YES animated:NO];
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Width, 84)];
//    [UIColor colorWithRed:70/255.0 green:70/255.0 blue:70/255.0 alpha:4.3]
    view.backgroundColor = [UIColor colorWithRed:32/255.0 green:151/255.0 blue:117/255.0 alpha:1];
    
    [self.view addSubview:view];
    
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"返回"]forState:UIControlStateNormal];
    [button setFrame:CGRectMake(7,25,30,30)];
    [button addTarget:self action:@selector(jumpBack:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button];
    
    
    //title
    
    UILabel *lab = [[UILabel alloc]init];
    lab.text = @"购物订单";
    lab.textAlignment = 1;
    lab.textColor = [UIColor colorWithRed:253/255.0 green:253/255.0 blue:253/255.0 alpha:1];
    lab.font = [UIFont fontWithName:@"Heiti SC Thin" size:16];
    [view addSubview:lab];
    [lab mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(view.mas_left).offset((Width-80)/2);
        make.right.equalTo(view.mas_right).offset(-(Width-80)/2);
        make.bottom.equalTo(button.mas_bottom);
        make.height.equalTo(@20);
}];

    
    
    CGFloat A = Width/5;
    
    btn1 = [[UIButton alloc]init];
    [btn1 setFrame:CGRectMake(0, 64, A, 20)];
    [btn1 setTitle:@"全部" forState:UIControlStateNormal];
    btn1.selected = YES;
    [btn1 setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
    [btn1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn1.titleLabel.font = [UIFont systemFontOfSize:12];
    btn1.backgroundColor = [UIColor clearColor];
    [btn1 addTarget:self action:@selector(Clickbtn1) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview: btn1];


    
    btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = CGRectMake(A, 64, A, 20);
    [btn2 setTitle:@"待付款" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
    btn2.titleLabel.font = [UIFont systemFontOfSize:12];
    btn2.backgroundColor = [UIColor clearColor];
    [btn2 addTarget:self action:@selector(Clickbtn2) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview: btn2];
    
    
    btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn3.frame = CGRectMake(A*2, 64, A, 20);
    [btn3 setTitle:@"待发货" forState:UIControlStateNormal];
    [btn3 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn3 setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
    btn3.titleLabel.font = [UIFont systemFontOfSize:12];
    btn3.backgroundColor = [UIColor clearColor];
    [btn3 addTarget:self action:@selector(Clickbtn3) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview: btn3];
    
    
    btn4 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn4.frame = CGRectMake(3*A, 64, A, 20);
    [btn4 setTitle:@"代签收" forState:UIControlStateNormal];
    [btn4 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn4 setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
    btn4.titleLabel.font = [UIFont systemFontOfSize:12];
    btn4.backgroundColor = [UIColor clearColor];
    [btn4 addTarget:self action:@selector(Clickbtn4) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview: btn4];
    
    
    btn5 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn5.frame = CGRectMake(4*A, 64, A, 20);
    [btn5 setTitle:@"待评价" forState:UIControlStateNormal];
    [btn5 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn5 setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
    btn5.titleLabel.font = [UIFont systemFontOfSize:12];
    btn5.backgroundColor = [UIColor clearColor];
    [btn5 addTarget:self action:@selector(Clickbtn5) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview: btn5];
    
    
    

    tabview = [[UITableView alloc]initWithFrame:CGRectMake(0, 84, Width, Height-84) style:UITableViewStylePlain];
    tabview.backgroundColor = [UIColor groupTableViewBackgroundColor];
    tabview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tabview];
    tabview.delegate = self;
    tabview.dataSource = self;
    [self Clickbtn1];
    
    
    
 


    
    
    
       // Do any additional setup after loading the view.
}
- (void)jumpBack:(id)sender{
    
    [self.navigationController popViewControllerAnimated:YES];
    [[self navigationController] setNavigationBarHidden:NO animated:NO];
}


-(void)Clickbtn1
{
    [backgroundView removeFromSuperview];
    //全部订单
    btn2.selected = NO;
    btn1.selected = YES;
    btn3.selected = NO;
    btn4.selected= NO;
    btn5.selected = NO;
    String = @"all";
    [self wangluoqingqiu];
    
}
-(void)Clickbtn2
{
    //待付款
    btn2.selected = YES;
    btn1.selected = NO;
    btn3.selected = NO;
    btn4.selected= NO;
    btn5.selected = NO;
    String = @"unpay";
    [self wangluoqingqiu];
    
}
-(void)Clickbtn3
{
    //待发货
    btn2.selected = NO;
    btn1.selected = NO;
    btn3.selected = YES;
    btn4.selected= NO;
    btn5.selected = NO;
    String = @"payed";
    [self wangluoqingqiu];
    
}
-(void)Clickbtn4
{
    //代签收
    btn2.selected = NO;
    btn1.selected = NO;
    btn3.selected = NO;
    btn4.selected= YES;
    btn5.selected = NO;
    String = @"ship";
    [self wangluoqingqiu];
}
-(void)Clickbtn5
{
    //待评价
    btn2.selected = NO;
    btn1.selected = NO;
    btn3.selected = NO;
    btn4.selected= NO;
    btn5.selected = YES;
    String = @"finish";
    [self wangluoqingqiu];
}
//
-(void)wangluoqingqiu
{
    [backgroundView removeFromSuperview];//移除没有数据情况下显示的view

    
    #pragma mark -----------------菊花-----------------------
    
    UIActivityIndicatorView *testActivityIndicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    testActivityIndicator.center = CGPointMake(100.0f, 100.0f);//只能设置中心，不能设置大小
    [testActivityIndicator setFrame:CGRectMake(100, 100, 100, 100)];
    //不建议这样设置，因为UIActivityIndicatorView是不能改变大小只能改变位置，这样设置得到的结果是控件的中心在（100，100）上，而不是和其他控件的frame一样左上角在（100， 100）长为100，宽为100.
    [self.view addSubview:testActivityIndicator];
    testActivityIndicator.color = [UIColor blackColor]; // 改变圈圈的颜色为红色； iOS5引入
    [testActivityIndicator startAnimating]; // 开始旋转
    //    [testActivityIndicator stopAnimating]; // 结束旋转
    //    [testActivityIndicator setHidesWhenStopped:YES]; //当旋转结束时隐藏
    [testActivityIndicator mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.view.mas_left).offset((Width-50)/2);
        make.right.equalTo(self.view.mas_right).offset(-(Width-50)/2);
        make.width.equalTo(@50);
        make.top.equalTo(self.view.mas_top).offset(154);
        
    }];
    
    
    
    
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *Dic = [userDefaults objectForKey:@"User"];
    UidStr = Dic[@"data"][0][@"uid"];
    
    
    NSString *str=[NSString stringWithFormat:@"http://jiazhuang.siruoit.com/index.php?api/api-order/%@/%@/1",UidStr,String];

    NSURL *url = [NSURL URLWithString:[str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];                        // UTF－8
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc]initWithRequest:request];
    // 请求数据，设置成功与失败的回调函数
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSString *html = operation.responseString;
        data=[html dataUsingEncoding:NSUTF8StringEncoding];
        dict = [NSMutableDictionary dictionaryWithDictionary:[NSJSONSerialization  JSONObjectWithData:data options:0 error:nil]];
        NSLog(@"获取到的数据为：%@",dict);
            [testActivityIndicator stopAnimating]; // 结束旋转
            [testActivityIndicator setHidesWhenStopped:YES]; //当旋转结束时隐藏

        a =(int )[dict[@"data"] count];

        if ([dict[@"data"] count]==0) {
            [self ifNoData];
        }

        [tabview reloadData];

    }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"发生错误！%@",error);
    }];
    // 加入队列
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperation:operation];

    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return a;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 145;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    if ([String isEqual:@"all"]) {
        static NSString *CellIdendifier = @"GWDDTableViewCell";
        GWDDTableViewCell *Cell = [tableView dequeueReusableCellWithIdentifier:CellIdendifier];
        if (!Cell) {
            Cell = [[GWDDTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdendifier];
        }
        Cell.backgroundColor = [UIColor groupTableViewBackgroundColor];
        Cell.selectionStyle = NO;
        
        
        Cell.titlelab.text = @"科天化天有限公司";
        
        
    int pay_statusNumber =[dict[@"data"][indexPath.row][@"pay_status"] intValue];
        if (pay_statusNumber==0) {
            Cell.pay_status.text =@"未付款";
        }else
            Cell.pay_status.text =@"已付款";
        

            
        
        
        NSString *pohotostr = [NSString stringWithFormat:@"http://jiazhuang.siruoit.com/attachs/%@",dict[@"data"][indexPath.row][@"product_list"][0][@"photo"]];
        [Cell.photo sd_setImageWithURL:[NSURL URLWithString:pohotostr] placeholderImage:[UIImage imageNamed:@"shangping"]];
        Cell.photo.backgroundColor = [UIColor darkGrayColor];
        
        
        
        
        Cell.product_name.text = dict[@"data"][indexPath.row][@"product_list"][0][@"product_name"];
        NSString *prcieStr = [NSString stringWithFormat:@"¥ %@",dict[@"data"][indexPath.row][@"product_list"][0][@"product_price"]];
        Cell.product_price.text =prcieStr;
        
        
        
        
        NSString *numberStr = [NSString stringWithFormat:@"x%@",dict[@"data"][indexPath.row][@"product_list"][0][@"number"]];
        Cell.number.text = numberStr;
        
        
        
        
        NSString *freightStr1 = [NSString stringWithFormat:@"(含运费¥0.00)"];
        NSString *freightStr2 = [NSString stringWithFormat:@"(含运费¥%@)",dict[@"data"][indexPath.row][@"freight"]];
        if (dict[@"data"][indexPath.row][@"freight"]==0) {
            Cell.freight.text = freightStr1;
        }else
            Cell.freight.text = freightStr2;
        
    
    
    
    int order_statusNumber =[dict[@"data"][indexPath.row][@"order_status"] intValue];
    
    if(order_statusNumber==0)
    {
        
    }else
    {
        [Cell.queren setTitle:@"订单已取消" forState:UIControlStateNormal];
        Cell.quxiao.hidden = YES;
    }

    
        
        
        
        NSString *freightStr3 = dict[@"data"][indexPath.row][@"freight"];
        NSString *amountStr = dict[@"data"][indexPath.row][@"product_list"][0][@"amount"];
        int c = [freightStr3 intValue];
        int d = [amountStr intValue];
        int e = c+d;
        NSString *amountStr2 = [NSString stringWithFormat:@"%d",e];
        NSString *amountStr3 = [NSString stringWithFormat:@"合计:¥%@",amountStr2];
        Cell.amount.text = amountStr3;
        
    
    [Cell.queren addTarget:self action:@selector(Clickqueren:) forControlEvents:UIControlEventTouchUpInside];
      Cell.queren.tag = indexPath.row;
    
    [Cell.quxiao addTarget:self action:@selector(Clickquxiao:) forControlEvents:UIControlEventTouchUpInside];
      Cell.quxiao.tag = indexPath.row;
    
        return Cell;
            

        
    }
//    else{
//        
//    static NSString *unpayCellIdendifier = @"unpayGWDDTableViewCell";
//    unpayGWDDTableViewCell *Cell = [tableView dequeueReusableCellWithIdentifier:unpayCellIdendifier];
//    if (!Cell) {
//        Cell = [[unpayGWDDTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:unpayCellIdendifier];
//    }
//    Cell.backgroundColor = [UIColor whiteColor];
//    Cell.selectionStyle = NO;
//        
//    return Cell;
//        
//    }
//}



-(void)ifNoData
{
    backgroundView = [[UIView alloc]initWithFrame:CGRectMake(0, 84, Width, Height-84)];
    [self.view addSubview:backgroundView];
    backgroundView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    
    UIImageView *imagV =[[UIImageView alloc]init];
    imagV.image = [UIImage imageNamed:@"订单"];
    [backgroundView addSubview:imagV];
    [imagV mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(backgroundView.mas_left).offset((Width-80)/2);
        make.right.equalTo(backgroundView.mas_right).offset(-(Width-80)/2);
        make.top.equalTo(backgroundView.mas_top).offset((backgroundView.frame.size.height-80)/2);
        make.height.equalTo(@80);
    }];
    
    
    UILabel *lab = [[UILabel alloc]init];
    [backgroundView addSubview:lab];
    lab.text = @"您还没有相关的订单";
    lab.textAlignment = 1;
    lab.font = [UIFont systemFontOfSize:15];
    lab.backgroundColor = [UIColor clearColor];
    [lab mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(imagV.mas_left).offset(-40);
        make.right.equalTo(imagV.mas_right).offset(40);
        make.top.equalTo(imagV.mas_bottom).offset(5);
        make.height.equalTo(@15);
    }];
    
    
    
    UILabel *label = [[UILabel alloc]init];
    [backgroundView addSubview:label];
    label.text = @"可以去看看有哪些想买的";
    label.textAlignment = 1;
    label.font = [UIFont systemFontOfSize:10];
    label.textColor = [UIColor lightGrayColor];
    label.backgroundColor = [UIColor clearColor];
    [label mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(imagV.mas_left).offset(-30);
        make.right.equalTo(imagV.mas_right).offset(30);
        make.top.equalTo(lab.mas_bottom).offset(5);
        make.height.equalTo(@15);
    }];

}
#pragma mark -----------------左滑删除-----------------------

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}
-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"取消订单";
    //    NSArray *arr = @[@{},@{},@"2"];
    //
    //    NSDictionary *dic = @{@"data":arr,@"2":arr1};
    //    NSMutableArray *mmm = arr;
    //    [mmm removeObjectAtIndex:0];
    //    mmm = @[@"234",@"2"];
    //    [dic setValue:mmm forKey:@"data"];
    
    
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        order_nostr = dict[@"data"][indexPath.row][@"order_no"];

        [self DeleteOrder];
        
        NSMutableArray *arr1 = [[NSMutableArray alloc] initWithArray:dict[@"data"]];
        NSLog(@"arr==%@",arr1);
        [arr1 removeObjectAtIndex:indexPath.row];
        [dict setValue:arr1 forKey:@"data"];
        a = (int)[dict[@"data"] count];
        [tabview reloadData];
    }
    else
    {
        //        [dict[@"data"] addObject:@100];
        //        NSIndexPath *newIndexPath = [NSIndexPath indexPathForRow:[dict[@"data"] count ] - 1 inSection:0];
        //        [tableView insertRowsAtIndexPaths:@[newIndexPath]withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}
#pragma mark -----------------确认收货按钮和删除订单-----------------------

-(void)Clickqueren:(UIButton *)btn
{
    NSInteger Btn = btn.tag;
    order_nostr =  dict[@"data"][Btn][@"order_no"];
    NSLog(@"我是你爸爸%@",order_nostr);
    [self qurenship];
    NSLog(@"电击了确认:%ld",(long)btn.tag);
    
}

-(void)Clickquxiao:(UIButton *)btn
{
    NSInteger Btn = btn.tag;
    order_nostr =  dict[@"data"][Btn][@"order_no"];
    [self DeleteOrder];
    NSLog(@"电击了确认:%ld",(long)btn.tag);
    
}

-(void)DeleteOrder//删除订单

{
    
    NSString *str1=[NSString stringWithFormat:@"http://jiazhuang.siruoit.com/index.php?api/api-orderupdate/%@/cancel/%@",UidStr,order_nostr];
    
    NSURL *url1 = [NSURL URLWithString:[str1 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];                        // UTF－8
    NSURLRequest *request1 = [NSURLRequest requestWithURL:url1];
    AFHTTPRequestOperation *operation1 = [[AFHTTPRequestOperation alloc]initWithRequest:request1];
    // 请求数据，设置成功与失败的回调函数
    [operation1 setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSString *html1 = operation.responseString;
        NSData *data1=[html1 dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *dict1 = [NSMutableDictionary dictionaryWithDictionary:[NSJSONSerialization  JSONObjectWithData:data1 options:0 error:nil]];
        NSLog(@"删除信息%@",dict1[@"data"]);
        
        
         String = @"all";
        [self wangluoqingqiu];
    }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"发生错误！%@",error);
    }];
    // 加入队列
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperation:operation1];
    

}
-(void)qurenship//确认收货
{
    NSString *str1=[NSString stringWithFormat:@"http://jiazhuang.siruoit.com/index.php?api/api-orderupdate/%@/ship/%@",UidStr,order_nostr];
    
    NSURL *url1 = [NSURL URLWithString:[str1 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];                        // UTF－8
    NSURLRequest *request1 = [NSURLRequest requestWithURL:url1];
    AFHTTPRequestOperation *operation1 = [[AFHTTPRequestOperation alloc]initWithRequest:request1];
    // 请求数据，设置成功与失败的回调函数
    [operation1 setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSString *html1 = operation.responseString;
        NSData *data1=[html1 dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *dict1 = [NSMutableDictionary dictionaryWithDictionary:[NSJSONSerialization  JSONObjectWithData:data1 options:0 error:nil]];
        NSLog(@"确认信息%@",dict1[@"data"]);
        
        
        String = @"all";
        [self wangluoqingqiu];
    }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"发生错误！%@",error);
    }];
    // 加入队列
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperation:operation1];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
