//
//  GroupShopCollectionViewCell.m
//  家装
//
//  Created by mac on 16/6/30.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "GroupShopCollectionViewCell.h"

@implementation GroupShopCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        [self createGroupShopCell];
        
    }
    
    return self;
}
-(void)createGroupShopCell
{
    GroupShopCollectionViewCell *cell = self;
    
    self.imagev = [[UIImageView alloc]init];
    self.imagev.backgroundColor = [UIColor darkGrayColor];
    [cell addSubview:self.imagev];
    [self.imagev mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(cell.mas_left).offset(5);
        make.top.equalTo(cell.mas_top).offset(10);
        make.right.equalTo(cell.mas_right).offset(-5);
        make.bottom.equalTo(cell.mas_bottom).offset(-50);
    }];
    
    
    self.nameLab = [[UILabel alloc]init];
    self.nameLab.lineBreakMode = NSLineBreakByTruncatingTail;//后面的以...显示
    self.nameLab.font = [UIFont systemFontOfSize:12];
    self.nameLab.textColor = [UIColor blackColor];
    [cell addSubview:self.nameLab];
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.imagev.mas_left);
        make.right.equalTo(self.imagev.mas_right);
        make.height.equalTo(@15);
        make.top.equalTo(self.imagev.mas_bottom);
}];

    self.lab = [[UILabel alloc]init];
    self.lab.numberOfLines = 0;
    self.lab.lineBreakMode = NSLineBreakByTruncatingTail;//后面的以...显示
    self.lab.font = [UIFont systemFontOfSize:9];
    self.lab.textColor = [UIColor grayColor];
    [cell addSubview:self.lab];
    [self.lab mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.nameLab.mas_left);
        make.height.equalTo(@15);
        make.top.equalTo(self.nameLab.mas_bottom).offset(5);
}];

    
    
    self.Moneylab = [[UILabel alloc]init];
    self.Moneylab.numberOfLines = 0;
    self.Moneylab.lineBreakMode = NSLineBreakByTruncatingTail;//后面的以...显示
    self.Moneylab.font = [UIFont systemFontOfSize:15];
    self.Moneylab.textColor = [UIColor redColor];
    [cell addSubview:self.Moneylab];
    [self.Moneylab mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.lab.mas_right);
        make.bottom.equalTo(self.lab.mas_bottom);
        make.height.equalTo(@20);
    }];
    
    
    self.Peoplelab = [[UILabel alloc]init];
    self.Peoplelab.numberOfLines = 0;
    self.Peoplelab.lineBreakMode = NSLineBreakByTruncatingTail;//后面的以...显示
    self.Peoplelab.font = [UIFont systemFontOfSize:10];
    self.Peoplelab.textColor = [UIColor grayColor];
    [cell addSubview:self.Peoplelab];
    [self.Peoplelab mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.imagev.mas_left);
        make.top.equalTo(self.lab.mas_bottom);
        make.height.equalTo(@15);
    }];
    
    self.btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.btn.titleLabel.font = [UIFont systemFontOfSize:12];
    [cell addSubview:self.btn];
    [self.btn mas_makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(cell.mas_right).offset(-5);
        make.height.equalTo(@15);
        make.bottom.equalTo(self.Peoplelab.mas_bottom);
        make.width.equalTo(@50);
    }];
    
    
}
@end
