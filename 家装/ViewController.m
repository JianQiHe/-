//
//  ViewController.m
//  家装
//
//  Created by mac on 16/5/3.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking.h>
@interface ViewController ()

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
//    NSString *str=[NSString stringWithFormat:@"http://jiazhuang.siruoit.com/index.php?mall/store/cate_list"];
//    
//    NSURL *url = [NSURL URLWithString:[str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];                        // UTF－8
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc]initWithRequest:request];
//    // 请求数据，设置成功与失败的回调函数
//    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSString *html = operation.responseString;
//        NSData* data=[html dataUsingEncoding:NSUTF8StringEncoding];
//        id dict=[NSJSONSerialization  JSONObjectWithData:data options:0 error:nil];
//        NSLog(@"获取到的数据为1111：%@",dict);
//        NSLog(@"sss:%@",dict[@"data"][0][@"title"]);
//    }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"发生错误！%@",error);
//    }];
//    // 加入队列
//    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
//    [queue addOperation:operation];
    

    
    
    
    
    
//    // 1.获得请求管理者
//    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
//    
//    // 2.封装请求参数
//    NSMutableDictionary *params = [NSMutableDictionary dictionary];
//    params[@"userId"] = [appDefault objectForKey:@"userId"];
//    params[@"IMSI"] = _IMSI.text;
//    params[@"nickName"] = _nickName.text;
//    params[@"phoneNumber"] = _phoneNumber.text;
//    
//    NSString *url = [ServiceInfo stringByAppendingString:@"http://103.238.80.57:8080/Vietnam/Application/bindingDevice"];
//    
//    // 3.发送GET请求
//    [mgr GET:url parameters:params
//     success:^(AFHTTPRequestOperation *operation, id responseObject) {
//         NSLog(@"%@",responseObject);
//     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//         NSLog(@"%@",error);
//     }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
