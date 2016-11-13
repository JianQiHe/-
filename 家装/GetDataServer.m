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

@end
