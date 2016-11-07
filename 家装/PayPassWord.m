//
//  PayPassWord.m
//  家装
//
//  Created by mac on 16/7/18.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "PayPassWord.h"
#import "Danli.h"
#import "MBProgressHUD+NJ.h"



@interface PayPassWord()<MBProgressHUDDelegate,UITextFieldDelegate>


@end
@implementation PayPassWord
{
    NSDictionary *dict;
    NSDictionary *parmDictionary;
    NSString *jsonStr;
}

-(void)viewDidLoad{ 
    self.view.backgroundColor = [UIColor colorWithRed:232/255.0 green:235/255.0 blue:243/255.0 alpha:1];
//    [self order];
    [self createView];
}

- (void)createView{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(touchUpCommBtn) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor orangeColor];
    [btn setTitle:@"确定" forState:UIControlStateNormal];
    btn.layer.cornerRadius = 5;
    [btn mas_makeConstraints:^(MASConstraintMaker *make){
        make.bottom.equalTo(self.view.mas_bottom).offset(-40);
        make.height.equalTo(@36);
        make.right.equalTo(self.view.mas_right).offset(-10);
        make.left.equalTo(self.view.mas_left).offset(10);
        make.centerX.equalTo(self.view.mas_centerX);
    }];
    
    UIView *bgView = [[UIView alloc]init];
    bgView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.top.equalTo(self.view.mas_top).offset(64);
        make.height.equalTo(@40);
    }];
    
    UILabel *newLab = [UILabel new];
    newLab.text = @"新密码:";
    newLab.font = [UIFont systemFontOfSize:14];
    [bgView addSubview:newLab];
    [newLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgView.mas_left).offset(10);
        make.top.equalTo(bgView.mas_top).offset(10);
        make.width.equalTo(@60);
        make.height.equalTo(@20);
    }];

    UITextField *passWordT = [UITextField new];
    passWordT.borderStyle = UITextBorderStyleNone;
    passWordT.font = [UIFont systemFontOfSize:14];
    [bgView addSubview:passWordT];
    [passWordT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(newLab.mas_right);
        make.right.equalTo(bgView.mas_right).offset(-10);
        make.top.equalTo(bgView.mas_top);
        make.bottom.equalTo(bgView.mas_bottom);
    }];
}

- (void)touchUpCommBtn{

}
/*
-(void)order
{
    NSDictionary *dataDictionary= [NSDictionary dictionaryWithObjectsAndKeys:@"178",@"product_id",
                                   @"德国KLC门锁 室内实木门锁 卧室房门锁欧式黑色简约木门锁把手",@"name",
                                   @"20",@"shop_id",
                                   @"上海",@"city_id",
                                   @"0",@"freight",
                                   @"",@"cart_key",
                                   @"1",@"num",
                                   @"",@"spec_id",
                                   @"139",@"product_price",nil];
    parmDictionary= [NSDictionary dictionaryWithObjectsAndKeys:dataDictionary,@"items",
                                   @"20",@"shop_ids",
                                   @"178",@"product_ids",
                                   @"237",@"uid",
                                   @"随便寄",@"addr",
                                   @"宁先生",@"contact",
                                   @"13672207712",@"mobile",
                                   @"没有备注",@"note",nil];

//    NSLog(@"%@",parmDictionary);
    [self dictionaryToJson:parmDictionary];
    
    
    
}
- (NSString*)dictionaryToJson:(NSDictionary *)dic

{
    
    NSError *parseError = nil;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:parmDictionary options:NSJSONWritingPrettyPrinted error:&parseError];

    jsonStr =[[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSLog(@"Json?%@",jsonStr);
    [self wangluo];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
}
-(void)wangluo
{
    
    NSString *str=[NSString stringWithFormat:@"http://jiazhuang.siruoit.com/index.php?api/api-create%@",jsonStr];
    
    NSURL *url = [NSURL URLWithString:[str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];                        // UTF－8
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc]initWithRequest:request];
    // 请求数据，设置成功与失败的回调函数
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSString *html = operation.responseString;
        NSData *data=[html dataUsingEncoding:NSUTF8StringEncoding];
        dict=[NSJSONSerialization  JSONObjectWithData:data options:0 error:nil];
        NSLog(@"获取到的数据为1111：%@",dict);
        
        
    }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"发生错误！%@",error);
    }];
    // 加入队列
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperation:operation];
    
}
 */
@end
