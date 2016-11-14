//
//  GetDataServer.h
//  家装
//
//  Created by HJQ on 2016/11/13.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^CallBack) (id obj);

@interface GetDataServer : NSObject

+ (void)zhuangXiuRiJi:(NSString *)url paramsDic:(NSDictionary *)dic CallBack:(CallBack)callBack;

@end
