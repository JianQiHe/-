//
//  WDZXViewController.m
//  家装
//
//  Created by mac on 16/5/10.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "WDZXViewController.h"
#import "HomeViewController.h"
#import "Masonry.h"
#import "MFZBViewController.h"
#import "JCZBViewController.h"
#import "MFSJViewController.h"
#import "MFBJViewController.h"
#import "MFLFViewController.h"
#import "ZXBViewController.h"
@interface WDZXViewController ()

@end

@implementation WDZXViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    UIButton *leftButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
    [leftButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [leftButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateHighlighted];
    leftButton.titleLabel.textColor = [UIColor redColor];
    [leftButton setImageEdgeInsets:UIEdgeInsetsMake(0, -30, 0, 0)];
    [leftButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = leftItem;
    
//    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
//    self.navigationItem.rightBarButtonItem = rightItem;

//    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"dianwo" style:UIBarButtonItemStylePlain target:self action:nil];
//    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
//    
//    leftBarButtonItem.tintColor = [UIColor whiteColor];

    self.navigationItem.title = @"我的装修";
    
    UITableView *wdzxTbview = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    wdzxTbview.backgroundColor = [UIColor groupTableViewBackgroundColor];
    wdzxTbview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:wdzxTbview];
    
    UIImageView *MFZB = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ico1"]];
    [wdzxTbview addSubview:MFZB];
    [MFZB setUserInteractionEnabled:YES];
    UITapGestureRecognizer *toMFZB=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(toMFZB)];
    [MFZB addGestureRecognizer:toMFZB];
    
    
    
    
    UIImageView *JCZB = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ico2"]];
    [wdzxTbview addSubview:JCZB];
    [JCZB setUserInteractionEnabled:YES];
    UITapGestureRecognizer *toJCZB=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(toJCZB)];
    [JCZB addGestureRecognizer:toJCZB];

    
    
    
    UIImageView *MFSJ = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ico3"]];
    [wdzxTbview addSubview:MFSJ];
    [MFSJ setUserInteractionEnabled:YES];
    UITapGestureRecognizer *toMFSJ=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(toMFSJ)];
    [MFSJ addGestureRecognizer:toMFSJ];

    
    
    UIImageView *MFBJ = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ico4"]];
    [wdzxTbview addSubview:MFBJ];
    [MFBJ setUserInteractionEnabled:YES];
    UITapGestureRecognizer *toMFBJ=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(toMFBJ)];
    [MFBJ addGestureRecognizer:toMFBJ];
    
    

    
    UIImageView *MFLF = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ico5"]];
    [wdzxTbview addSubview:MFLF];
    [MFLF setUserInteractionEnabled:YES];
    UITapGestureRecognizer *toMFLF=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(toMFLF)];
    [MFLF addGestureRecognizer:toMFLF];

    
    
    
    UIImageView *ZXB = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ico6"]];
    [wdzxTbview addSubview:ZXB];
    [ZXB setUserInteractionEnabled:YES];
    UITapGestureRecognizer *toZXB=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(toZXB)];
    [ZXB addGestureRecognizer:toZXB];
    
    
    
    #pragma mark -----------------适配-----------------------
    if (Height==480) {
        [MFZB mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.equalTo(wdzxTbview.mas_top).offset(10);
            make.left.equalTo(wdzxTbview.mas_left).offset(30);
            make.height.equalTo(MFZB.mas_width);
            make.width.equalTo(JCZB.mas_width);
        }];
        
        [JCZB mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.equalTo(MFZB.mas_top);
            make.right.equalTo(self.view.mas_right).offset(-30);
            make.left.equalTo(MFZB.mas_right).offset(25);
            make.height.equalTo(MFZB.mas_width);
        }];
        
        
        [MFSJ mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.equalTo(MFZB.mas_bottom).offset(20);
            make.left.equalTo(wdzxTbview.mas_left).offset(30);
            make.height.equalTo(MFSJ.mas_width);
            make.width.equalTo(MFBJ.mas_width);
        }];
        
        
        [MFBJ mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.equalTo(MFSJ.mas_top);
            make.right.equalTo(self.view.mas_right).offset(-30);
            make.left.equalTo(MFSJ.mas_right).offset(25);
            make.height.equalTo(MFSJ.mas_width);
        }];
        
        
        
        [MFLF mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.equalTo(MFSJ.mas_bottom).offset(20);
            make.left.equalTo(wdzxTbview.mas_left).offset(30);
            make.height.equalTo(MFLF.mas_width);
            make.width.equalTo(ZXB.mas_width);
            
        }];
        
        
        [ZXB mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.equalTo(MFLF.mas_top);
            make.right.equalTo(self.view.mas_right).offset(-30);
            make.left.equalTo(MFLF.mas_right).offset(25);
            make.height.equalTo(MFLF.mas_width);
        }];

    }else
    {
        [MFZB mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.equalTo(wdzxTbview.mas_top).offset(20);
            make.left.equalTo(wdzxTbview.mas_left).offset(20);
            make.height.equalTo(MFZB.mas_width);
            make.width.equalTo(JCZB.mas_width);
        }];
        
        [JCZB mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.equalTo(MFZB.mas_top);
            make.right.equalTo(self.view.mas_right).offset(-20);
            make.left.equalTo(MFZB.mas_right).offset(25);
            make.height.equalTo(MFZB.mas_width);
        }];
        
        
        [MFSJ mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.equalTo(MFZB.mas_bottom).offset(20);
            make.left.equalTo(wdzxTbview.mas_left).offset(20);
            make.height.equalTo(MFSJ.mas_width);
            make.width.equalTo(MFBJ.mas_width);
        }];
        
        
        [MFBJ mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.equalTo(MFSJ.mas_top);
            make.right.equalTo(self.view.mas_right).offset(-20);
            make.left.equalTo(MFSJ.mas_right).offset(25);
            make.height.equalTo(MFSJ.mas_width);
        }];
        
        
        
        [MFLF mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.equalTo(MFSJ.mas_bottom).offset(20);
            make.left.equalTo(wdzxTbview.mas_left).offset(20);
            make.height.equalTo(MFLF.mas_width);
            make.width.equalTo(ZXB.mas_width);
            
        }];
        
        
        [ZXB mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.equalTo(MFLF.mas_top);
            make.right.equalTo(self.view.mas_right).offset(-20);
            make.left.equalTo(MFLF.mas_right).offset(25);
            make.height.equalTo(MFLF.mas_width);
        }];
        
    }
    
    
    // Do any additional setup after loading the view.
}
- (void)back{
    
    [self.navigationController popViewControllerAnimated:YES];

}
-(void)toMFZB
{
//    self.hidesBottomBarWhenPushed = YES;
    MFZBViewController *view = [[MFZBViewController alloc]init];
    [self.navigationController pushViewController:view animated:YES];
}
-(void)toJCZB
{
//    self.hidesBottomBarWhenPushed = YES;
    JCZBViewController *view = [[JCZBViewController alloc]init];
    [self.navigationController pushViewController:view animated:YES];
}
-(void)toMFSJ
{
//    self.hidesBottomBarWhenPushed = YES;
    MFSJViewController *view = [[MFSJViewController alloc]init];
    [self.navigationController pushViewController:view animated:YES];

}
-(void)toMFBJ
{
//    self.hidesBottomBarWhenPushed = YES;
    MFBJViewController *view = [[MFBJViewController alloc]init];
    [self.navigationController pushViewController:view animated:YES];

}

-(void)toMFLF
{
    self.hidesBottomBarWhenPushed = YES;
    MFLFViewController *view = [[MFLFViewController alloc]init];
    [self.navigationController pushViewController:view animated:YES];
}
-(void)toZXB
{
    self.hidesBottomBarWhenPushed = YES;
    ZXBViewController *view = [[ZXBViewController alloc]init];
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
