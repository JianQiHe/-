//
//  YYDDTableViewCell.m
//  家装
//
//  Created by mac on 16/7/8.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "YYDDTableViewCell.h"

@implementation YYDDTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initYYDDTableViewCell];
    }
    return  self;
}
-(void)initYYDDTableViewCell
{
    YYDDTableViewCell *Cell = self;
    
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

    
    self.contactlab = [[UILabel alloc]init];
    [view addSubview:self.contactlab];
    self.contactlab.font = [UIFont fontWithName:@"Thonburi" size:10];
    self.contactlab.lineBreakMode = NSLineBreakByWordWrapping;
    self.contactlab.textColor = [UIColor redColor];
    [self.contactlab mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.titlelab.mas_right).offset(10);
        make.bottom.equalTo(self.titlelab .mas_bottom);
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
        make.top.equalTo(self.faceimageV .mas_bottom).offset(5);
        make.height.equalTo(@15);
        
    }];

    
    self.mobilelab = [[UILabel alloc]init];
    [view addSubview:self.mobilelab];
    self.mobilelab.font = [UIFont fontWithName:@"Thonburi" size:9];
    self.mobilelab.textColor = [UIColor lightGrayColor];
    self.mobilelab.lineBreakMode = NSLineBreakByWordWrapping;
    [self.mobilelab mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.phonelab.mas_right).offset(10);
        make.top.equalTo(self.faceimageV .mas_bottom).offset(5);
        make.height.equalTo(@15);
        
    }];
    
    
    self.datelinelab = [[UILabel alloc]init];
    [view addSubview:self.datelinelab];
    self.datelinelab.font = [UIFont fontWithName:@"Thonburi" size:9];
    self.datelinelab.textColor = [UIColor lightGrayColor];
    self.datelinelab.lineBreakMode = NSLineBreakByWordWrapping;
    [self.datelinelab mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.mobilelab.mas_right).offset(10);
        make.top.equalTo(self.faceimageV.mas_bottom).offset(5);
        make.height.equalTo(@15);
    }];
    
    
    
    self.addrlab = [[UILabel alloc]init];
    [view addSubview:self.addrlab];
    self.addrlab.font = [UIFont fontWithName:@"Thonburi" size:9];
    self.addrlab.textColor = [UIColor lightGrayColor];
    self.addrlab.lineBreakMode = NSLineBreakByWordWrapping;
    [self.addrlab mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.titlelab.mas_left);
        make.top.equalTo(self.phonelab .mas_bottom).offset(5);
        make.height.equalTo(@15);
        
    }];

    

    
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
