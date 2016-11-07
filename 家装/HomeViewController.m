//
//  HomeViewController.m
//  家装
//
//  Created by mac on 16/5/3.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "HomeViewController.h"
#import "AppDelegate.h"
#import "WDZXViewController.h"
#import "ShopViewController.h"
#import "ZXGSViewController.h"
#import "SJFWViewController.h"
#import "SPXQViewController.h"
#import "StudyViewController.h"
#import "HomeTableViewCell.h"
#import "YHHDViewController.h"
#import "GroupShopViewController.h"
#import "SerachZXGSViewController.h"

@interface HomeViewController ()<UIScrollViewDelegate,UITableViewDataSource, UITableViewDelegate>

@end

@implementation HomeViewController
{
    UIScrollView *sc;
    UIPageControl *pc;
    UITableView *tabView;
    UIView *headerView;
    NSArray *arrSection;
    NSArray *arrRows;
    UIImageView *v1;
    UIImageView *v2;
    UIImageView *v3;
    UIImageView *v4;
    CGFloat scY;
    CGFloat v1X;
    CGFloat v1Y;
    
    //
    UIImageView *cell_scrollimageview;
    NSArray *home_imagearr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
//    self.navigationItem.backBarButtonItem = item;
    
    UIButton *rightButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0,20, 20)];
    [rightButton setImage:[UIImage imageNamed:@"sousuo"] forState:UIControlStateNormal];

    [rightButton addTarget:self action:@selector(touchUpSearchButton) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rightItem;

    
    home_imagearr = @[@"123",@"456",@"789",@"456",@"789",@"456",@"789"];
    
    tabView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tabView.delegate = self;
    tabView.dataSource = self;
    tabView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    tabView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tabView];
    [self initTableHeaderView];
    
    NSArray *arr = @[@"123.png",@"456.png",@"789"];
    sc = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 160)];
    sc.delegate = self;
    for (int i = 0; i<3; i++)
    {
        UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(i*sc.frame.size.width, 0,sc.frame.size.width , 160)];
        img.backgroundColor = [UIColor grayColor];
        
        NSString *str=[NSString stringWithFormat:@"http://jiazhuang.siruoit.com/index.php?mall/store/adv_list-上海"];
        
        NSURL *url = [NSURL URLWithString:[str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];                        // UTF－8
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc]initWithRequest:request];
        // 请求数据，设置成功与失败的回调函数
        [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSString *html = operation.responseString;
            NSData* data=[html dataUsingEncoding:NSUTF8StringEncoding];
            id dict=[NSJSONSerialization  JSONObjectWithData:data options:0 error:nil];
            //        NSLog(@"获取到的数据为1111：%@",dict);
            //        NSLog(@"sss:%@",dict[@"data"][0][@"title"]);
            NSString *str1 = dict[@"data"][0][@"thumb"];
            NSString *str2 = @"http://jiazhuang.siruoit.com";
            NSString *Str =[NSString stringWithFormat:@"%@%@",str2,str1];
//            NSLog(@"图片网址%@",Str);
            [img sd_setImageWithURL:[NSURL URLWithString:Str] placeholderImage:[UIImage imageNamed:@"shouyelunbotu"]];
        }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//            NSLog(@"发生错误！%@",error);
        }];
        // 加入队列
        NSOperationQueue *queue = [[NSOperationQueue alloc] init];
        [queue addOperation:operation];
//        img.image = [UIImage imageNamed:arr[i]];
        [sc addSubview:img];
    }
    sc.showsHorizontalScrollIndicator = NO;
    sc.contentSize = CGSizeMake(arr.count*sc.frame.size.width,0);
    [headerView addSubview:sc];
    sc.pagingEnabled = YES;
    pc = [[UIPageControl alloc]initWithFrame:CGRectMake(sc.frame.size.width/2-25, sc.frame.size.height-25, 50, 30)];
    pc.numberOfPages = 3;
    
    
    //计时器
    NSTimer *timer = [NSTimer timerWithTimeInterval:5 target:self selector:@selector(timer) userInfo:nil repeats:YES];
    NSRunLoop *runloop = [NSRunLoop currentRunLoop];
    [runloop addTimer:timer forMode:NSDefaultRunLoopMode];
    [headerView addSubview:pc];
    
    scY = CGRectGetMaxY(sc.frame);
    v1 = [[UIImageView alloc]initWithFrame:CGRectMake(20, scY+5, 40, 40)];
    v1.image = [UIImage imageNamed:@"shouye_wodezhuangxiu"];
    [v1 setUserInteractionEnabled:YES];
    [headerView addSubview:v1];
    UILabel *lab1 = [[UILabel alloc]init];
    lab1.text = @"我的装修";
    lab1.font = [UIFont systemFontOfSize:8];
    lab1.textColor = [UIColor blackColor];
    lab1.textAlignment = 1;
    [headerView addSubview:lab1];
    [lab1 mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(v1.mas_bottom);
        make.left.equalTo(v1.mas_left);
        make.right.equalTo(v1.mas_right);
        make.bottom.equalTo(headerView.mas_bottom);
}];
    
    UITapGestureRecognizer *v1tiaozhuan=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(toWDZX)];
   [v1 addGestureRecognizer:v1tiaozhuan];
    
    
    v1Y = CGRectGetMaxY(v1.frame);
    v1X = CGRectGetMaxX(v1.frame);
    v2 = [[UIImageView alloc]initWithFrame:CGRectMake(v1X+jiange, scY+5, 40, 40)];
    v2.image = [UIImage imageNamed:@"shouye_jiazhuang"];
    [v2 setUserInteractionEnabled:YES];
    [headerView addSubview:v2];
    UILabel *lab2 = [[UILabel alloc]init];
    lab2.text = @"学装修";
    lab2.font = [UIFont systemFontOfSize:8];
    lab2.textColor = [UIColor blackColor];
    lab2.textAlignment = 1;
    [headerView addSubview:lab2];
    [lab2 mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(v2.mas_bottom);
        make.left.equalTo(v2.mas_left);
        make.right.equalTo(v2.mas_right);
        make.bottom.equalTo(headerView.mas_bottom);
    }];
    UITapGestureRecognizer *v2tiaozhuan=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tostudy)];
    [v2 addGestureRecognizer:v2tiaozhuan];

    
    
    CGFloat v2X = CGRectGetMaxX(v2.frame);
    v3 = [[UIImageView alloc]initWithFrame:CGRectMake(v2X+jiange, scY+5, 40, 40)];
    v3.image = [UIImage imageNamed:@"shouye_zhuangxiu"];
    [v3 setUserInteractionEnabled:YES];
    [headerView addSubview:v3];
    UILabel *lab3 = [[UILabel alloc]init];
    lab3.text = @"装修公司";
    lab3.font = [UIFont systemFontOfSize:8];
    lab3.textColor = [UIColor blackColor];
    lab3.textAlignment = 1;
    [headerView addSubview:lab3];
    [lab3 mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(v3.mas_bottom);
        make.left.equalTo(v3.mas_left);
        make.right.equalTo(v3.mas_right);
        make.bottom.equalTo(headerView.mas_bottom);
    }];

    UITapGestureRecognizer *v3tiaozhuan=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(toZXGS)];
    [v3 addGestureRecognizer:v3tiaozhuan];
    
    

    
    CGFloat v3X = CGRectGetMaxX(v3.frame);
    v4 = [[UIImageView alloc]initWithFrame:CGRectMake(v3X+jiange, scY+5, 40, 40)];
    v4.image = [UIImage imageNamed:@"shouye_shangjia"];
    [v4 setUserInteractionEnabled:YES];
    [headerView addSubview:v4];
    UILabel *lab4 = [[UILabel alloc]init];
    lab4.text = @"商家服务";
    lab4.font = [UIFont systemFontOfSize:8];
    lab4.textColor = [UIColor blackColor];
    lab4.textAlignment = 1;
    [headerView addSubview:lab4];
    [lab4 mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(v4.mas_bottom);
        make.left.equalTo(v4.mas_left);
        make.right.equalTo(v4.mas_right);
        make.bottom.equalTo(headerView.mas_bottom);
    }];

    UITapGestureRecognizer *v4tiaozhuan=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(toSJFW)];
    [v4 addGestureRecognizer:v4tiaozhuan];


    // Do any additional setup after loading the view.
}

- (void)touchUpSearchButton{
    
    SerachZXGSViewController *view = [[SerachZXGSViewController alloc]init];
    view.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:view animated:YES];

}

-(void)toWDZX
{
    //跳转到我的装修
    WDZXViewController *ViewC = [[WDZXViewController alloc]init];
    ViewC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:ViewC animated:YES]; //跳转到下一页面
    
}

-(void)tostudy
{
    //跳转到学装修
    StudyViewController *viewStudy = [[StudyViewController alloc]init];
    viewStudy.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:viewStudy animated:YES];
    
}
-(void)toZXGS
{
    //跳转到装修公司
    ZXGSViewController *view = [[ZXGSViewController alloc]init];
    view.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:view animated:YES];
    
}
-(void)toSJFW
{
    //跳转到商家服务
    SJFWViewController *view = [[SJFWViewController alloc]init];
    view.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:view animated:YES];
}

-(void)initTableHeaderView
{
    headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,220)];
    headerView.backgroundColor = [UIColor whiteColor];
    tabView.tableHeaderView = headerView;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        return 40;
    }
    else
    {
        return 100;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

        static NSString *cellstr = @"cellstr";
        
        HomeTableViewCell *cell_temp = [tableView dequeueReusableCellWithIdentifier:cellstr];
        
        if (!cell_temp)
        {
            cell_temp = [[HomeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellstr];
        }
          cell_temp.selectionStyle = UITableViewCellSelectionStyleNone;//取消高亮

          if (indexPath.row==0) {
              UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Width, 40)];
              view1.backgroundColor = [UIColor groupTableViewBackgroundColor];
              [cell_temp addSubview:view1];
              
              
              cell_temp.lab = [[UILabel alloc]init];
              cell_temp.lab.font = [UIFont systemFontOfSize:15];
              [cell_temp addSubview:cell_temp.lab];
              cell_temp.lab.backgroundColor = [UIColor whiteColor];
              [cell_temp.lab mas_makeConstraints:^(MASConstraintMaker *make){
                  make.left.equalTo(cell_temp.mas_left);
                  make.right.equalTo(cell_temp.mas_right);
                  make.top.equalTo(cell_temp.mas_top).offset(5);
                  make.bottom.equalTo(cell_temp.mas_bottom).offset(-2);
                  
              }];
              
          cell_temp.lab.text = @"今日推荐";
              
          }else if(indexPath.row==1){
              cell_temp.lab1.text = @"优惠活动";
              UITapGestureRecognizer *YHHD=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(toYHHD)];
              cell_temp.imagV.image = [UIImage imageNamed:@"优惠活动.jpg"];
              [cell_temp.imagV addGestureRecognizer:YHHD];
        
          }else{
          
              cell_temp.lab1.text = @"团装优惠";
              UITapGestureRecognizer *GroupShop=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(toGroupShop)];
              cell_temp.imagV.image = [UIImage imageNamed:@"团装.jpg"];
              [cell_temp.imagV addGestureRecognizer:GroupShop];

          }
    

        return cell_temp;
}

-(void)timer
{
    long page = pc.currentPage;
    if(page+1 == pc.numberOfPages)
    {
   
        pc.currentPage = 0;
        page = pc.currentPage;
    }else
    {
        page++;
    }
    [UIView animateWithDuration:0.5 animations:^{
        sc.contentOffset =CGPointMake(page*sc.frame.size.width, 0);
    }];
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //偏移超过一半滚到下一个imageView
    if ((sc.contentOffset.x+sc.frame.size.width/2)/sc.frame.size.width)
    {
        pc.currentPage = (sc.contentOffset.x+sc.frame.size.width/2)/sc.frame.size.width;
    }
    //    NSLog(@"ssss");
}

-(void)toYHHD
{
    self.hidesBottomBarWhenPushed = YES;
    YHHDViewController *view = [[YHHDViewController alloc]init];
    [self.navigationController pushViewController:view animated:YES];
    self.hidesBottomBarWhenPushed = NO;

    
}
-(void)toGroupShop
{
    self.hidesBottomBarWhenPushed = YES;
    GroupShopViewController *view = [[GroupShopViewController alloc]init];
    [self.navigationController pushViewController:view animated:YES];
    self.hidesBottomBarWhenPushed = NO;

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
