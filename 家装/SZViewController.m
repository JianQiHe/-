//
//  SZViewController.m
//  家装
//
//  Created by mac on 16/5/14.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "SZViewController.h"
#import "ChangePasswordViewController.h"
#import "SZTableViewCell.h"
#import "AboutUs.h"
#import "PayPassWord.h"

#import "Danli.h"
#import "MBProgressHUD+NJ.h"
#import "GRZLViewController.h"
@interface SZViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (retain , nonatomic) Danli* instance;

@end

@implementation SZViewController
{
    NSMutableArray *titlearray;
    UITableView *tabView;
}

- (void)viewDidLoad {
    self.title = @"设置";
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    tabView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    tabView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:tabView];
    tabView.delegate = self;
    tabView.dataSource = self;
    
    tabView.separatorStyle = UITableViewCellSeparatorStyleNone;

    titlearray = [[NSMutableArray alloc] initWithObjects:@"安全设置", @"系统设置", nil];
    
    
    self.instance = [Danli sharedInstance];
    // Do any additional setup after loading the view.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 1)
    {
        return 3;
    }
    else
    return 2;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1 && indexPath.row ==2)
    {
        return 60;
    }else
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    return 30;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.00001;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
 
    NSArray *arr1 = @[@"支付密码",@"修改密码"];
    NSArray *arr2 = @[@"关于我们",@"检查更新"];
    if (indexPath.section==0) {
        UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        cell.textLabel.text= arr1[indexPath.row];
        UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(5, cell.frame.size.height, Width-10, 1)];
        [cell addSubview:lab];
        lab.backgroundColor = [UIColor groupTableViewBackgroundColor];
        return cell;
    }
    else{
        if (indexPath.row==2) {
            static NSString *CellIdentifier = @"SZTableViewCell";
            SZTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            if (!cell)
            {
                cell = [[SZTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            }
            //
            cell.backgroundColor = [UIColor groupTableViewBackgroundColor];
            cell.selectionStyle = NO;
            [cell.btn addTarget:self action:@selector(logof) forControlEvents:UIControlEventTouchUpInside];
            return cell;
        }else
        {
            UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
            cell.textLabel.text= arr2[indexPath.row];
            UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(5, cell.frame.size.height-2, Width-10, 1)];
            [cell addSubview:lab];
            if (indexPath.row==1&&indexPath.section==1) {
                UILabel *lab = [[UILabel alloc]init];
                lab.text = @"当前版本1.0.0";
                lab.lineBreakMode = NSLineBreakByWordWrapping;
                lab.font = [UIFont systemFontOfSize:9];
                [cell addSubview:lab];
                [lab mas_makeConstraints:^(MASConstraintMaker *make){
                    make.right.equalTo(cell.mas_right).offset(-10);
                    make.height.equalTo(cell.mas_height);
                    make.top.equalTo(cell.mas_top);
                }];
            }
            lab.backgroundColor = [UIColor groupTableViewBackgroundColor];
            return cell;

        }

    }
    
}

//    cell.backgroundColor = [UIColor whiteColor];
    
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section) {
            
        case 0:
            return [titlearray objectAtIndex:section];//提取标题数组的元素用来显示标题
        case 1:
            return [titlearray objectAtIndex:section];//提取标题数组的元素用来显示标题
        default:
            return @"Unknown";
            
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0&&indexPath.row==1) {
        ChangePasswordViewController *view = [[ChangePasswordViewController alloc]init];
        view.hidesBottomBarWhenPushed = YES;
        view.navigationItem.title = @"修改密码";
        [self.navigationController pushViewController:view animated:YES];
    }else if(indexPath.section==0&&indexPath.row==0)
    {
        PayPassWord *view = [[PayPassWord alloc]init];
        view.hidesBottomBarWhenPushed = YES;
        view.navigationItem.title = @"修改支付密码";
        [self.navigationController pushViewController:view animated:YES];
        NSLog(@"这个是支付密码");
    }
    else if (indexPath.section==1&&indexPath.row==1)
    {
        NSLog(@"You can't do it thats wrong");
    }
    else
    {
        self.hidesBottomBarWhenPushed = YES;
        AboutUs *view = [[AboutUs alloc]init];
        [self.navigationController pushViewController:view animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    }
    
}
-(void)logof
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"User"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    self.instance.status = @"注销成功";
    [MBProgressHUD showSuccess:@"注销成功!"];
    

    [self.navigationController popViewControllerAnimated:YES];
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
