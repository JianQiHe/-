//
//  GRZLViewController.m
//  家装
//
//  Created by mac on 16/5/12.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "GRZLViewController.h"
#import "Masonry.h"
#import "PrefixHeader.pch"
#import "MineViewController.h"
#import "RegisterViewController.h"
#import "AmendViewController.h"
#import "Danli.h"
#import "MBProgressHUD+NJ.h"

#import "GetDataServer.h"

@interface GRZLViewController ()<UITextFieldDelegate>
{
    NSMutableDictionary *Mdic;
    UITextField *user;
    NSString *type;
    UITextField *password;
    NSString *urlStr;

}

@end

@implementation GRZLViewController


-(void)viewWillAppear:(BOOL)animated
{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"back"]forState:UIControlStateNormal];
    [button setFrame:CGRectMake(0,0,20,30)];
//    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(jumpBack:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = barButtonItem;
    // 返回按钮内容左靠
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    // 让返回按钮内容继续向左边偏移10
    button.contentEdgeInsets = UIEdgeInsetsMake(4, -10, -4, 0);
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];



}
- (void)jumpBack:(id)sender{
    
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    
//    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(goodbye:) name:@"AppDidEnterBackground" object:nil];
//    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(welcome:) name:@"AppWillEnterForeground" object:nil];
    
    
  #pragma mark -----------------收回键盘的手势-----------------------
    self.navigationItem.title = @"登录";
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(reKeyBoard)];
    [self.view addGestureRecognizer:tap];

    
    
    
    if (Mdic == nil) {
        self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];

        
        
        user = [[UITextField alloc]init];
        user.placeholder = @"   手机号／邮箱";
        user.font = [UIFont systemFontOfSize:13];
//        user.layer.cornerRadius = 5;
        user.backgroundColor = [UIColor whiteColor];
        user.textAlignment = 1;
        user.delegate = self;
        user.clearButtonMode = UITextFieldViewModeWhileEditing;
        [self.view addSubview:user];
        [user mas_makeConstraints:^(MASConstraintMaker *make){
            make.left.equalTo(self.view.mas_left);
            make.right.equalTo(self.view.mas_right);
            make.top.equalTo(self.view.mas_top).offset(120);
            make.height.equalTo(@35);
        }];
        
        
        password = [[UITextField alloc]init];
        password.placeholder = @"   密码";
//        password.layer.cornerRadius = 5;
        password.font = [UIFont systemFontOfSize:13];
        password.secureTextEntry = YES;
        password.delegate = self;
        password.backgroundColor = [UIColor whiteColor];
        password.textAlignment = 1;
        password.clearButtonMode = UITextFieldViewModeWhileEditing;
        [self.view addSubview:password];
        [password mas_makeConstraints:^(MASConstraintMaker *make){
            make.left.equalTo(self.view.mas_left);
            make.right.equalTo(self.view.mas_right);
            make.top.equalTo(user.mas_bottom);
            make.height.equalTo(user.mas_height);
        }];
        
        UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(5, 155, Width-10, 1)];
        line.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [self.view addSubview:line];
        
        
        UIButton *new = [UIButton buttonWithType:UIButtonTypeCustom];
        [new addTarget:self action:@selector(zhuce) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:new];
        [new setTitle:@"新用户" forState:UIControlStateNormal];
        [new setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [new setBackgroundColor:[UIColor clearColor]];
        new.titleLabel.font = [UIFont systemFontOfSize:8];
        [new mas_makeConstraints:^(MASConstraintMaker *make){
            make.right.equalTo(self.view.mas_right).offset(-20);
            make.top.equalTo(password.mas_bottom).offset(10);
            make.height.equalTo(@15);
            make.width.equalTo(@25);
        }];
        
        
        UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn3 addTarget:self action:@selector(xiugai) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn3];
        [btn3 setTitle:@"找回密码" forState:UIControlStateNormal];
        [btn3 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [btn3 setBackgroundColor:[UIColor clearColor]];
        btn3.titleLabel.font = [UIFont systemFontOfSize:8];
        [btn3 mas_makeConstraints:^(MASConstraintMaker *make){
            make.left.equalTo(password.mas_left).offset(20);
            make.top.equalTo(password.mas_bottom).offset(10);
            make.height.equalTo(@15);
            make.width.equalTo(@35);
        }];

        
        
        
        
        
        UIButton *denglu = [UIButton buttonWithType:UIButtonTypeCustom];
        [denglu addTarget:self action:@selector(denglu) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:denglu];
        [denglu setTitle:@"登录" forState:UIControlStateNormal];
        [denglu setTintColor:[UIColor whiteColor]];
        [denglu setBackgroundColor:[UIColor colorWithRed:70/255.0 green:70/255.0 blue:70/255.0 alpha:1]];
        denglu.layer.cornerRadius = 5;
        [denglu mas_makeConstraints:^(MASConstraintMaker *make){
            make.left.equalTo(self.view.mas_left).offset(20);
            make.right.equalTo(self.view.mas_right).offset(-20);
            make.top.equalTo(btn3.mas_bottom).offset(5);
            make.height.equalTo(@35);
        }];
        
        
        UILabel *loginway = [[UILabel alloc]init];
        loginway.textColor = [UIColor lightGrayColor];
        loginway.text = @"其他方式登录";
        loginway.textAlignment = 1;
        loginway.lineBreakMode = NSLineBreakByWordWrapping;
        loginway.font = [UIFont systemFontOfSize:9];
        [self.view addSubview:loginway];
        [loginway mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.equalTo(denglu.mas_bottom).offset(10);
            make.height.equalTo(@10);
            make.centerX.equalTo(self.view.mas_centerX);
    }];

        
        
        
        UIImageView *qqimagv = [[UIImageView alloc]init];
        qqimagv.image = [UIImage imageNamed:@"QQ"];
        [self.view addSubview:qqimagv];
        [qqimagv mas_makeConstraints:^(MASConstraintMaker *make){
            make.left.equalTo(loginway.mas_left).offset(-60);
            make.width.equalTo(@30);
            make.height.equalTo(@30);
            make.top.equalTo(loginway.mas_bottom).offset(5);
        }];
        [qqimagv setUserInteractionEnabled:YES];
        UITapGestureRecognizer *QQdenglu=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(toQQdenglu)];
        [qqimagv addGestureRecognizer:QQdenglu];
        
        
        
        
        UIImageView *weiboimagv = [[UIImageView alloc]init];
        weiboimagv.image = [UIImage imageNamed:@"新浪微博"];
        [self.view addSubview:weiboimagv];
        [weiboimagv mas_makeConstraints:^(MASConstraintMaker *make){
            make.right.equalTo(loginway.mas_right).offset(60);
            make.width.equalTo(@30);
            make.height.equalTo(@30);
            make.top.equalTo(loginway.mas_bottom).offset(5);
        }];
        [weiboimagv setUserInteractionEnabled:YES];
        UITapGestureRecognizer *weibodenglu=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(toweibodenglu)];
        [weiboimagv addGestureRecognizer:weibodenglu];
        
        
        
        
        UIImageView *weixingimagv = [[UIImageView alloc]init];
        weixingimagv.image = [UIImage imageNamed:@"weixing"];
        [self.view addSubview:weixingimagv];
        [weixingimagv mas_makeConstraints:^(MASConstraintMaker *make){
            make.centerX.equalTo(self.view.mas_centerX);
            make.width.equalTo(@30);
            make.height.equalTo(@30);
            make.top.equalTo(loginway.mas_bottom).offset(5);
        }];
        
        [weixingimagv setUserInteractionEnabled:YES];
        UITapGestureRecognizer *weixingdenglu=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(toweixingdenglu)];
        [weixingimagv addGestureRecognizer:weixingdenglu];
    }


}
#pragma mark -----------------第三方登录-----------------------
-(void)toQQdenglu
{
    NSLog(@"点击啦QQ");
}
-(void)toweibodenglu
{
    NSLog(@"点击啦微博");
}
-(void)toweixingdenglu
{
    NSLog(@"点击啦微信");
}

#pragma mark -----------------登录点击事件-----------------------
#pragma mark- 登录
-(void)denglu{
    
    NSLog(@"点击登录按钮");
    NSString *Str1 = user.text;
    //
    //    NSString *Str2 = password.text;
    
    if (Str1.length == 11) {
        type = @"1";
        [self loginByPhone];
        
    }else{
        type = @"0";
        [self loginBgEmial];
    }
    //    //邮箱是0  手机是1  jiazhuang.siruoit.com/index.php?api/api-login/type/uname/pwd  http://jiazhuang.siruoit.com/index.php?api/api-login/1/
    //       //
}

- (void)loginByPhone{
    
    NSDictionary *paramDic = [NSDictionary dictionaryWithObjectsAndKeys:
                          password.text,@"PWD",
                          user.text,@"PHONE",nil];
    
    NSString *path = @"http://jiazhuang.siruoit.com/index.php?api/api-loginbyphone";
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    //post请求
    [manager POST:path parameters:paramDic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"responseObject==%@",responseObject);
        
        NSString *html = operation.responseString;
        NSData* data=[html dataUsingEncoding:NSUTF8StringEncoding];
        id dict=[NSJSONSerialization  JSONObjectWithData:data options:0 error:nil];
        Mdic = dict;
        
        //存入NSUserDefaults
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        
        [userDefaults setObject:Mdic forKey:@"User"];
        
        if ([dict[@"data"] count] != 0) {
            [self.delegate passValue:Mdic];
            [MBProgressHUD showSuccess:@"登录成功"];
            [self.navigationController popViewControllerAnimated:YES];
            self.hidesBottomBarWhenPushed = NO;
            //            NSLog(@"%@",Mdic);
            NSString *UidStr = Mdic[@"data"][0][@"uid"];
            NSLog(@"UidStr======%@",UidStr);
            /**
             *  单例
             */
            Danli *instance = [Danli sharedInstance];
            instance.status = @"登录成功";
            instance.isLogin = YES;
            
//            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"LoginSuccess"];
//            [[NSUserDefaults standardUserDefaults] setObject:dict[@"data"][0] forKey:@"UserDetail"];
            
        }else
        {
//            [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"LoginSuccess"];
            UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请输入正确的用户或密码" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
            
            [myAlertView show];
        }
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"发生错误！%@",error);
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"服务器异常" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        
        [myAlertView show];
    }];
    
    
}
- (void)loginBgEmial{
    
    urlStr = @"http://jiazhuang.siruoit.com/index.php?api/api-login"  ;
    NSString *st = [NSString stringWithFormat:@"%@/0/%@/%@",urlStr,user.text,password.text];
    //    NSString *st =[NSString stringWithFormat:@"%@/%@/%@/%@",Str3,@"0",@"jg@126.com",@"123456"];
    NSURL *url = [NSURL URLWithString:[st stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];                        // UTF－8
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc]initWithRequest:request];
    // 请求数据，设置成功与失败的回调函数
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSString *html = operation.responseString;
        NSData* data=[html dataUsingEncoding:NSUTF8StringEncoding];
        id dict=[NSJSONSerialization  JSONObjectWithData:data options:0 error:nil];
        Mdic = dict;
        //存入NSUserDefaults
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        
        [userDefaults setObject:Mdic forKey:@"User"];
        
        if ([dict[@"data"] count] != 0) {
            [self.delegate passValue:Mdic];
            [MBProgressHUD showSuccess:@"登录成功"];
            [self.navigationController popViewControllerAnimated:YES];
            self.hidesBottomBarWhenPushed = NO;
            //            NSLog(@"%@",Mdic);
            NSString *UidStr = Mdic[@"data"][0][@"uid"];
            NSLog(@"UidStr======%@",UidStr);
            /**
             *  单例
             */
            Danli *instance = [Danli sharedInstance];
            instance.status = @"登录成功";
            instance.isLogin = YES;
            
//            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"LoginSuccess"];
//            [[NSUserDefaults standardUserDefaults] setObject:dict[@"data"][0] forKey:@"UserDetail"];
            
        }else
        {
//            [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"LoginSuccess"];
            
            UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请输入正确的用户或密码" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
            
            [myAlertView show];
            
        }
        
        
        
    }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"发生错误！%@",error);
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"服务器异常" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        
        [myAlertView show];
        
    }];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperation:operation];
}

//点击return 按钮 去掉
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [user resignFirstResponder];
    [password resignFirstResponder];

    return YES;
}

- (void)reKeyBoard
{
    [user resignFirstResponder];
    [password resignFirstResponder];
    
}

-(void)zhuce
{
    RegisterViewController *view = [[RegisterViewController alloc]init];
    view.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:view animated:YES];
}

-(void)xiugai
{
    AmendViewController *view = [[AmendViewController alloc]init];
    view.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:view animated:YES];
    
}
//
//-(void)goodbye:(NSNotification *)notification
//{
//    NSString *infoString = notification.object;
//    NSLog(@"退出App（登录）%@",infoString);
//}
//-(void)welcome:(NSNotification *)notification
//{
//    NSString *infoString = notification.object;
//
//    NSLog(@"进入App（登录）%@",infoString);
//}
//-(void)dealloc {
//    [[NSNotificationCenter defaultCenter] removeObserver:self];
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
