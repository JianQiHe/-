//
//  ShopTableViewCell.m
//  家装
//
//  Created by mac on 16/7/9.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ShopTableViewCell.h"

@implementation ShopTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initShopTableViewCell];
    }
    return  self;
}

-(void)initShopTableViewCell
{
    ShopTableViewCell *Cell = self;
    
    UIView *view = [[UIView alloc]init];
    [Cell addSubview:view];
    view.backgroundColor = [UIColor whiteColor];
    [view mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(Cell.mas_left);
        make.right.equalTo(Cell.mas_right);
        make.top.equalTo(Cell.mas_top);
        make.bottom.equalTo(Cell.mas_bottom).offset(-10);
    }];
    
    self.titlelab = [[UILabel alloc]init];
    [view addSubview:self.titlelab];
    self.titlelab.font = [UIFont fontWithName:@"Thonburi" size:13];
    self.titlelab.lineBreakMode = NSLineBreakByWordWrapping;
    [self.titlelab mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(view.mas_left).offset(10);
        make.top.equalTo(view.mas_top);
        make.height.equalTo(@20);
        
    }];
    
    self.datelinelab = [[UILabel alloc]init];
    [view addSubview:self.datelinelab];
    self.datelinelab.font = [UIFont fontWithName:@"Thonburi" size:11];
    self.datelinelab.textColor = [UIColor lightGrayColor];
    self.datelinelab.lineBreakMode = NSLineBreakByWordWrapping;
    [self.datelinelab mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.titlelab.mas_right).offset(10);
        make.bottom.equalTo(self.titlelab.mas_bottom);
        make.height.equalTo(@20);
    }];
    
    
    self.faceimageV = [[UIImageView alloc]init];
    [view addSubview: self.faceimageV];
    [self.faceimageV mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.titlelab.mas_left);
        make.top.equalTo(self.titlelab.mas_bottom).offset(5);
        make.width.equalTo(@60);
        make.height.equalTo(@60);
        
    }];
    
    
    self.phonelab = [[UILabel alloc]init];
    [view addSubview:self.phonelab];
    self.phonelab.font = [UIFont fontWithName:@"Thonburi" size:9];
    self.phonelab.textColor = [UIColor lightGrayColor];
    self.phonelab.lineBreakMode = NSLineBreakByWordWrapping;
    [self.phonelab mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.titlelab.mas_left);
        make.top.equalTo(self.faceimageV.mas_bottom).offset(5);
        make.height.equalTo(@15);
    }];
    
    
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
