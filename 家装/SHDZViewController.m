//
//  SHDZViewController.m
//  家装
//
//  Created by mac on 16/5/13.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "SHDZViewController.h"
#import "Masonry.h"
#import "CreateAddressViewController.h"
#import "AddressTableViewCell.h"

@interface SHDZViewController ()<UITableViewDelegate,UITableViewDataSource> {
    
    UITableView *tbView;
    NSMutableArray *_dataArray;
}
@end

@implementation SHDZViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"收货地址";
    self.view.backgroundColor = [UIColor whiteColor];
    tbView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tbView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    tbView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tbView];
    tbView.delegate = self;
    tbView.dataSource = self;
    #pragma mark -----------------自定义黄色button-----------------------
    //button    黄色button
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor orangeColor];
    [tbView addSubview:btn];
    [btn addTarget:self action:@selector(addAddress) forControlEvents:UIControlEventTouchUpInside];
    [btn setImage:[UIImage imageNamed:@"组-5"] forState:UIControlStateNormal];
    btn.layer.cornerRadius = 20.0;
    btn.layer.shadowOffset = CGSizeMake(1, 1);
    btn.layer.shadowOpacity = 0.8;
    [btn mas_makeConstraints:^(MASConstraintMaker *make){
        make.bottom.equalTo(self.view.mas_bottom).offset(-20);
        make.height.equalTo(@40);
        make.width.equalTo(@40);
        make.centerX.equalTo(self.view.mas_centerX);
}];

    // Do any additional setup after loading the view.
    _dataArray = [NSMutableArray array];
    
    [_dataArray addObjectsFromArray:@[@"1",@"2",@"2",@"2",@"2",@"2",@"2",@"2",@"2",@"2"]];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 70;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identi = @"Cell";
    
    AddressTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identi];
    
    if (cell == nil) {
        cell = [[AddressTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identi];
    }
    
    cell.backgroundColor = [UIColor groupTableViewBackgroundColor];
    cell.selectionStyle = NO;
    
    
    [cell.button1 addTarget:self action:@selector(button1Click:) forControlEvents:UIControlEventTouchUpInside];
    [cell.button2 addTarget:self action:@selector(button2Click:) forControlEvents:UIControlEventTouchUpInside];
    [cell.button3 addTarget:self action:@selector(button3Click:) forControlEvents:UIControlEventTouchUpInside];
    
    [cell showData:@"" IndexPath:indexPath];
    
    return cell;
}


- (void)addAddress{
    CreateAddressViewController *controller = [[CreateAddressViewController alloc] initWithNibName:@"CreateAddressViewController" bundle:nil];

    controller.navigationItem.title = @"创建地址";
    controller.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:controller animated:YES];
    
    
//    CreateAddressVC *vc = [[CreateAddressVC alloc] init];
//    [self.navigationController pushViewController:vc animated:YES];
}

- (void)button1Click:(UIButton *)sender {
    
}

- (void)button2Click:(UIButton *)sender {
    CreateAddressViewController *controller = [[CreateAddressViewController alloc] initWithNibName:@"CreateAddressViewController" bundle:nil];
    
    controller.navigationItem.title = @"编辑地址";
    controller.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:controller animated:YES];
    
}

- (void)button3Click:(UIButton *)sender {
    
    NSInteger row = sender.tag - 3000;
    [_dataArray removeObjectAtIndex:row];
    [tbView reloadData];
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
