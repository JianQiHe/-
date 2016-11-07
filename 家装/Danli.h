//
//  Danli.h
//  家装
//
//  Created by mac on 16/7/19.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Danli : NSObject


/**
 *  获取单例类
 *
 *  @return 单例类对象
 */
+(instancetype) sharedInstance;

@property (strong, nonatomic) NSString *status;




@end
