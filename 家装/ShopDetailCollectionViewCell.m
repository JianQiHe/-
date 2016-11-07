//
//  ShopDetailCollectionViewCell.m
//  家装
//
//  Created by mac on 16/8/4.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ShopDetailCollectionViewCell.h"

@implementation ShopDetailCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self CreatShopDetailCollectionViewCell];
    }
    return self;
}
-(void)CreatShopDetailCollectionViewCell
{
    
    ShopDetailCollectionViewCell *cell = self;
    
    self.imgaV = [[UIImageView alloc]init];
    [cell addSubview:self.imgaV];
    [self.imgaV mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(cell.mas_left);
        make.right.equalTo(cell.mas_right);
        make.top.equalTo(cell.mas_top);
        make.height.equalTo(@80);
    }];
    
    
    self.titlelab = [[UILabel alloc]init];
    self.titlelab.font = [UIFont systemFontOfSize:12];
    self.titlelab.lineBreakMode = NSLineBreakByTruncatingTail;
    self.titlelab.numberOfLines = 2;
    [cell addSubview:self.titlelab];
    [self.titlelab mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(cell.mas_left);
        make.right.equalTo(cell.mas_right);
        make.top.equalTo(self.imgaV.mas_bottom);
        make.height.equalTo(@30);
    }];
    
    self.price_lab = [[UILabel alloc]init];
    self.price_lab.font = [UIFont systemFontOfSize:12];
    self.price_lab.lineBreakMode = NSLineBreakByWordWrapping;
    self.price_lab.textColor = [UIColor redColor];
    [cell addSubview:self.price_lab];
    [self.price_lab mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(cell.mas_left).offset(5);
        make.top.equalTo(self.titlelab.mas_bottom).offset(2);
        make.height.equalTo(@15);
    }];
    
    
    self.marketprice_lab = [[UILabel alloc]init];
    self.marketprice_lab.font = [UIFont systemFontOfSize:11];
    self.marketprice_lab.lineBreakMode = NSLineBreakByWordWrapping;
    self.marketprice_lab.textColor = [UIColor grayColor];
    [cell addSubview:self.marketprice_lab];
    [self.marketprice_lab mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.price_lab.mas_right).offset(5);
        make.top.equalTo(self.titlelab.mas_bottom).offset(2);
        make.height.equalTo(@15);
    }];
    
    
    
    UILabel *linelab = [[UILabel alloc]init];
    linelab.backgroundColor = [UIColor grayColor];
    [self.marketprice_lab addSubview:linelab];
    [linelab mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.marketprice_lab.mas_left);
        make.centerY.equalTo(self.marketprice_lab.mas_centerY);
        make.width.equalTo(self.marketprice_lab.mas_width);
        make.height.equalTo(@1);
    }];
}
@end
