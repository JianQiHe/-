//
//  ShopClassCollectionHeaderVIew.m
//  家装
//
//  Created by mac on 16/8/8.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ShopClassCollectionHeaderVIew.h"

@implementation ShopClassCollectionHeaderVIew
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _titleLab = [[UILabel alloc]init];
        //        _titleLab.frame =CGRectMake(10,0, self.frame.size.width,15);
        _titleLab.textAlignment =0;
        _titleLab.textColor = [UIColor blackColor];
        _titleLab.font = [UIFont systemFontOfSize:11];
        _titleLab.backgroundColor = [UIColor whiteColor];
        [self addSubview:_titleLab];
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make){
            make.left.equalTo(self.mas_left).offset(10);
            make.width.equalTo(self.mas_width);
            make.height.equalTo(@20);
            make.bottom.equalTo(self.mas_bottom);
        }];
    }
    return self;
}
@end
