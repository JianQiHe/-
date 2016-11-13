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
    
    [manager POST:@"POST" parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        NSLog(@"responseObject: %@", responseObject);
        success(operation, responseObject);
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        
        NSLog(@"error: %@", error);
        failure(operation, error);
    }];
}

@end
