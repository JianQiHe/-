//
//  DesignCollectionHeaderView.m
//  家装
//
//  Created by mac on 16/8/5.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "DesignCollectionHeaderView.h"

@implementation DesignCollectionHeaderView
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _titleLab = [[UILabel alloc]init];
        _titleLab.frame =CGRectMake(10,0, self.frame.size.width,self.frame.size.height);
        _titleLab.textAlignment =0;
        _titleLab.textColor = [UIColor grayColor];
        _titleLab.font = [UIFont systemFontOfSize:10];
        _titleLab.backgroundColor = [UIColor whiteColor];
        [self addSubview:_titleLab];
    }
    return self;
}

@end
