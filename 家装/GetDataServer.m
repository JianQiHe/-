//
//  GetDataServer.m
//  家装
//
//  Created by HJQ on 2016/11/13.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "GetDataServer.h"
#import "RequestServer.h"

@implementation GetDataServer

+ (void)zhuangXiuRiJi:(NSString *)url paramsDic:(NSDictionary *)dic CallBack:(CallBack)callBack {
    
    [RequestServer RequestWithURL:@"" type:@"POST" paramsDic:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

+ (void)loginWithURL:(NSString *)url paramsDic:(NSDictionary *)dic CallBack:(CallBack)callBack {

    url = [NSString stringWithFormat:@"%@/%@/%@/%@", url, dic[@"type"], dic[@"userName"], dic[@"password"]];
//
    url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    [RequestServer RequestWithURL:url type:@"POST" paramsDic:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        callBack(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        callBack(nil);
    }];
        
}

+ (void)changePWDWithURL:(NSString *)url paramsDic:(NSDictionary *)dic CallBack:(CallBack)callBack {
    
    url = [NSString stringWithFormat:@"%@/%@/%@/%@", url, dic[@"ID"], dic[@"oldPWD"], dic[@"newPWD"]];
    //
    url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSLog(@"参数：%@", dic);
    
    [RequestServer RequestWithURL:url type:@"POST" paramsDic:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        id data = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        NSLog(@"返回数据：%@", data);
        
        callBack(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        callBack(nil);
    }];
}

@end
