//
//  MineViewController.m
//  家装
//
//  Created by mac on 16/5/3.
//  Copyright © 2016年 mac. All rights reserved.
//
//
#import "MineViewController.h"
#import "AppDelegate.h"
#import "Masonry.h"
#import "GRZLViewController.h"
#import "WDDDViewController.h"
#import "WDRJViewController.h"
#import "SHDZViewController.h"
#import "WDZXViewController.h"
#import "WDWDViewController.h"
#import "WDZXBViewController.h"
#import "SZViewController.h"
#import "GRZLViewController.h"
#import "LoginsuccessViewController.h"
#import "MineTableViewCell.h"
#import "StoreViewController.h"

#import "Danli.h"
#import "MBProgressHUD+NJ.h"
@interface MineViewController ()<UITableViewDelegate,UITableViewDataSource,PassValueDelegate>

@property (retain , nonatomic) Danli* instance;

@end

@implementation MineViewController
{
    UIView *headview;
    UITableView *minetbview;
    UIView *firstview;
    UIView *secondview;
    
    NSMutableDictionary *Mdic;
    
    UILabel *lab;//未登录
    UIImageView *imgaV;//未登录
    
    
    //登录
    UIImageView *imgV;
    UILabel *namelab;
    UILabel *huiyuanlab;
    UIImageView *phoneView;
    UILabel *numlab;
    UILabel *renzheng;
    UIImageView *xinfengView;
    UILabel *youxianglab;
    UILabel *renzheng2;
    
    BOOL isLogin;
}


- (void)viewWillAppear:(BOOL)animated
{

//    isLogin = [[NSUserDefaults standardUserDefaults] objectForKey:@"LoginSuccess"];
    isLogin = _instance.isLogin;
    
    if (isLogin)
    {
        imgaV.hidden = YES;
        lab.hidden = YES;
        

        imgV.hidden = NO;
        namelab.hidden = NO;
        huiyuanlab.hidden = NO;
        phoneView.hidden = NO;
        numlab.hidden = NO;
        renzheng.hidden = NO;
        xinfengView.hidden = NO;
        youxianglab.hidden = NO;
        renzheng2.hidden = NO;
        
        namelab.text = Mdic[@"data"][0][@"uname"];
        NSString *imgVStr = [NSString stringWithFormat:@"http://jiazhuang.siruoit.com/attachs/%@",Mdic[@"data"][0][@"face"]];
        [imgV sd_setImageWithURL:[NSURL URLWithString:imgVStr] placeholderImage:[UIImage imageNamed:@"imgVStr"]];
        
        NSUserDefaults *userdefault = [NSUserDefaults standardUserDefaults];
        if ([userdefault objectForKey:@"UserPhoto"] != nil) {
            imgV.image = [UIImage imageWithData:[userdefault objectForKey:@"UserPhoto"]];
        }
        
    int number =[Mdic[@"data"][0][@"type"] intValue];
    switch (number) {
        case -1:
                huiyuanlab.text = @"无";
            break;
        case 0:
            huiyuanlab.text = @"普通商家";
            break;
        case 1:
            huiyuanlab.text = @"365商家";
            break;
        case 2:
            huiyuanlab.text = @"千元商家";
            break;
        default:
            huiyuanlab.text = @"万元商家";
            break;
            }
    }
    else
    {
        imgaV.hidden = NO;
        lab.hidden = NO;
        
        imgV.hidden = YES;
        namelab.hidden = YES;
        huiyuanlab.hidden = YES;
        phoneView.hidden = YES;
        numlab.hidden = YES;
        renzheng.hidden = YES;
        xinfengView.hidden = YES;
        youxianglab.hidden = YES;
        renzheng2.hidden = YES;

    }

    [minetbview reloadData];
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];


    minetbview =  [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    minetbview.backgroundColor = [UIColor groupTableViewBackgroundColor];
    minetbview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:minetbview];
    minetbview.delegate = self;
    minetbview.dataSource = self;
    [self initTableHeaderView];

    //单例
    self.instance = [Danli sharedInstance];
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    // Do any additional setup after loading the view.
    
    NSDictionary *dic = [[NSUserDefaults standardUserDefaults] objectForKey:@"User"];
    Mdic = [NSMutableDictionary dictionaryWithDictionary:dic];
}

#pragma mark -----------------添加两个View到头视图中-----------------------

-(void)initTableHeaderView
{
    headview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,170)];
    headview.backgroundColor = [UIColor colorWithRed:249/255 green:249/255 blue:244/255 alpha:0.01];
    minetbview.tableHeaderView = headview;

    
    
    
    firstview = [[UIView alloc]init];
    firstview.frame = CGRectMake(0, 0, self.view.frame.size.width, 80);
    firstview.backgroundColor =[UIColor whiteColor];
    [headview addSubview:firstview];
    
    UIView *dianjiView = [[UIView alloc]init];
    dianjiView.backgroundColor = [UIColor clearColor];
    [firstview addSubview:dianjiView];
    [dianjiView mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(firstview.mas_top);
        make.left.equalTo(firstview.mas_left);
        make.right.equalTo(firstview.mas_right);
        make.bottom.equalTo(firstview.mas_bottom);
}];
    UITapGestureRecognizer *gerenziliao=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(toGRZL)];
    [dianjiView addGestureRecognizer:gerenziliao];

    
    
    
    secondview = [[UIView alloc]init];
    secondview.backgroundColor = [UIColor whiteColor];
    [headview addSubview:secondview];
    
    [secondview mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(firstview.mas_bottom).with.offset(5);
        make.left.equalTo(firstview.mas_left);
        make.right.equalTo(firstview.mas_right);
        make.bottom.equalTo(headview.mas_bottom).offset(-5);
}];
    
  //未登录
    imgaV = [[UIImageView alloc]init];
    UIImage *img1 = [UIImage imageNamed:@"touxiang"];
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    
    if ([userDefaults objectForKey:@"UserPhoto"] != nil) {
        imgaV.image = [UIImage imageWithData:[userDefaults objectForKey:@"UserPhoto"]];
    }
    
    imgaV.backgroundColor = [UIColor clearColor];
    imgaV.image = img1;
    [firstview addSubview:imgaV];
    [imgaV mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(headview.mas_left).offset((Width-50)/2);
        make.right.equalTo(headview.mas_right).offset(-(Width-50)/2);
        make.top.equalTo(@10);
        make.height.equalTo(@50);
    }];
    
    lab = [[UILabel alloc]init];
    lab.text = @"请登录";
    lab.font = [UIFont systemFontOfSize:12];
    lab.textAlignment = 1;
    [headview addSubview:lab];
    [lab mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(imgaV.mas_left);
        make.right.equalTo(imgaV.mas_right);
        make.top.equalTo(imgaV.mas_bottom).offset(5);
        make.height.equalTo(@10);
    }];
    
//登录之后
    
    
    
        imgV = [[UIImageView alloc]init];
        imgV.backgroundColor = [UIColor clearColor];
        imgV.layer.cornerRadius = 30;
        [firstview addSubview:imgV];
        [imgV mas_makeConstraints:^(MASConstraintMaker *make){
            make.left.equalTo(firstview.mas_left).offset(30);
            make.top.equalTo(firstview.mas_top).offset((firstview.frame.size.height-60)/2);
            make.width.equalTo(@60);
            make.height.equalTo(@60);
    }];
    
        namelab = [[UILabel alloc]init];
        namelab.font = [UIFont fontWithName:@"Helvetica-Bold" size:15];
        namelab.numberOfLines = 0;//根据最大行数需求来设置
        namelab.lineBreakMode = NSLineBreakByTruncatingTail;
        [headview addSubview:namelab];
        [namelab mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.equalTo(imgV.mas_top).with.offset(20);
            make.left.equalTo(imgV.mas_right).with.offset(7);
            make.height.equalTo(@15);
        }];
    
    
        huiyuanlab = [[UILabel alloc]init];
        huiyuanlab.font = [UIFont systemFontOfSize:8];
        huiyuanlab.backgroundColor = [UIColor redColor];
        huiyuanlab.textColor = [UIColor whiteColor];
        huiyuanlab.layer.cornerRadius = 3;//设置边缘弯曲角度
        huiyuanlab.clipsToBounds = YES;//（iOS7以后需要设置）
        huiyuanlab.layer.borderColor = [[UIColor clearColor] CGColor];
    
        huiyuanlab.layer.borderWidth = 1;
        [headview addSubview:huiyuanlab];
        [huiyuanlab mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.equalTo(namelab.mas_top).with.offset(5);
            make.left.equalTo(namelab.mas_right);
        }];

    
    
//        phoneView = [[UIImageView alloc]init];
//        UIImage *pimg = [UIImage imageNamed:@"shouji"];
//        phoneView.image = pimg;
//        [headview addSubview:phoneView];
//        [phoneView mas_makeConstraints:^(MASConstraintMaker *make){
//            make.left.equalTo(namelab.mas_left);
//            make.top.equalTo(namelab.mas_bottom).with.offset(5);
//            make.width.equalTo(@10);
//            make.height.equalTo(@15);
//    
//        }];
//    
//        numlab = [[UILabel alloc]init];
//        numlab.font = [UIFont systemFontOfSize:10];
//        numlab.numberOfLines = 0;//根据最大行数需求来设置
//        numlab.lineBreakMode = NSLineBreakByTruncatingTail;
//        [headview addSubview:numlab];
//        [numlab mas_makeConstraints:^(MASConstraintMaker *make){
//            make.bottom.equalTo(phoneView.mas_bottom);
//            make.left.equalTo(phoneView.mas_right).offset(5);
//    
//    
//        }];
//
//    
//        renzheng = [[UILabel alloc]init];
//        renzheng.text = @"已认证";
//        renzheng.textColor = [UIColor whiteColor];
//        renzheng.backgroundColor = [UIColor orangeColor];
//        renzheng.font = [UIFont systemFontOfSize:7];
//        renzheng.layer.cornerRadius = 3;//设置边缘弯曲角度
//        renzheng.clipsToBounds = YES;//（iOS7以后需要设置）
//        renzheng.layer.borderColor = [[UIColor clearColor] CGColor];
//        [headview addSubview:renzheng];
//    
//        [renzheng mas_makeConstraints:^(MASConstraintMaker *make){
//            make.top.equalTo(numlab.mas_top).with.offset(3);
//            make.left.equalTo(numlab.mas_right);
//            make.width.equalTo(@24);
//        }];
//    
//        //信封
//        xinfengView = [[UIImageView alloc]init];
//        UIImage *xfimg = [UIImage imageNamed:@"youxiang"];
//        xinfengView.image = xfimg;
//        [headview addSubview:xinfengView];
//    
//    
//        [xinfengView mas_makeConstraints:^(MASConstraintMaker *make){
//            make.top.equalTo(phoneView.mas_bottom).offset(5);
//            make.left.equalTo(phoneView.mas_left);
//            make.width.equalTo(@15);
//            make.height.equalTo(@15);
//        }];
//
//        //邮箱
//        youxianglab = [[UILabel alloc]init];
//        youxianglab.font = [UIFont systemFontOfSize:10];
//        youxianglab.numberOfLines = 0;//根据最大行数需求来设置
//        youxianglab.lineBreakMode = NSLineBreakByTruncatingTail;
//        [headview addSubview:youxianglab];
//    
//        [youxianglab mas_makeConstraints:^(MASConstraintMaker *make){
//            make.top.equalTo(xinfengView.mas_top).with.offset(2);
//            make.left.equalTo(xinfengView.mas_right).offset(5);
//        }];
//        //第二个认证
//        renzheng2 = [[UILabel alloc]init];
//        renzheng2.text = @"已认证";
//        renzheng2.textColor = [UIColor whiteColor];
//        renzheng2.backgroundColor = [UIColor orangeColor];
//        renzheng2.font = [UIFont systemFontOfSize:7];
//        renzheng2.layer.cornerRadius = 3;//设置边缘弯曲角度
//        renzheng2.clipsToBounds = YES;//（iOS7以后需要设置）
//        renzheng2.layer.borderColor = [[UIColor clearColor] CGColor];
//        [headview addSubview:renzheng2];
//        
//        
//        [renzheng2 mas_makeConstraints:^(MASConstraintMaker *make){
//            make.top.equalTo(youxianglab.mas_top).with.offset(3);
//            make.left.equalTo(youxianglab.mas_right);
//             make.width.equalTo(@24);
//        }];
    


    
    
    
    
    #pragma mark -----------------第二个View-----------------------
    
    int a = 300/6;//kuang
    
    int b = (self.view.frame.size.width-3*a)/4;

    UIView *canzhao = [[UIView alloc]initWithFrame:CGRectMake(0, 0, a, b)];
    canzhao.backgroundColor = [UIColor clearColor];
    [self.view addSubview:canzhao];
    UIImageView *fir = [[UIImageView alloc]init];
    UIImage *orange = [UIImage imageNamed:@"wodedingdan"];
    fir.image = orange;
    [secondview addSubview:fir];
    [fir setUserInteractionEnabled:YES];
    UITapGestureRecognizer *WDDD=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(toWDDD)];
    [fir addGestureRecognizer:WDDD];



    
    
    UIImageView *sec = [[UIImageView alloc]init];
    UIImage *blue = [UIImage imageNamed:@"woderiji"];
    sec.image = blue;
    [secondview addSubview:sec];
    [sec setUserInteractionEnabled:YES];
    UITapGestureRecognizer *WDRJ=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(toWDRJ)];
    [sec addGestureRecognizer:WDRJ];
    
    
    
    UIImageView *thr = [[UIImageView alloc]init];
    UIImage *red = [UIImage imageNamed:@"shouhuodizhi"];
    thr.image = red;
    [secondview addSubview:thr];
    
    
    [thr setUserInteractionEnabled:YES];
    UITapGestureRecognizer *SHDZ=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(toSHDZ)];
    [thr addGestureRecognizer:SHDZ];
    [fir mas_makeConstraints:^(MASConstraintMaker *make){

        make.left.equalTo(secondview.mas_left).with.offset(b);
        make.top.equalTo(secondview.mas_top).offset(10);
        make.right.equalTo(sec.mas_left).with.offset(-b);
        make.bottom.equalTo(secondview.mas_bottom).offset(-20);
        
        
    }];
    [sec mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(secondview.mas_top).offset(10);
        make.width.equalTo(fir);
        make.right.equalTo(thr.mas_left).with.offset(-b);
        make.bottom.equalTo(secondview.mas_bottom).offset(-20);

}];
    [thr mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(secondview.mas_top).offset(10);
        make.width.equalTo(sec);
        make.right.equalTo(secondview.mas_right).with.offset(-b);
        make.bottom.equalTo(secondview.mas_bottom).offset(-20);

}];

    UILabel *firlab = [[UILabel alloc]init];
    firlab.text = @"我的订单";
    firlab.textAlignment = 1;
    firlab.font = [UIFont systemFontOfSize:12];
    [secondview addSubview:firlab];
    [firlab mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(fir.mas_left);
        make.right.equalTo(fir.mas_right);
        make.top.equalTo(fir.mas_bottom).offset(2);
        make.bottom.equalTo(secondview.mas_bottom);
    }];

    
    UILabel *seclab = [[UILabel alloc]init];
    seclab.text = @"我的日记";
    seclab.textAlignment = 1;
    seclab.font = [UIFont systemFontOfSize:12];
    [secondview addSubview:seclab];
    [seclab mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(sec.mas_left);
        make.right.equalTo(sec.mas_right);
        make.top.equalTo(sec.mas_bottom).offset(2);
        make.bottom.equalTo(secondview.mas_bottom);
    }];

    
    UILabel *thrlab = [[UILabel alloc]init];
    thrlab.text = @"收货地址";
    thrlab.textAlignment = 1;
    thrlab.font = [UIFont systemFontOfSize:12];
    [secondview addSubview:thrlab];
    [thrlab mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(thr.mas_left);
        make.right.equalTo(thr.mas_right);
        make.top.equalTo(thr.mas_bottom).offset(2);
        make.bottom.equalTo(secondview.mas_bottom);
    }];

}
#pragma mark -----------------delegate传值-----------------------
-(void)toGRZL
{
    self.hidesBottomBarWhenPushed = YES;
    if (isLogin) {
        
        LoginsuccessViewController *view = [[LoginsuccessViewController alloc]init];
        [self.navigationController pushViewController:view animated:YES]; //跳转到下一页面

    
    }else
    {
        //头像登录
        GRZLViewController *view = [[GRZLViewController alloc]init];
        view.delegate = self;
        [self.navigationController pushViewController:view animated:YES]; //跳转到下一页面
    }
    self.hidesBottomBarWhenPushed = NO;

}
#pragma mark -----------------代理传值-----------------------

- (void)passValue:(NSMutableDictionary *)value
{
   Mdic = [[NSMutableDictionary alloc]init];
    Mdic = value;
    NSLog(@"代理传值成功啦？？？？%@",Mdic);
   NSLog(@"==================%@",Mdic[@"data"][0][@"uname"]);
}



-(void)toWDDD
{
    if (!isLogin)
    {
        [MBProgressHUD showError:@"未登录!"];
    }
    else
    {
    WDDDViewController *view = [[WDDDViewController alloc]init];
    view.hidesBottomBarWhenPushed = YES;

    [self.navigationController pushViewController:view animated:YES];
    }

}
-(void)toWDRJ
{
    if (!isLogin)
    {
        [MBProgressHUD showError:@"未登录!"];
    }
    else
    {
    WDRJViewController *view = [[WDRJViewController alloc]init];
    view.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:view animated:YES];
    }
}

-(void)toSHDZ
{
    if (!isLogin)
    {
        [MBProgressHUD showError:@"未登录!"];
    }
    else
    {
        
    SHDZViewController *view = [[SHDZViewController alloc]init];
    view.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:view animated:YES];    
    }
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
 
    return 40;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"MineTableViewCell";
    MineTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell)
    {
        cell = [[MineTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    //,@"商铺管理",@"公司管理",@"工长管理",@"技工管理",@"设计师管理"
    NSArray *arr = @[@"我的装修",@"我的问答",@"我的装修保",@"设置"];
    
    //,@"wodezhuangxiubao",@"wodezhuangxiubao",@"wodezhuangxiubao",@"wodezhuangxiubao",@"wodezhuangxiubao"
    NSArray *arr2 = @[@"wodezhuangxiu",@"wodewenda",@"wodezhuangxiubao",@"shezhi"];
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleDefault;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.lab.text = arr[indexPath.row];
    cell.imgv.image = [UIImage imageNamed:arr2[indexPath.row]];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    //HHH
//    _instance.status = @"登录成功";
    
        if (indexPath.row ==0)
    {
        
        if (!isLogin)
        {
            [MBProgressHUD showError:@"未登录!"];
        }
        else {
            
        WDZXViewController *view = [[WDZXViewController alloc]init];
        view.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:view animated:YES];
        }
        
    }
    else if (indexPath.row==1)
    {
        if (!isLogin)
        {
            [MBProgressHUD showError:@"未登录!"];
        }else
        {
        WDWDViewController *view = [[WDWDViewController alloc]init];
        view.hidesBottomBarWhenPushed = YES;
        view.navigationItem.title = @"我的问答";
        [self.navigationController pushViewController:view animated:YES];
        }
    }
    else if (indexPath.row==2)
    {
        if (!isLogin)
        {
            [MBProgressHUD showError:@"未登录!"];
        }else
        {
        WDZXBViewController *view = [[WDZXBViewController alloc]init];
        view.hidesBottomBarWhenPushed =YES;
        view.navigationItem.title = @"我的装修保";
        [self.navigationController pushViewController:view animated:YES];
        }
        
    }
//    else if (indexPath.row==3)
//    {
//        if(![_instance.status isEqualToString:@"登录成功"])
//        {
//            [MBProgressHUD showError:@"未登录!"];
//        }else
//        {
//        StoreViewController *controller = [[StoreViewController alloc] initWithNibName:@"StoreViewController" bundle:nil];
//        controller.navigationItem.title = @"商铺管理";
//        controller.hidesBottomBarWhenPushed = YES;
//        [self.navigationController pushViewController:controller animated:YES];
//        }
//    }
//    else if (indexPath.row==4)
//    {
//        if(![_instance.status isEqualToString:@"登录成功"])
//        {
//            [MBProgressHUD showError:@"未登录!"];
//        }else
//        {
//            SZViewController *view = [[SZViewController alloc]init];
//            view.hidesBottomBarWhenPushed = YES;
//            [self.navigationController pushViewController:view animated:YES];
//        }
//    }
//    else if (indexPath.row==5)
//    {
//        if(![_instance.status isEqualToString:@"登录成功"])
//        {
//            [MBProgressHUD showError:@"未登录!"];
//        }else
//        {
//            SZViewController *view = [[SZViewController alloc]init];
//            view.hidesBottomBarWhenPushed = YES;
//            [self.navigationController pushViewController:view animated:YES];
//        }
//    }
//    else if (indexPath.row==6)
//    {
//        if(![_instance.status isEqualToString:@"登录成功"])
//        {
//            [MBProgressHUD showError:@"未登录!"];
//        }else
//        {
//            SZViewController *view = [[SZViewController alloc]init];
//            view.hidesBottomBarWhenPushed = YES;
//            [self.navigationController pushViewController:view animated:YES];
//        }
//    }
//    else if (indexPath.row==7)
//    {
//        if(![_instance.status isEqualToString:@"登录成功"])
//        {
//            [MBProgressHUD showError:@"未登录!"];
//        }else
//        {
//            SZViewController *view = [[SZViewController alloc]init];
//            view.hidesBottomBarWhenPushed = YES;
//            [self.navigationController pushViewController:view animated:YES];
//        }
//    }
    else if (indexPath.row==3)
    {
        if(!isLogin)
        {
            [MBProgressHUD showError:@"未登录!"];
        }else
        {
            SZViewController *view = [[SZViewController alloc]init];
            view.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:view animated:YES];
        }
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
