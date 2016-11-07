//
//  WDDDViewController.m
//  家装
//
//  Created by mac on 16/5/13.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "WDDDViewController.h"
#import "Masonry.h"
#import "GWDDViewController.h"
#import "YYDDViewController.h"
#import "TKDDViewController.h"
@interface WDDDViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation WDDDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的订单";
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    UITableView *tabview = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tabview.backgroundColor = [UIColor groupTableViewBackgroundColor];
    tabview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tabview];
    tabview.delegate = self;
    tabview.dataSource = self;
    // Do any additional setup after loading the view.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
 
    return 70;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *arr = @[@"购物订单",@"预约订单",@"退款/售后订单"];
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = NO;
    UIView *View = [[UIView alloc]init];
    View.backgroundColor = [UIColor whiteColor];
    [cell addSubview:View];
    [View mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(cell.mas_top);
        make.left.equalTo(cell.mas_left);
        make.right.equalTo(cell.mas_right);
        make.bottom.equalTo(cell.mas_bottom).offset(-5);
}];
    UILabel *lab = [[UILabel alloc]init];
    lab.text = arr[indexPath.row];
    lab.numberOfLines = 0;
    lab.textAlignment = 1;
    lab.lineBreakMode = NSLineBreakByTruncatingTail;
    lab.textColor = [UIColor blackColor];
    lab.backgroundColor = [UIColor whiteColor];
    [cell addSubview:lab];
    [lab mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(cell.mas_top).offset(25);
        make.left.equalTo(cell.mas_left).offset(25);
        make.bottom.equalTo(cell.mas_bottom).offset(-25);
}];


    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0)
    {
        self.hidesBottomBarWhenPushed = YES;
        GWDDViewController *view = [[GWDDViewController alloc]init];
        [self.navigationController pushViewController:view animated:YES];
    }
    else if(indexPath.row==1)
    {
        self.hidesBottomBarWhenPushed = YES;
        YYDDViewController *view = [[YYDDViewController alloc]init];
        [self.navigationController pushViewController:view animated:YES];
    }
    else
    {
        self.hidesBottomBarWhenPushed = YES;
        TKDDViewController *view = [[TKDDViewController alloc]init] ;
        [self.navigationController pushViewController:view animated:YES];
     }
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
