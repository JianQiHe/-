//
//  GRZLViewController.h
//  家装
//
//  Created by mac on 16/5/12.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GRZLViewController;
@protocol PassValueDelegate <NSObject>

- (void)passValue:(NSMutableDictionary *)value;

@end


@interface GRZLViewController : UIViewController

@property (nonatomic, weak) id<PassValueDelegate> delegate;


@end



