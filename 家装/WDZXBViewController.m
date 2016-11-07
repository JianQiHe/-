//
//  WDZXBViewController.m
//  家装
//
//  Created by mac on 16/5/14.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "WDZXBViewController.h"
#import "WDZXBTableViewCell.h"
@interface WDZXBViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation WDZXBViewController
{
    UITableView *tabview;
    NSString *UidStr;
    NSData *data;
    NSMutableDictionary *dict;
    int a ;
    UIView *backgroundView;
}




- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    
    
    tabview = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, Width, Height-84) style:UITableViewStylePlain];
    tabview.backgroundColor = [UIColor groupTableViewBackgroundColor];
    tabview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tabview];
    tabview.delegate = self;
    tabview.dataSource = self;
    
    [self wangluoqingqiu1];
    
    
    


    // Do any additional setup after loading the view.
}
-(void)wangluoqingqiu1
{
    
    
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
    
    //装修保
    NSString *str=[NSString stringWithFormat:@"http://jiazhuang.siruoit.com/index.php?api/api-zxb/%@/1",UidStr];
    
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
    
    return 75;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIndentifier = @"WDZXBTableViewCell";
    WDZXBTableViewCell *Cell = [tableView dequeueReusableCellWithIdentifier:CellIndentifier];
    if (!Cell) {
        Cell = [[WDZXBTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIndentifier];
    }
    Cell.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    Cell.contactlab.text = dict[@"data"][indexPath.row][@"contact"];
    
    NSString *mobileStr= [NSString stringWithFormat:@"手机:%@",dict[@"data"][indexPath.row][@"mobile"]];
    Cell.mobilelab.text = mobileStr;
    
    NSString *statusStr = [NSString stringWithFormat:@"状态:%@",dict[@"data"][indexPath.row][@"status"]];
    Cell.statuslab.text = statusStr;
    
    
    NSString *remarkStr= [NSString stringWithFormat:@"公司备注:%@",dict[@"data"][indexPath.row][@"remark"]];
    Cell.remarklab.text = remarkStr;
    
    
    Cell.auditlab.text = dict[@"data"][indexPath.row][@"adulit"];
    
    Cell.datelinelab.text = dict[@"data"][indexPath.row][@"dateline"];
    return Cell;
    
}



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
    lab.text = @"您还没有相关的装修保";
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
    label.text = @"可以去看看有哪些保想买的";
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
