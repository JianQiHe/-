//
//  ChangePasswordViewController.m
//  家装
//
//  Created by mac on 16/7/4.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ChangePasswordViewController.h"

@interface ChangePasswordViewController ()<UITextFieldDelegate>

@end

@implementation ChangePasswordViewController
{
    UITextField *OldPassWord;
    UITextField *NewPassWord;
    UITextField *NewPassWordAgain;
    
    UIButton *Sure;
    NSDictionary *dict;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //收回键盘
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(reKeyBoard)];
    [self.view addGestureRecognizer:tap];

    
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    OldPassWord = [[UITextField alloc]init];
    OldPassWord.secureTextEntry = YES;//密码形式
    OldPassWord.placeholder = @"   请输入旧密码";
    OldPassWord.font = [UIFont systemFontOfSize:12];
    OldPassWord.delegate = self;
    OldPassWord.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    OldPassWord.backgroundColor = [UIColor whiteColor];
    OldPassWord.clearButtonMode = UITextFieldViewModeWhileEditing;  //  （编辑的时候显示，否则不显示）
    [self.view addSubview:OldPassWord];
    [OldPassWord mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.view.mas_left).offset(80);
        make.right.equalTo(self.view.mas_right);
        make.top.equalTo(self.view.mas_top).offset(64);
        make.height.equalTo(@45);
    }];

    
    NewPassWord = [[UITextField alloc]init];
    NewPassWord.placeholder = @"   请输入新密码";
     NewPassWord.secureTextEntry = YES;//密码形式
    NewPassWord.font = [UIFont systemFontOfSize:12];
    NewPassWord.delegate = self;
    NewPassWord.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    NewPassWord.backgroundColor = [UIColor whiteColor];
    NewPassWord.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.view addSubview:NewPassWord];
    [NewPassWord mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.view.mas_left).offset(80);
        make.right.equalTo(self.view.mas_right);
        make.top.equalTo(OldPassWord.mas_bottom);
        make.height.equalTo(@45);
    }];
    
    
    
    NewPassWordAgain = [[UITextField alloc]init];
    NewPassWordAgain.placeholder = @"   请再次输入密码";
     NewPassWordAgain.secureTextEntry = YES;//密码形式
    NewPassWordAgain.font = [UIFont systemFontOfSize:12];
    NewPassWordAgain.delegate = self;
    NewPassWordAgain.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    NewPassWordAgain.backgroundColor = [UIColor whiteColor];
    NewPassWordAgain.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.view addSubview:NewPassWordAgain];
    [NewPassWordAgain mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.view.mas_left).offset(80);
        make.right.equalTo(self.view.mas_right);
        make.top.equalTo(NewPassWord.mas_bottom);
        make.height.equalTo(@45);
    }];

    
    for (int b=0; b<3; b++) {
        NSArray *arr = @[@"旧密码",@"新密码",@"确认密码"];
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
    
    
    Sure = [UIButton buttonWithType:UIButtonTypeCustom];
    [Sure addTarget:self action:@selector(Sure) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:Sure];
    [Sure setTitle:@"确认" forState:UIControlStateNormal];
    [Sure setTintColor:[UIColor whiteColor]];
    Sure.backgroundColor = [UIColor clearColor];
    [Sure setBackgroundColor:[UIColor orangeColor]];
    Sure.layer.cornerRadius = 3;
    [Sure mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.view.mas_left).offset(10);
        make.right.equalTo(self.view.mas_right).offset(-10);
        make.top.equalTo(NewPassWordAgain.mas_bottom).offset(10);
        make.height.equalTo(@36);
    }];


    // Do any additional setup after loading the view.
}
-(void)Sure
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *dic  = [userDefaults objectForKey:@"User"];
    NSLog(@"能取到数据吗？%@",dic);
    if ([NewPassWord.text isEqualToString:NewPassWordAgain.text ]) {
        NSString *UidStr = dic[@"data"][0][@"uid"];
        NSString *oldpasswd = OldPassWord.text;
        NSString *newpasswd = NewPassWord.text;
        NSString *str=[NSString stringWithFormat:@"http://jiazhuang.siruoit.com/index.php?api/api-passwd/%@/%@/%@",UidStr,oldpasswd,newpasswd];
        NSURL *url = [NSURL URLWithString:[str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];                        // UTF－8
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc]initWithRequest:request];
        // 请求数据，设置成功与失败的回调函数
        [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSString *html = operation.responseString;
            id data=[html dataUsingEncoding:NSUTF8StringEncoding];
            dict=[NSJSONSerialization  JSONObjectWithData:data options:0 error:nil];
            NSString *tishi = dict[@"data"][0][@"msg"];
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:tishi delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alertView show];
            
        }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSString *tishi = dict[@"data"][0][@"msg"];
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:tishi delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alertView show];
            NSLog(@"发生错误！%@",error);
            
        }];
        // 加入队列
        NSOperationQueue *queue = [[NSOperationQueue alloc] init];
        [queue addOperation:operation];

    }else
    {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"前后两次密码输入不同" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertView show];
    }
    
    
    
    
   
    
    
}
- (void)reKeyBoard
{
    [OldPassWord resignFirstResponder];
    [NewPassWord resignFirstResponder];
    [NewPassWordAgain resignFirstResponder];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [OldPassWord resignFirstResponder];
    [NewPassWord resignFirstResponder];
    [NewPassWordAgain resignFirstResponder];
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
