//
//  LoginsuccessViewController.m
//  家装
//
//  Created by mac on 16/6/17.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "LoginsuccessViewController.h"
#import "TZImagePickerController.h"
#import "RechargeMoneyViewController.h"

@interface LoginsuccessViewController ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource,TZImagePickerControllerDelegate,UITextFieldDelegate>

{
    NSMutableArray *btnMutableArray;
    UITableView *tbview;
    UIScrollView *scrollView;
    UITableView *tabview;
    NSMutableArray *_userImg;
    UIImageView *_imgv;
    
    NSDictionary *dic;
}

@end

@implementation LoginsuccessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _userImg = [NSMutableArray array];
    tbview = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tbview.backgroundColor = [UIColor groupTableViewBackgroundColor];
    tbview.separatorStyle = NO;
    //去除分割线
    [self.view addSubview:tbview];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.title = @"个人资料";
    UIView *view = [[UIView alloc]init];
    view.frame = CGRectMake(0, 0, self.view.frame.size.width, 80);
    view.backgroundColor = [UIColor whiteColor];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(changeUserImg)];
    [view addGestureRecognizer:tap];
    [tbview addSubview:view];
    
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
     dic = [userDefaults objectForKey:@"User"];
    
    
    _imgv = [[UIImageView alloc]init];
    [view addSubview:_imgv];
    NSString *imgvStr = [NSString stringWithFormat:@"http://jiazhuang.siruoit.com/attachs/%@",dic[@"data"][0][@"face"]];
    [_imgv sd_setImageWithURL:[NSURL URLWithString:imgvStr] placeholderImage:[UIImage imageNamed:@"imgv"]];
    
    if ([userDefaults objectForKey:@"UserPhoto"] != nil) {
        _imgv.image = [UIImage imageWithData:[userDefaults objectForKey:@"UserPhoto"]];
    }
    
    _imgv.layer.cornerRadius = 25;
    [_imgv mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(view.mas_top).offset(15);
        make.left.equalTo(view.mas_left).offset(20);
        make.bottom.equalTo(view.mas_bottom).offset(-15);
        make.width.equalTo(@50);
    }];
    
    
    UILabel *from_titlelab = [[UILabel alloc]init];
    [view addSubview:from_titlelab];
    NSString *from_titlelabStr = [NSString stringWithFormat:@"商家类型 :%@",dic[@"data"][0][@"from_title"]];
    from_titlelab.text = from_titlelabStr;
    from_titlelab.font = [UIFont systemFontOfSize:10];
    from_titlelab.lineBreakMode = NSLineBreakByWordWrapping;
    [from_titlelab mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(_imgv.mas_right).offset(10);
        make.top.equalTo(_imgv.mas_top).offset(5);
        make.height.equalTo(@15);
    }];

    
    UILabel *lvlab = [[UILabel alloc]init];
    [view addSubview:lvlab];
    NSString *lvlabStr = [NSString stringWithFormat:@"会员等级 :%@",dic[@"data"][0][@"lv"]];
    lvlab.text = lvlabStr;
    lvlab.font = [UIFont systemFontOfSize:10];
    lvlab.lineBreakMode = NSLineBreakByWordWrapping;
    [lvlab mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(from_titlelab.mas_right).offset(10);
        make.top.equalTo(_imgv.mas_top).offset(5);
        make.height.equalTo(@15);
    }];
    
    
    UILabel *goldlab = [[UILabel alloc]init];
    [view addSubview:goldlab];
    NSString *goldlabStr = [NSString stringWithFormat:@"我的金币 :%@",dic[@"data"][0][@"gold"]];
    goldlab.text = goldlabStr;
    goldlab.font = [UIFont systemFontOfSize:10];
    goldlab.lineBreakMode = NSLineBreakByWordWrapping;
    [goldlab mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(lvlab.mas_right).offset(10);
        make.top.equalTo(_imgv.mas_top).offset(5);
        make.height.equalTo(@15);
    }];
    
    
    
    UILabel *datelinelab = [[UILabel alloc]init];
    [view addSubview:datelinelab];
    NSString *timestr = dic[@"data"][0][@"dateline"];
    //转码
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd"];//@"yyyy-MM-dd-HHMMss"
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timestr doubleValue]];
    NSString *dateString = [formatter stringFromDate:date];
    
    
    NSString *datelinelabStr = [NSString stringWithFormat:@"注册时间 :%@",dateString];
    datelinelab.text = datelinelabStr;
    datelinelab.font = [UIFont systemFontOfSize:10];
    datelinelab.lineBreakMode = NSLineBreakByWordWrapping;
    [datelinelab mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(_imgv.mas_right).offset(10);
        make.top.equalTo(from_titlelab.mas_bottom).offset(10);
        make.height.equalTo(@15);
    }];
    
    
    
    
    
    
    [self creatbtn];
    
    
    
    
    
    UIButton *firstBtn = (UIButton *)[self.view viewWithTag:1];
    firstBtn.selected = YES;
    [firstBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [self creatLine];
    [self creatScrollView];
    
#pragma mark -----------------基础资料-----------------------
    
    tabview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, scrollView.frame.size.width, scrollView.frame.size.height)];
    //    tabview.backgroundColor = [UIColor redColor];
    [scrollView addSubview:tabview];
    tabview.delegate = self;
    tabview.dataSource = self;
    
    
#pragma mark -----------------我的财产-----------------------
    UIView *WDCCview = [[UIView alloc]initWithFrame:CGRectMake(Width, 0, scrollView.frame.size.width, scrollView.frame.size.height)];
    WDCCview.backgroundColor = [UIColor whiteColor];
    [scrollView addSubview:WDCCview];
    UILabel *moneylab = [[UILabel alloc]init];
    moneylab.text = @"余额";
    moneylab.textColor = [UIColor blackColor];
    moneylab.font = [UIFont systemFontOfSize:15];
    [WDCCview addSubview:moneylab];
    [moneylab mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(WDCCview.mas_top).offset(30);
        make.left.equalTo(WDCCview.mas_left).offset(20);
        make.width.equalTo(@40);
        make.height.equalTo(@20);
    }];
    UILabel *lab = [[UILabel alloc]init];
    lab.text = @"550.00";
    lab.numberOfLines = 0;//根据最大行数需求来设置
    lab.lineBreakMode = NSLineBreakByTruncatingTail;
    lab.textColor = [UIColor redColor];
    lab.font = [UIFont systemFontOfSize:30];
    [WDCCview addSubview:lab];
    [lab mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(moneylab.mas_right);
        make.bottom.equalTo(moneylab.mas_bottom);
        make.height.equalTo(@30);
    }];
    
    UILabel *xiaofeilab = [[UILabel alloc]init];
    xiaofeilab.text = @"已消费";
    xiaofeilab.textColor = [UIColor blackColor];
    xiaofeilab.font = [UIFont  systemFontOfSize:15];
    [WDCCview addSubview:xiaofeilab];
    [xiaofeilab mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(moneylab.mas_left);
        make.top.equalTo(moneylab.mas_bottom).offset(30);
        make.width.equalTo(@50);
        make.height.equalTo(@20);
    }];
    
    UILabel *lab2 = [[UILabel alloc]init];
    lab2.text = @"4,953.64";
    lab2.numberOfLines = 0;//根据最大行数需求来设置
    lab2.lineBreakMode = NSLineBreakByTruncatingTail;
    lab2.textColor = [UIColor lightGrayColor];
    lab2.font = [UIFont systemFontOfSize:25];
    [WDCCview addSubview:lab2];
    [lab2 mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(xiaofeilab.mas_right);
        make.bottom.equalTo(xiaofeilab.mas_bottom).offset(3);
        make.height.equalTo(@30);
    }];
    
    
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn2 setTitle:@"提现" forState:0];
    [btn2 setTitleColor:[UIColor blackColor] forState:0];
    btn2.backgroundColor = [UIColor whiteColor];
    btn2.titleLabel.font = [UIFont systemFontOfSize:15];
    btn2.tag = 2000;
    [btn2 addTarget:self action:@selector(rechargeMoney:) forControlEvents:UIControlEventTouchUpInside];
    [WDCCview addSubview:btn2];
    [btn2 mas_makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(WDCCview.mas_right).offset(-20);
        make.top.equalTo(WDCCview.mas_top).offset(40);
        make.height.equalTo(@20);
        make.width.equalTo(@40);
    }];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn1 setTitle:@"充值" forState:0];
    btn1.tag = 2001;
    [btn1 setTitleColor:[UIColor blackColor] forState:0];
    btn1.backgroundColor = [UIColor whiteColor];
    btn1.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn1 addTarget:self action:@selector(rechargeMoney:) forControlEvents:UIControlEventTouchUpInside];
    [WDCCview addSubview:btn1];
    [btn1 mas_makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(btn2.mas_left).offset(-5);
        make.top.equalTo(btn2.mas_top);
        make.height.equalTo(@20);
        make.width.equalTo(@40);
    }];
    
    
#pragma mark -----------------我的优惠券-----------------------
    UIView *YHQview = [[UIView alloc]initWithFrame:CGRectMake(2*Width, 0, scrollView.frame.size.width, scrollView.frame.size.height)];
    YHQview.backgroundColor = [UIColor whiteColor];
    [scrollView addSubview:YHQview];
    UILabel *lab1= [[UILabel alloc]init];
    lab1.text = @"优惠券   200元";
    lab1.textAlignment = 1;
    lab1.textColor = [UIColor orangeColor];
    lab1.backgroundColor = [UIColor redColor];
    [YHQview addSubview:lab1];
    [lab1 mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(YHQview.mas_top).offset(15);
        make.left.equalTo(YHQview.mas_left).offset(30);
        make.right.equalTo(YHQview.mas_right).offset(-30);
        make.height.equalTo(@60);
    }];
    
    UILabel *label2= [[UILabel alloc]init];
    label2.text = @"优惠券   200元";
    label2.textAlignment = 1;
    label2.textColor = [UIColor orangeColor];
    label2.backgroundColor = [UIColor redColor];
    [YHQview addSubview:label2];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(lab1.mas_bottom).offset(15);
        make.left.equalTo(lab1.mas_left);
        make.right.equalTo(lab1.mas_right);
        make.height.equalTo(@60);
    }];
    
    
    UILabel *lab3= [[UILabel alloc]init];
    lab3.text = @"优惠券   200元";
    lab3.textAlignment = 1;
    lab3.textColor = [UIColor orangeColor];
    lab3.backgroundColor = [UIColor redColor];
    [YHQview addSubview:lab3];
    [lab3 mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(label2.mas_bottom).offset(15);
        make.left.equalTo(label2.mas_left);
        make.right.equalTo(label2.mas_right);
        make.height.equalTo(@60);
    }];
    
    
    
    UILabel *lab4= [[UILabel alloc]init];
    lab4.text = @"优惠券   200元";
    lab4.textAlignment = 1;
    lab4.textColor = [UIColor orangeColor];
    lab4.backgroundColor = [UIColor redColor];
    [YHQview addSubview:lab4];
    [lab4 mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(lab3.mas_bottom).offset(15);
        make.left.equalTo(lab3.mas_left);
        make.right.equalTo(lab3.mas_right);
        make.height.equalTo(@60);
    }];
}

//充值
- (void)rechargeMoney:(UIButton *)sender{
    
     RechargeMoneyViewController *controller = [[RechargeMoneyViewController alloc] initWithNibName:@"RechargeMoneyViewController" bundle:nil];
    if (sender.tag == 2000) {
        controller.navigationItem.title = @"提现";
    }else{
        controller.navigationItem.title = @"充值";

    }
    controller.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:controller animated:YES];

}


- (void)changeUserImg{
    TZImagePickerController *pickVC = [[TZImagePickerController alloc] initWithMaxImagesCount:1 delegate:self];
    pickVC.allowTakePicture = NO;
    [pickVC setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
        
        [_userImg addObjectsFromArray:photos];
        for (int i = 0; i < [_userImg count]; i++) {
            if (_userImg.count > 1) {
                [_userImg removeAllObjects];
                UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"照片最多选择1张" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
                [alertView show];
                
                return;
            }
            
            
            _imgv.image = [_userImg objectAtIndex:i];
            
            NSData *data = UIImagePNGRepresentation(_imgv.image);
            [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"UserPhoto"];
            
            _imgv.tag = i;
            [_userImg removeAllObjects];
        }

    }];
    [self presentViewController:pickVC animated:YES completion:nil];
}



-(void)creatbtn
{
    btnMutableArray = [NSMutableArray array];
    for ( int i=0; i<3; i++) {
        NSArray *arr = @[@"基础资料",@"我的财产",@"我的优惠券"];
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(Width/3*i, 85, Width/3, 30);
        btn.backgroundColor = [UIColor whiteColor];
        [btn setTitle:arr[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateHighlighted];
        btn.titleLabel.font = [UIFont systemFontOfSize:10];
        [tbview addSubview:btn];
        btn.tag = i + 1;
        [btnMutableArray addObject:btn];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
}


- (void)btnClick:(UIButton *)btn{
    [self.view endEditing:YES];

    UIButton *allBtn = (UIButton *)[self.view viewWithTag:btn.tag];
    
    btn.selected = YES;
    
    UILabel *label = (UILabel *)[self.view viewWithTag:100];
    
    CGRect rect = label.frame;
    
    rect.origin.x = Width / 3 * (btn.tag - 1);
    
    label.frame = rect;
    
    scrollView = (UIScrollView *)[self.view viewWithTag:101];
    [scrollView setShowsHorizontalScrollIndicator:NO];
    
    scrollView.contentOffset = CGPointMake((btn.tag - 1) * Width, 0);
    
    [btn setTitleColor:[UIColor orangeColor] forState:0];
    
    for (UIButton *btn in btnMutableArray)
    {
        if (allBtn.tag ==btn.tag)
        {
            
            [btn setTitleColor:[UIColor orangeColor] forState:0];
            
        } else
        {
            [btn setTitleColor:[UIColor blackColor] forState:0];
        }
    }
}
-(void)creatLine
{
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 115, Width / 3, 3)];
    
    label.tag = 100;
    
    label.backgroundColor = [UIColor orangeColor];
    
    [tbview addSubview:label];
    
    
}
- (void)creatScrollView{
    
    scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 118, Width, Height- 118)];
    
    scrollView.tag = 101;
    
    scrollView.delegate = self;
    
    scrollView.contentSize = CGSizeMake(Width * 3, Height - 183);
    
    scrollView.pagingEnabled = YES;
    
    scrollView.bounces = NO;
    [tbview addSubview:scrollView];
    
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    UIScrollView *scroll = (UIScrollView *)[self.view viewWithTag:101];
    
    int currentPage = scroll.contentOffset.x / Width;
    
    UIButton *button = (UIButton *)[self.view viewWithTag:currentPage + 1];
    
    [self btnClick:button];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView==tabview){
        return 5;
    }
    else
        return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView==tabview) {
        return 50;
    }
    else
        return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView==tabview) {
        static NSString *cellstr = @"cellstr";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellstr];
        if (cell==nil)
        {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellstr];
        }
        cell.backgroundColor = [UIColor whiteColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;//取消高亮
        NSArray *arr1 = @[@"昵称",@"地区",@"手机号",@"邮箱号",@"实名认证"];
        UILabel *lab1 = [[UILabel alloc]init];
        lab1.backgroundColor = [UIColor clearColor];
        lab1.numberOfLines = 0;//根据最大行数需求来设置
        lab1.lineBreakMode = NSLineBreakByTruncatingTail;
        [cell addSubview:lab1];
        [lab1 mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.equalTo(cell.mas_top).with.offset(15);
            make.left.equalTo(cell.mas_left).with.offset(15);
            make.bottom.equalTo(cell.mas_bottom).offset(-15);
        }];
        
        NSDictionary *dict2 = dic[@"data"][0];
        
        NSString *uName = [NSString stringWithFormat:@"%@", dict2[@"uname"]];
        NSString *place = @"--";
        NSString *phoneNum = [NSString stringWithFormat:@"%@", dict2[@"mobile"]];
        NSString *mail = [NSString stringWithFormat:@"%@", dict2[@"mail"]];
        
        NSArray *arr2 = @[uName, place, phoneNum, mail,@"--"];
        
//        NSArray *arr2 = @[@"西元前的布拉达广场",@"上海  外滩",@"13689774586",@"4638alks@sdh.com",@"汉 梭罗"];
//        UILabel *lab2 = [[UILabel alloc]init];
//        lab2.backgroundColor = [UIColor clearColor];
//        lab1.numberOfLines = 0;//根据最大行数需求来设置
//        lab2.lineBreakMode = NSLineBreakByTruncatingTail;
//        [cell addSubview:lab2];
//        [lab2 mas_makeConstraints:^(MASConstraintMaker *make){
//            make.top.equalTo(cell.mas_top).with.offset(15);
//            make.right.equalTo(cell.mas_right).with.offset(-15);
//            make.bottom.equalTo(cell.mas_bottom).offset(-15);
//        }];
        UITextField *textFile = [[UITextField alloc]init];
        textFile.backgroundColor = [UIColor clearColor];
        lab1.numberOfLines = 0;//根据最大行数需求来设置
//        lab2.lineBreakMode = NSLineBreakByTruncatingTail;
        [cell addSubview:textFile];
        [textFile mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.equalTo(cell.mas_top).with.offset(15);
            make.right.equalTo(cell.mas_right).with.offset(-15);
            make.bottom.equalTo(cell.mas_bottom).offset(-15);
        }];

        
        lab1.text = arr1[indexPath.row];
        textFile.text = arr2[indexPath.row];
        
        
        
        return  cell;
    }
    else
    {
        static NSString *cellstr = @"cellstr";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellstr];
        if (cell==nil)
        {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellstr];
        }
        cell.backgroundColor = [UIColor whiteColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;//取消高亮
        return cell;
        
    }
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
            
            break;
        case 1:
            
            break;
        case 2:
            
            break;
        case 3:
            
            break;
        case 4:
            
            break;

            
        default:
            break;
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.view endEditing:YES];
    return YES;
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
