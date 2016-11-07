//
//  MoreProductCollectionViewCell.m
//  家装
//
//  Created by mac on 16/7/13.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "MoreProductCollectionViewCell.h"

@implementation MoreProductCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        [self creatMoreProductCell];
        
    }
    
    return self;
}
-(void)creatMoreProductCell
{
    
    MoreProductCollectionViewCell *cell = self;

    cell.backgroundColor = [UIColor whiteColor];
    
    self.imagV = [[UIImageView alloc]init];
    [cell addSubview:self.imagV];
    [self.imagV mas_makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(cell.mas_right);
        make.top.equalTo(cell.mas_top);
        make.bottom.equalTo(cell.mas_bottom).offset(-50);
        make.left.equalTo(cell.mas_left);
    }];
    
    self.titlelab = [[UILabel alloc]init];
    [cell addSubview:self.titlelab];
    self.titlelab.numberOfLines = 2;
    self.titlelab.lineBreakMode = NSLineBreakByTruncatingTail;
    self.titlelab.font = [UIFont systemFontOfSize:10];
    [self.titlelab mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(cell.mas_left);
        make.right.equalTo(cell.mas_right);
        make.top.equalTo(self.imagV.mas_bottom);
        make.height.equalTo(@30);
    }];
    
    
    self.pricelab = [[UILabel alloc]init];
    [cell addSubview:self.pricelab];
    self.pricelab.lineBreakMode = NSLineBreakByWordWrapping;
    self.pricelab.textColor = [UIColor redColor];
    self.pricelab.font = [UIFont systemFontOfSize:10];
    [self.pricelab mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(cell.mas_left);
        make.top.equalTo(self.titlelab.mas_bottom);
        make.height.equalTo(@15);
    }];
    
    
    self.market_pricelab = [[UILabel alloc]init];
    [cell addSubview:self.market_pricelab];
    self.market_pricelab.lineBreakMode = NSLineBreakByWordWrapping;
    self.market_pricelab.textColor = [UIColor lightGrayColor];
    self.market_pricelab.font = [UIFont systemFontOfSize:8];
    [self.market_pricelab mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.pricelab.mas_right).offset(5);
        make.bottom.equalTo(self.pricelab.mas_bottom);
        make.height.equalTo(@15);
    }];
    
    
    UILabel *linelab = [[UILabel alloc]init];
    linelab.backgroundColor = [UIColor darkGrayColor];
    [self.market_pricelab addSubview:linelab];
     [linelab mas_makeConstraints:^(MASConstraintMaker *make){
         make.left.equalTo(self.market_pricelab.mas_left);
         make.right.equalTo(self.market_pricelab.mas_right);
         make.top.equalTo(self.market_pricelab.mas_centerY);
         make.height.equalTo(@0.5);
         
    }];
    
    
    self.citylab = [[UILabel alloc]init];
    [cell addSubview:self.citylab];
    self.citylab.lineBreakMode = NSLineBreakByWordWrapping;
    self.citylab.textColor = [UIColor lightGrayColor];
    self.citylab.font = [UIFont systemFontOfSize:8];
    [self.citylab mas_makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(cell.mas_right).offset(-5);
        make.bottom.equalTo(self.pricelab.mas_bottom);
        make.height.equalTo(@15);
    }];
}
@end
