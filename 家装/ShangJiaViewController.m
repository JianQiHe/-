//
//  ShangJiaViewController.m
//  家装
//
//  Created by mac on 16/5/30.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ShangJiaViewController.h"
#import "ShopDetailsViewController.h"
#import "ShangjiaTableViewCell.h"
#import "MJRefresh.h"
@interface ShangJiaViewController ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, copy, nullable) NSSet *RespType;

@end

@implementation ShangJiaViewController

{
    UIScrollView *sc;
    UIScrollView *SC;
    NSMutableArray *arr;
    UIButton *btn;
    UIView *bgView;
    UILabel *label;
    UITableView *tabView;
    
    id dict;
    CGFloat btnWidth;
    
    id dict1;
    NSString *cat_idStr;
    UIView *backgroundView;
    int k;
    
    UIScrollView *_contentScrollview;

}

- (void)viewWillAppear:(BOOL)animated
{
//    [[self navigationController] setNavigationBarHidden:YES animated:NO];
    
}
//- (BOOL)prefersStatusBarHidden{
//    return YES;//隐藏状态栏
//    
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    k=1;
    
    //    [self topTitleBtnClick];
    #pragma mark -----------------网络请求-----------------------

    cat_idStr= [NSString stringWithFormat:@"1"];
    NSString *str=[NSString stringWithFormat:@"http://jiazhuang.siruoit.com/index.php?mall/store/cate_list"];
    
    NSURL *url = [NSURL URLWithString:[str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];                        // UTF－8
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc]initWithRequest:request];
    // 请求数据，设置成功与失败的回调函数
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSString *html = operation.responseString;
        NSData *data=[html dataUsingEncoding:NSUTF8StringEncoding];
        dict=[NSJSONSerialization  JSONObjectWithData:data options:0 error:nil];
//        NSLog(@"分类ID：%@",dict);
//        NSLog(@"sss:%lu",[dict[@"data"]count]);
        

        sc = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, Width, 20)];
        sc.showsHorizontalScrollIndicator = NO;
        //    sc.pagingEnabled = YES;
        [self.view addSubview:sc];
        sc.backgroundColor = [UIColor colorWithRed:70/255.0 green:70/255.0 blue:70/255.0 alpha:4.3];
        btnWidth =Width/9*2;
        sc.contentSize = CGSizeMake(9*btnWidth,0);
        sc.delegate = self;
        
        
        
        label = [[UILabel alloc]initWithFrame:CGRectMake(0, 19,Width/9*2, 1)];
        label.backgroundColor = [UIColor whiteColor];
        [sc addSubview:label];
        for (int i = 0; i<[dict[@"data"] count]; i++)
        {
            btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake(btnWidth*i, 0, btnWidth,sc.frame.size.height);
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont systemFontOfSize:12];
            
            [btn setTitle:dict[@"data"][i][@"title"] forState:0];
            btn.tag= i;
            btn.backgroundColor = [UIColor clearColor];
            [btn setTitleColor:[UIColor whiteColor] forState:0];
            btn.titleLabel.font = [UIFont systemFontOfSize:11];
            [btn addTarget:self action:@selector(topTitleBtnClick:) forControlEvents:UIControlEventTouchDown];
            [sc addSubview:btn];
        }
    }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"发生错误！%@",error);
    }];
    // 加入队列
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperation:operation];

    
    
    
    
    
//    bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Width, 64)];
//    bgView.backgroundColor = [UIColor colorWithRed:70/255.0 green:70/255.0 blue:70/255.0 alpha:4.3];
//    [self.view addSubview:bgView];
//    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake((self.view.frame.size.width-40)/2, 10, 40, 20)];
//    lab.text = @"商家";
//    lab.font = [UIFont fontWithName:@"" size:15];
//    lab.textAlignment = YES;
//    lab.textColor = [UIColor whiteColor];
//    [bgView addSubview:lab];
    
    
//    sc = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, Width, 20)];
//    sc.showsHorizontalScrollIndicator = NO;
////    sc.pagingEnabled = YES;
//    [self.view addSubview:sc];
//    sc.backgroundColor = [UIColor redColor];
//    btnWidth =Width/9*2;
//    sc.contentSize = CGSizeMake(9*btnWidth,0);
//    sc.delegate = self;
//    
//
//    
//    label = [[UILabel alloc]initWithFrame:CGRectMake(0, 19,Width/9*2, 1)];
//    label.backgroundColor = [UIColor whiteColor];
//    [sc addSubview:label];
    
    
    [self companylist];


    
    
    
    
    
    
    
    #pragma mark -----------------上面为自定义导航栏等，下为tbview-----------------------
    
    
    
    
    
    
    
    
    
    tabView = [[UITableView alloc]initWithFrame:CGRectMake(0, 84, Width,Height-108) style:UITableViewStylePlain];
    tabView.backgroundColor = [UIColor groupTableViewBackgroundColor];

    tabView.separatorStyle = UITableViewCellSelectionStyleNone;
    tabView.delegate = self;
    tabView.dataSource = self;
    [self.view addSubview:tabView];
    #pragma mark -----------------MJRfresh-----------------------

    tabView.mj_header=[MJRefreshNormalHeader headerWithRefreshingBlock: ^ {
        //调用此块。当进入刷新状态自动
        [self companylist];
    }];
    
    tabView.mj_footer =[MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        
        [self moredata];
        // 进入刷新状态后会自动调用这个block
        
    }];


    // Do any additional setup after loading the view.
}


#pragma mark-商家列表
-(void)companylist
{
    
    NSString *str1=[NSString stringWithFormat:@"http://jiazhuang.siruoit.com/index.php?mall/store/store_list-%@-0-1-上海",cat_idStr];
    
    NSURL *url1 = [NSURL URLWithString:[str1 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];                        // UTF－8
    NSURLRequest *request1 = [NSURLRequest requestWithURL:url1];
    AFHTTPRequestOperation *operation1 = [[AFHTTPRequestOperation alloc]initWithRequest:request1];
    // 请求数据，设置成功与失败的回调函数
    [operation1 setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSString *html = operation.responseString;
        NSData *data1=[html dataUsingEncoding:NSUTF8StringEncoding];
        dict1=[NSJSONSerialization  JSONObjectWithData:data1 options:0 error:nil];
        NSLog(@"获取到的数据为：%@",dict1);
        if ([dict1 [@"data"]count]==0) {
            
            [self ifNoData];
        }else{
            
            [tabView reloadData];
            [tabView.mj_header endRefreshing];
            [backgroundView removeFromSuperview];
        }
    }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"发生错误123！%@",error);
    }];
    // 加入队列
    NSOperationQueue *queue1 = [[NSOperationQueue alloc] init];
    [queue1 addOperation:operation1];

}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tabView== tableView) {
        
        return [dict1[@"data"]count];
    }
    return 0;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tabView == tableView) {
        return 130;

    }
    
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tabView == tableView) {
        // 1.创建CELL

        static NSString *CellIndentifier = @"ShangjiaTableViewCell";
        ShangjiaTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:CellIndentifier] ;
        if (cell==nil) {
            cell = [[ShangjiaTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIndentifier];
        }
        cell.backgroundColor = [UIColor groupTableViewBackgroundColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

        NSString *Str =[NSString stringWithFormat:@"http://jiazhuang.siruoit.com/attachs/%@",dict1[@"data"][indexPath.row][@"logo"]];
        [cell.img sd_setImageWithURL:[NSURL URLWithString:Str] placeholderImage:[UIImage imageNamed:@"logo"]];

        cell.labOne.text = dict1[@"data"][indexPath.row][@"name"];
        
        NSString *strTwo = [NSString stringWithFormat:@"联系电话:%@",dict1[@"data"][indexPath.row][@"phone"]];
        cell.labTwo.text =strTwo;
        

        NSString *strThree = [NSString stringWithFormat:@"店铺等级:%@",dict1[@"data"][indexPath.row][@"group_name"]];
        cell.labThree.text = strThree;


        NSString *strlab1 = [NSString stringWithFormat:@"共有商品:%@",dict1[@"data"][indexPath.row][@"products"]];
        NSMutableAttributedString *lab1Str = [[NSMutableAttributedString alloc]initWithString:strlab1];
        [lab1Str addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, 5)];
        cell.lab1.attributedText = lab1Str;

        
        NSString *strlab2 = [NSString stringWithFormat:@"浏览量:%@",dict1[@"data"][indexPath.row][@"views"]];
        NSMutableAttributedString *lab2Str = [[NSMutableAttributedString alloc]initWithString:strlab2];
        [lab2Str addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, 4)];
        cell.lab2.attributedText = lab2Str;
        
        cell.suzilab.text = dict1[@"data"][indexPath.row][@"score"];


        [cell.enterBtn addTarget:self action:@selector(enter:) forControlEvents:UIControlEventTouchUpInside];
        cell.enterBtn.tag = indexPath.row;
        return cell;
    }
    return 0;
}

-(void)enter:(UIButton *)button
{
    self.hidesBottomBarWhenPushed = YES;
    ShopDetailsViewController *view = [[ShopDetailsViewController alloc]init];
    [self.navigationController pushViewController:view animated:YES];
    self.hidesBottomBarWhenPushed = NO;
    view.shop_idStr =dict1[@"data"][button.tag][@"shop_id"];
    view.shopNameStr = dict1[@"data"][button.tag][@"name"];
    view.vcat_idStr= cat_idStr;
    NSString *Str =[NSString stringWithFormat:@"http://jiazhuang.siruoit.com/attachs/%@",dict1[@"data"][button.tag][@"logo"]];
    view.shopImagvStr = Str;
    [[self navigationController] setNavigationBarHidden:NO animated:NO];
}

-(void)moredata
{
    int i = (int)[dict[@"data"] count]/(10*k);
    if (i==1) {
        k++;
        [self companylist2];
    }else
    {
        [tabView.mj_footer endRefreshing];
    }
}

-(void)companylist2
{
    
    
    NSString *str1=[NSString stringWithFormat:@"http://jiazhuang.siruoit.com/index.php?mall/store/store_list-%@-0-1-上海",cat_idStr];
    
    NSURL *url1 = [NSURL URLWithString:[str1 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];                        // UTF－8
    NSURLRequest *request1 = [NSURLRequest requestWithURL:url1];
    AFHTTPRequestOperation *operation1 = [[AFHTTPRequestOperation alloc]initWithRequest:request1];
    // 请求数据，设置成功与失败的回调函数
    [operation1 setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSString *html = operation.responseString;
        NSData *data1=[html dataUsingEncoding:NSUTF8StringEncoding];
        NSMutableDictionary *dict2=[NSJSONSerialization  JSONObjectWithData:data1 options:0 error:nil];
        if ([dict2[@"data"]count ]!=0) {
            
            NSMutableArray *arrs = [[NSMutableArray alloc] initWithArray:dict1[@"data"]];
            
            for (int b = 0; b<[dict2[@"data"] count]; b++) {
                [arrs addObject:dict2[@"data"][b]];
            }
            
            
            dict1[@"data"] = arrs;
            
            
            
        }

        [tabView reloadData];
        [tabView.mj_header endRefreshing];
    }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"发生错误123！%@",error);
    }];
    // 加入队列
    NSOperationQueue *queue1 = [[NSOperationQueue alloc] init];
    [queue1 addOperation:operation1];
    
}

-(void)ifNoData
{
    
    backgroundView = [[UIView alloc]initWithFrame:CGRectMake(0, 84, Width, Height-84)];
    [self.view addSubview:backgroundView];
    backgroundView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    
    UIImageView *imagV =[[UIImageView alloc]init];
    imagV.image = [UIImage imageNamed:@"哭"];
    [backgroundView addSubview:imagV];
    [imagV mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(backgroundView.mas_left).offset((Width-80)/2);
        make.right.equalTo(backgroundView.mas_right).offset(-(Width-80)/2);
        make.top.equalTo(backgroundView.mas_top).offset((backgroundView.frame.size.height-80)/2);
        make.height.equalTo(@80);
    }];
    
    
    UILabel *lab = [[UILabel alloc]init];
    [backgroundView addSubview:lab];
    lab.text = @"该分类还没有相关的商家";
    lab.textAlignment = 1;
    lab.font = [UIFont systemFontOfSize:15];
    lab.backgroundColor = [UIColor clearColor];
    [lab mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(imagV.mas_left).offset(-50);
        make.right.equalTo(imagV.mas_right).offset(50);
        make.top.equalTo(imagV.mas_bottom).offset(5);
        make.height.equalTo(@15);
    }];
    
    
    
    UILabel *label1 = [[UILabel alloc]init];
    [backgroundView addSubview:label1];
    label1.text = @"可以先去别的地方看看";
    label1.textAlignment = 1;
    label1.font = [UIFont systemFontOfSize:10];
    label1.textColor = [UIColor lightGrayColor];
    label1.backgroundColor = [UIColor clearColor];
    [label1 mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(imagV.mas_left).offset(-30);
        make.right.equalTo(imagV.mas_right).offset(30);
        make.top.equalTo(lab.mas_bottom).offset(5);
        make.height.equalTo(@15);
    }];
    
}




#pragma mark -----------------button下面的线以及button移动的效果-----------------------






-(void)topTitleBtnClick:(UIButton *)button
{
    [backgroundView removeFromSuperview];
    label.frame =CGRectMake(Width/9*2*button.tag,19 ,Width/9*2, 1);
    SC.contentOffset = CGPointMake(button.tag*Width, 0);

    cat_idStr = dict[@"data"][button.tag][@"cat_id"];
    [self companylist];
}
//- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
//{
//    if (scrollView == SC)
//    {
//        label.frame = CGRectMake(SC.contentOffset.x/Width*(Width/5), 19, Width/5, 1);
//        
//        CGFloat a =SC.contentOffset.x/Width*(Width/5);
//        CGFloat b =(Width-Width/5)/2;
//        
//        [UIView animateWithDuration:0.3 animations:^{
//            if (SC.contentOffset.x / Width < 3 || SC.contentOffset.x / Width > btn.tag - 3)
//            {
//                if (SC.contentOffset.x / Width < 3)
//                    sc.contentOffset = CGPointMake(0, 0);
//                if (SC.contentOffset.x / Width > btn.tag - 3)
//                    sc.contentOffset = CGPointMake(sc.contentSize.width - Width, 0);
//            }
//            else
//            {
//                sc.contentOffset = CGPointMake(a-b, 0);
//            }
//        }];
//        
//        
//        
//        
////        
//////        if(SC.contentOffset.x/WIDTH-4<0){
//////            sc.contentOffset =CGPointMake(SC.contentOffset.x/WIDTH*(WIDTH/6), 0);
//////        }
////        CGFloat a =SC.contentOffset.x/WIDTH*(WIDTH/6);
////        CGFloat b =(WIDTH-WIDTH/6)/2;
////        if (a>b)
////        {
////            if(btn.tag*WIDTH/6-a>b)
////            {
////            sc.contentOffset = CGPointMake(a-b, 0);
////            }
////            else if(a==0)
////            {
////                sc.contentOffset = CGPointMake(0, 0);
////            }
////        }
//    }
//    
//
//}


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
