//
//  RequestServer.m
//  家装
//
//  Created by *** on 16/10/14.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "RequestServer.h"
#import "AFNetworking.h"


@implementation RequestServer

+ (void)RequestWithURL:(NSString *)urlStr type:(NSString *)type paramsDic:(NSDictionary *)pamsDic  success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure {

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.securityPolicy.allowInvalidCertificates = YES;
    manager.requestSerializer.HTTPShouldHandleCookies = YES;
    manager.requestSerializer.timeoutInterval = 15;
    
    NSLog(@"URL: %@", urlStr);
    NSLog(@"PamasDic: %@", pamsDic);
    
    [manager POST:urlStr parameters:pamsDic success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        NSString *html = operation.responseString;
        NSData* data=[html dataUsingEncoding:NSUTF8StringEncoding];
        id dict=[NSJSONSerialization  JSONObjectWithData:data options:0 error:nil];
        NSLog(@"%@", dict);
        success(operation, responseObject);
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        
        NSLog(@"错误信息：error: %@", error.description);
        failure(operation, error);
    }];
}

@end
