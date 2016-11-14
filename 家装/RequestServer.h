//
//  RequestServer.h
//  家装
//
//  Created by *** on 16/10/14.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RequestServer : NSObject

+ (void)RequestWithURL:(NSString *)urlStr type:(NSString *)type paramsDic:(NSDictionary *)pamsDic  success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

@end
