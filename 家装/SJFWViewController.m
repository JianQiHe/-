//
//  SJFWViewController.m
//  家装
//
//  Created by mac on 16/6/23.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "SJFWViewController.h"
#import "DesignViewController.h"
#import "StudyViewController.h"
#import "WorkerViewController.h"
#import "ZXGSViewController.h"
#import "XiaoquViewController.h"
#import "GroupShopViewController.h"
#import "CaseViewController.h"

@interface SJFWViewController ()<UIScrollViewDelegate>

@end

@implementation SJFWViewController
{
    UIScrollView *scr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = item;
    
    
    self.title = @"商家服务";
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    scr = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, Width, Height)];
    scr.delegate = self;
    scr.showsHorizontalScrollIndicator = NO;
    scr.contentSize = CGSizeMake(0, 0);
    [self.view addSubview:scr];
    
    
#pragma mark -----------------button-----------------------
    //公司
    UIButton *company = [UIButton buttonWithType:UIButtonTypeCustom];
    company.backgroundColor = [UIColor whiteColor];
    [scr addSubview:company];
    [company setTitle:@"公司" forState:UIControlStateNormal];
    [company setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    company.layer.cornerRadius = 3;
    company.layer.borderWidth = 1;
    company.layer.borderColor=[UIColor lightGrayColor].CGColor;
    [company addTarget:self action:@selector(tocompany) forControlEvents:UIControlEventTouchUpInside];
    
//商铺
    UIButton *shop = [UIButton buttonWithType:UIButtonTypeCustom];
    shop.backgroundColor = [UIColor whiteColor];
    [scr addSubview:shop];
    [shop setTitle:@"商铺" forState:UIControlStateNormal];
    [shop setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    shop.layer.cornerRadius = 3;
    shop.layer.borderWidth = 1;
    shop.layer.borderColor=[UIColor lightGrayColor].CGColor;
    [shop addTarget:self action:@selector(toshop) forControlEvents:UIControlEventTouchUpInside];

    
 //商品
    UIButton *goods = [UIButton buttonWithType:UIButtonTypeCustom];
    goods.backgroundColor = [UIColor whiteColor];
    [scr addSubview:goods];
    [goods setTitle:@"商品" forState:UIControlStateNormal];
    [goods setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    goods.layer.cornerRadius = 3;
    goods.layer.borderWidth = 1;
    goods.layer.borderColor=[UIColor lightGrayColor].CGColor;
    
    [goods addTarget:self action:@selector(togoods) forControlEvents:UIControlEventTouchUpInside];
    
    
//设计师
    UIButton *design = [UIButton buttonWithType:UIButtonTypeCustom];
    design.backgroundColor = [UIColor whiteColor];
    [scr addSubview:design];
    [design setTitle:@"设计师" forState:UIControlStateNormal];
    [design setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    design.layer.cornerRadius = 3;
    design.layer.borderWidth = 1;
    design.layer.borderColor=[UIColor lightGrayColor].CGColor;
    [design addTarget:self action:@selector(todesign) forControlEvents:UIControlEventTouchUpInside];

    
    
    
//技工
    UIButton *worker = [UIButton buttonWithType:UIButtonTypeCustom];
    worker.backgroundColor = [UIColor whiteColor];
    [scr addSubview:worker];
    [worker setTitle:@"技工" forState:UIControlStateNormal];
    [worker setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    worker.layer.cornerRadius = 3;
    worker.layer.borderWidth = 1;
    worker.layer.borderColor=[UIColor lightGrayColor].CGColor;
    [worker addTarget:self action:@selector(toworker) forControlEvents:UIControlEventTouchUpInside];
    
    
    
//案例
    UIButton *case1 = [UIButton buttonWithType:UIButtonTypeCustom];
    case1.backgroundColor = [UIColor whiteColor];
    [scr addSubview:case1];
    [case1 setTitle:@"案例" forState:UIControlStateNormal];
    [case1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    case1.layer.cornerRadius = 3;
    case1.layer.borderWidth = 1;
    case1.layer.borderColor=[UIColor lightGrayColor].CGColor;
    [case1 addTarget:self action:@selector(showCase) forControlEvents:UIControlEventTouchUpInside];
    
    
 //小区
    UIButton *xiaoqu = [UIButton buttonWithType:UIButtonTypeCustom];
    xiaoqu.backgroundColor = [UIColor whiteColor];
    [scr addSubview:xiaoqu];
    [xiaoqu setTitle:@"小区" forState:UIControlStateNormal];
    [xiaoqu setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    xiaoqu.layer.cornerRadius = 3;
    xiaoqu.layer.borderWidth = 1;
    xiaoqu.layer.borderColor=[UIColor lightGrayColor].CGColor;
    [xiaoqu addTarget:self action:@selector(toxiaoqu) forControlEvents:UIControlEventTouchUpInside];

    
    
  //工地
//    UIButton *gongdi = [UIButton buttonWithType:UIButtonTypeCustom];
//    gongdi.backgroundColor = [UIColor whiteColor];
//    [scr addSubview:gongdi];
//    [gongdi setTitle:@"工地" forState:UIControlStateNormal];
//    [gongdi setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    gongdi.layer.cornerRadius = 3;
//    gongdi.layer.borderWidth = 1;
//    gongdi.layer.borderColor=[UIColor lightGrayColor].CGColor;
//    [gongdi addTarget:self action:@selector(togongdi) forControlEvents:UIControlEventTouchUpInside];

    
    
 //团装
    UIButton *tuanzhuang = [UIButton buttonWithType:UIButtonTypeCustom];
    tuanzhuang.backgroundColor = [UIColor whiteColor];
    [scr addSubview:tuanzhuang];
    [tuanzhuang setTitle:@"团装" forState:UIControlStateNormal];
    [tuanzhuang setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    tuanzhuang.layer.cornerRadius = 3;
    tuanzhuang.layer.borderWidth = 1;
    tuanzhuang.layer.borderColor=[UIColor lightGrayColor].CGColor;
    [tuanzhuang addTarget:self action:@selector(totuanzhuang) forControlEvents:UIControlEventTouchUpInside];

    
    
    
//学装修
    UIButton *study = [UIButton buttonWithType:UIButtonTypeCustom];
    study.backgroundColor = [UIColor whiteColor];
    [scr addSubview:study];
    [study setTitle:@"学装修" forState:UIControlStateNormal];
    [study setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    study.layer.cornerRadius = 3;
    study.layer.borderWidth = 1;
    study.layer.borderColor=[UIColor lightGrayColor].CGColor;
    [study addTarget:self action:@selector(tostudy) forControlEvents:UIControlEventTouchUpInside];
#pragma mark -----------------约束-----------------------
    
    //第一行
    [company mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.view.mas_left).offset(15);
        make.top.equalTo(self.view.mas_top).offset(79);
        make.height.equalTo(company.mas_width);
        make.width.equalTo(shop.mas_width);
//        make.width.equalTo(@50);
//        make.height.equalTo(@50);
}];

    [shop mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(company.mas_right).offset(20);
        make.top.equalTo(company.mas_top);
        make.height.equalTo(company.mas_height);
        make.width.equalTo(goods.mas_width);

}];

    [goods mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(shop.mas_right).offset(20);
        make.top.equalTo(shop.mas_top);
        make.right.equalTo(self.view.mas_right).offset(-15);
        make.height.equalTo(shop.mas_height);
}];

    //第二行
    [design mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.view.mas_left).offset(15);
        make.top.equalTo(company.mas_bottom).offset(20);
        make.height.equalTo(design.mas_width);
        make.width.equalTo(worker.mas_width);
        //        make.width.equalTo(@50);
        //        make.height.equalTo(@50);
    }];
    
    [worker mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(design.mas_right).offset(20);
        make.top.equalTo(design.mas_top);
        make.height.equalTo(design.mas_height);
        make.width.equalTo(case1.mas_width);
        
    }];
    
    [case1 mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(worker.mas_right).offset(20);
        make.top.equalTo(worker.mas_top);
        make.right.equalTo(self.view.mas_right).offset(-15);
        make.height.equalTo(worker.mas_height);
    }];
    
    
    //第三行
    [xiaoqu mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.view.mas_left).offset(15);
        make.top.equalTo(design.mas_bottom).offset(20);
        make.height.equalTo(xiaoqu.mas_width);
        make.width.equalTo(worker.mas_width);
        //        make.width.equalTo(@50);
        //        make.height.equalTo(@50);
    }];
    
    [tuanzhuang mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(xiaoqu.mas_right).offset(20);
        make.top.equalTo(xiaoqu.mas_top);
        make.height.equalTo(xiaoqu.mas_height);
        make.width.equalTo(study.mas_width);
        
    }];
    
    [study mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(tuanzhuang.mas_right).offset(20);
        make.top.equalTo(tuanzhuang.mas_top);
        make.right.equalTo(self.view.mas_right).offset(-15);
        make.height.equalTo(tuanzhuang.mas_height);
    }];
    

    
//    [xiaoqu mas_makeConstraints:^(MASConstraintMaker *make){
//        make.left.equalTo(self.view.mas_left).offset(15);
//        make.top.equalTo(design.mas_bottom).offset(20);
//        make.height.equalTo(xiaoqu.mas_width);
//        make.width.equalTo(tuanzhuang.mas_width);
////                make.width.equalTo(@50);
////                make.height.equalTo(@50);
//    }];
    
//    [gongdi mas_makeConstraints:^(MASConstraintMaker *make){
//        make.left.equalTo(xiaoqu.mas_right).offset(20);
//        make.top.equalTo(xiaoqu.mas_top);
//        make.height.equalTo(xiaoqu.mas_height);
//        make.width.equalTo(tuanzhuang.mas_width);
//        
//    }];
//    [tuanzhuang mas_makeConstraints:^(MASConstraintMaker *make){
//        make.left.equalTo(xiaoqu.mas_right).offset(20);
//        make.top.equalTo(xiaoqu.mas_top);
//        make.height.equalTo(xiaoqu.mas_height);
//        make.width.equalTo(tuanzhuang.mas_width);
//        
//    }];
//    
//
//    
//    [study mas_makeConstraints:^(MASConstraintMaker *make){
//        make.left.equalTo(tuanzhuang.mas_right).offset(20);
//        make.top.equalTo(tuanzhuang.mas_top);
//        make.right.equalTo(self.view.mas_right).offset(-15);
//        make.height.equalTo(tuanzhuang.mas_height);
//    }];
    
   
    
    //第四行
//    
//    [study mas_makeConstraints:^(MASConstraintMaker *make){
//        make.left.equalTo(self.view.mas_left).offset(15);
//        make.top.equalTo(xiaoqu.mas_bottom).offset(20);
//        make.height.equalTo(xiaoqu.mas_width);
//        make.width.equalTo(xiaoqu.mas_width);
//        //        make.width.equalTo(@50);
//        //        make.height.equalTo(@50);
//    }];
    // Do any additional setup after loading the view.
}
#pragma mark -----------------方法-----------------------
-(void)togoods
{

    self.tabBarController.selectedIndex = 1;
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)todesign
{
    self.hidesBottomBarWhenPushed = YES;
    DesignViewController *view = [[DesignViewController alloc]init];
    [self.navigationController pushViewController:view animated:YES];
}
-(void)tostudy
{
    StudyViewController * studyView = [[StudyViewController alloc]init];
    studyView.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:studyView animated:YES];
}
-(void)toworker
{
    self.hidesBottomBarWhenPushed = YES;
    WorkerViewController *view = [[WorkerViewController alloc]init];
    [self.navigationController pushViewController:view animated:YES];
    
}
-(void)tocompany
{
    self.hidesBottomBarWhenPushed = YES;
    ZXGSViewController *view = [[ZXGSViewController alloc]init];
    [self.navigationController pushViewController:view animated:YES];
}
- (void)showCase{
    self.hidesBottomBarWhenPushed = YES;
    WorkerViewController *view = [[WorkerViewController alloc]init];
    view.strType = @"案例";
    [self.navigationController pushViewController:view animated:YES];

}
-(void)toxiaoqu
{
    self.hidesBottomBarWhenPushed = YES;
    XiaoquViewController *view = [[XiaoquViewController alloc]init];
    [self.navigationController pushViewController:view animated:YES];

}
-(void)togongdi
{
    self.hidesBottomBarWhenPushed = YES;
    XiaoquViewController *view = [[XiaoquViewController alloc]init];
    [self.navigationController pushViewController:view animated:YES];
}
-(void)toshop
{
    self.tabBarController.selectedIndex = 2;
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)totuanzhuang
{
    self.hidesBottomBarWhenPushed = YES;
    GroupShopViewController *view = [[GroupShopViewController alloc]init];
    [self.navigationController pushViewController:view animated:YES];
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
