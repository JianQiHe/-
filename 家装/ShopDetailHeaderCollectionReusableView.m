//
//  ShopDetailHeaderCollectionReusableView.m
//  家装
//
//  Created by mac on 16/8/4.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ShopDetailHeaderCollectionReusableView.h"

@implementation ShopDetailHeaderCollectionReusableView
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *imgv = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, Width, 150)];
        UIImage *img = [UIImage imageNamed:@"shangjiatupian.jpg"];
        imgv.image = img;
        imgv.contentMode =  UIViewContentModeScaleAspectFill;
        imgv.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        imgv.clipsToBounds  = YES;
        [self addSubview:imgv];
        
        self.imgv2 = [[UIImageView alloc]init];
        [imgv addSubview:self.imgv2];
        self.imgv2.layer.cornerRadius = 25;
        self.imgv2.clipsToBounds = YES;
        [self.imgv2 mas_makeConstraints:^(MASConstraintMaker *make){
            make.left.equalTo(imgv.mas_left).offset(15);
            make.width.equalTo(@60);
            make.height.equalTo(@60);
            make.bottom.equalTo(imgv.mas_bottom).offset(-15);
    }];
        
        self.name = [[UILabel alloc]init];
        self.name.numberOfLines=0;
        self.name.lineBreakMode = NSLineBreakByTruncatingTail;
        self.name.font = [UIFont systemFontOfSize:13];
        [imgv addSubview:self.name];
        [self.name mas_makeConstraints:^(MASConstraintMaker *make){
            make.left.equalTo(self.imgv2.mas_right).offset(5);
            make.bottom.equalTo(self.imgv2.mas_bottom).offset(-15);
            make.height.equalTo(@15);
            make.width.equalTo(@150);
        }];

    }
    return self;
}
@end
