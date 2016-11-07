//
//  AmendViewController.m
//  家装
//
//  Created by mac on 16/7/4.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "AmendViewController.h"
#import <SMS_SDK/SMSSDK.h>
@interface AmendViewController ()<UITextFieldDelegate>

@end

@implementation AmendViewController
{
    UIButton *GetVerification;//获取验证码
    UITextField *PhoneNumber;//电话号码
    UITextField *verification;//验证码
    UITextField *PassWord;//密码
    UITextField *PassWordAgain;
    UIButton *login;
    
    
    
    NSTimer *timer;
    int i;
    
    
    
    NSPredicate *regextestcm;
    NSPredicate *regextestmobile;
    NSPredicate *regextestcu;
    NSPredicate *regextestct;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    UIWebView * view = [[UIWebView alloc]initWithFrame:self.view.frame];
//    [view loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://jiazhuang.siruoit.com/index.php?passport-forgot.html"]]];
//    [self.view addSubview:view];
//    
//}
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    //收回键盘
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(reKeyBoard)];
    [self.view addGestureRecognizer:tap];
    
    
    PhoneNumber = [[UITextField alloc]init];
//    PhoneNumber.borderStyle = UITextBorderStyleLine;边框
    PhoneNumber.placeholder = @"   请输入手机号";
    PhoneNumber.font = [UIFont systemFontOfSize:12];
    PhoneNumber.backgroundColor = [UIColor whiteColor];
    PhoneNumber.delegate = self;
    PhoneNumber.keyboardType = UIKeyboardTypeNumberPad;//只能输入英语，符号，数字
    PhoneNumber.clearButtonMode = UITextFieldViewModeWhileEditing;  //  （编辑的时候显示，否则不显示）
    [self.view addSubview:PhoneNumber];
    [PhoneNumber mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.view.mas_left).offset(80);
        make.right.equalTo(self.view.mas_right);
        make.top.equalTo(self.view.mas_top).offset(64);
        make.height.equalTo(@45);
    }];
    
    
    
    verification = [[UITextField alloc]init];
    verification.placeholder = @"   请输入验证码";
    verification.font = [UIFont systemFontOfSize:12];
    verification.delegate = self;
    verification.keyboardType = UIKeyboardTypeNumberPad;//只能输入数字
    verification.backgroundColor = [UIColor whiteColor];
    verification.clearButtonMode = UITextFieldViewModeWhileEditing;  //  （编辑的时候显示，否则不显示）
    [self.view addSubview:verification];
    [verification mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.view.mas_left).offset(80);
        make.right.equalTo(self.view.mas_right).offset(-80);
        make.top.equalTo(PhoneNumber.mas_bottom);
        make.height.equalTo(@45);
    }];
    
    

    PassWord = [[UITextField alloc]init];
    PassWord.placeholder = @"   设置登录密码";
    PassWord.secureTextEntry = NO;//密码形式
    PassWord.delegate = self;
    PassWord.keyboardType = UIKeyboardTypeNumbersAndPunctuation;//只能输入英语，符号，数字
    PassWord.contentVerticalAlignment= UIControlContentVerticalAlignmentCenter;//placeholder居中
    PassWord.font = [UIFont systemFontOfSize:12];
    PassWord.clearButtonMode = UITextFieldViewModeWhileEditing;  //  （编辑的时候显示，否则不显示）
    PassWord.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:PassWord];
    [PassWord mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.view.mas_left).offset(80);
        make.right.equalTo(self.view.mas_right);
        make.top.equalTo(verification.mas_bottom);
        make.height.equalTo(@45);
    }];
    
    
    
    
    PassWordAgain = [[UITextField alloc]init];
    PassWordAgain.placeholder = @"   确认登录密码";
    PassWordAgain.secureTextEntry = NO;//密码形式
    PassWordAgain.delegate = self;
    PassWordAgain.keyboardType = UIKeyboardTypeNumbersAndPunctuation;//只能输入英语，符号，数字
    PassWordAgain.font = [UIFont systemFontOfSize:12];
    PassWordAgain.clearButtonMode = UITextFieldViewModeWhileEditing;  //  （编辑的时候显示，否则不显示）
    PassWordAgain.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:PassWordAgain];
    [PassWordAgain mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.view.mas_left).offset(80);
        make.right.equalTo(self.view.mas_right);
        make.top.equalTo(PassWord.mas_bottom);
        make.height.equalTo(@45);
    }];
    
    
    
    login = [UIButton buttonWithType:UIButtonTypeCustom];
    [login addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:login];
    [login setTitle:@"确认" forState:UIControlStateNormal];
    [login setTintColor:[UIColor whiteColor]];
    login.backgroundColor = [UIColor clearColor];
    [login setBackgroundColor:[UIColor colorWithRed:32/255.0 green:151/255.0 blue:117/255.0 alpha:1]];
    login.layer.cornerRadius = 3;
    [login mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.view.mas_left).offset(10);
        make.right.equalTo(self.view.mas_right).offset(-10);
        make.top.equalTo(PassWordAgain.mas_bottom).offset(10);
        make.height.equalTo(@45);
    }];
    
    
    
    GetVerification = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:GetVerification];
    [GetVerification mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.view.mas_right);
        make.top.mas_equalTo(verification.mas_top);
        make.bottom.mas_equalTo(verification.mas_bottom);
        make.width.equalTo(@80);
    }];
    [GetVerification setTitle:@"获取验证码" forState:UIControlStateNormal];
    [GetVerification setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    GetVerification.titleLabel.font = [UIFont systemFontOfSize:10];
    GetVerification.backgroundColor = [UIColor whiteColor];
    [GetVerification addTarget:self action:@selector(GetVerification) forControlEvents:UIControlEventTouchUpInside];
    
    

    
    for (int b=0; b<4; b++) {
        NSArray *arr = @[@"手机号码",@"验证码",@"登录密码",@"确认密码"];
        UILabel *lab2 = [[UILabel alloc]initWithFrame:CGRectMake(0, 64+45*b, 80, 45)];
        lab2.text = arr[b];
        lab2.font = [UIFont systemFontOfSize:13];
        lab2.textColor = [UIColor blackColor];
        lab2.backgroundColor = [UIColor whiteColor];
        lab2.textAlignment = 1;
        [self.view addSubview:lab2];
        
        UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(10, 64+43+b*45, Width-20, 1)];
        [self.view addSubview:lab];
        lab.backgroundColor = [UIColor groupTableViewBackgroundColor];

    }
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(Width-85, 64+43+5, 1, 35)];//验证码前的横线
    [self.view addSubview:label];
    label.backgroundColor  = [UIColor groupTableViewBackgroundColor];
    
    
    #pragma mark -----------------正则-----------------------
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189
     22         */
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];

    
    
    
    
    
    
    
    
    

    
    // Do any additional setup after loading the view.
}
- (void)ssss
{
    if (i <= 0)
    {
          timer.fireDate = [NSDate distantFuture];
        [GetVerification setTitle:@"获取验证码" forState:0];
    }
    else{
        [GetVerification setTitle:[NSString stringWithFormat:@"%dS后重新获取",--i] forState:0];
    }
}

-(void)GetVerification
{
    
    if (![PhoneNumber.text  isEqual:@""]) {
        if (([regextestmobile evaluateWithObject:PhoneNumber.text] == YES)
            || ([regextestcm evaluateWithObject:PhoneNumber.text] == YES)
            || ([regextestct evaluateWithObject:PhoneNumber.text] == YES)
            || ([regextestcu evaluateWithObject:PhoneNumber.text] == YES)) {
            i = 60;
            timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(ssss) userInfo:nil repeats:YES];
            NSRunLoop *run = [NSRunLoop mainRunLoop];
            [run addTimer:timer forMode:NSDefaultRunLoopMode];
            [timer fire];
            
            [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:PhoneNumber.text zone:@"86" customIdentifier:nil result:^(NSError *error) {
                if (!error) {
                    
                }
                else{
                    
                    NSLog(@"%@",error);
                    
                }
            }];
            

    }
        else
        {
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"请输入正确的手机号码" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
            [alertView show];
        }
        
         }
    else
    {
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"请输入正确的手机号码" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
    [alertView show];
    }
    

    
    
   
    

    
}


-(void)login
{
    NSLog(@"xixixii");
    
        [SMSSDK commitVerificationCode:verification.text phoneNumber:PhoneNumber.text zone:@"86" result:^(NSError *error) {
        if (!error) {
            if([PassWord.text isEqualToString:@""]){
                
                UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"密码不能为空" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                [alertView show];
                
            }
            
           if (PassWord.text == PassWordAgain.text) {
                    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"修改成功" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                        [alertView show];
                    [self.navigationController popViewControllerAnimated:YES];
                    self.hidesBottomBarWhenPushed = NO;

            }else{
                UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"两次密码输入不一致" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                [alertView show];
 
            }
            
        }
        else
        {
            NSLog(@"错误信息:%@",error);
            if ([PhoneNumber.text isEqual:@""]) {
                UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"请输入手机号码" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:@"返回", nil];
                [alertView show];
            }else
            {
                UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"请输入正确的验证码" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:@"返回", nil];
                [alertView show];
            }
            
            
            
        }
    }];


    
}
- (void)reKeyBoard
{
    [PhoneNumber resignFirstResponder];
    [verification resignFirstResponder];
    [PassWord resignFirstResponder];
    [PassWordAgain resignFirstResponder];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [PhoneNumber resignFirstResponder];
    [PassWord resignFirstResponder];
    [PassWordAgain resignFirstResponder];
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
