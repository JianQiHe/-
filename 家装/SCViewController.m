//
//  SCViewController.m
//  家装
//
//  Created by mac on 16/5/3.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "SCViewController.h"
#import "SCViewTableViewCell.h"
#import "ShoppingcarModel.h"
@interface SCViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation SCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    ShoppingCartViewController *shoppingcart = [[ShoppingCartViewController alloc] init];
//    [self.navigationController pushViewController:shoppingcart animated:YES];

    UITableView *view = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:view];
    view.delegate = self;
    view.dataSource = self;
    view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    view.separatorStyle = UITableViewCellSeparatorStyleNone;

    
    // Do any additional setup after loading the view.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cellstr = @"cellstr";
    
     SCViewTableViewCell *cell_temp = [tableView dequeueReusableCellWithIdentifier:cellstr];
    
    if (!cell_temp)
    {
        cell_temp = [[SCViewTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellstr];
    }
    
    cell_temp.backgroundColor = [UIColor clearColor];
    cell_temp.selectionStyle = UITableViewCellSelectionStyleNone;//取消高亮
    

    return cell_temp;
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
