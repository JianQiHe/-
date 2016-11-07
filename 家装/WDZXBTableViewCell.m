//
//  WDZXBTableViewCell.m
//  家装
//
//  Created by mac on 16/7/9.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "WDZXBTableViewCell.h"

@implementation WDZXBTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initCreatWDZXBTableViewCell];
    }
    return self;
}

-(void)initCreatWDZXBTableViewCell
{
    WDZXBTableViewCell *Cell = self;
    UIView *view =[[UIView alloc]init];
    [Cell addSubview:view];
    view.backgroundColor = [UIColor colorWithRed:0/255.0 green:191/255.0 blue:181/255.0 alpha:1];
    [view mas_makeConstraints:^(MASConstraintMaker *make){
    make.top.equalTo(Cell.mas_top).offset(5);
    make.left.equalTo(Cell.mas_left).offset(10);
    make.right.equalTo(Cell.mas_right).offset(-10);
    make.height.equalTo(Cell.mas_bottom).offset(-5);
}];
    
    self.contactlab = [[UILabel alloc]init];
    [view addSubview:self.contactlab];
    self.contactlab.font = [UIFont fontWithName:@"Thonburi" size:14];
    self.contactlab.lineBreakMode = NSLineBreakByWordWrapping;
    self.contactlab.textColor = [UIColor whiteColor];
    [self.contactlab mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(view.mas_left).offset(10);
        make.top.equalTo(view.mas_top).offset(5);
        make.height.equalTo(@15);
    }];

    
    
    self.mobilelab = [[UILabel alloc]init];
    [view addSubview:self.mobilelab];
    self.mobilelab.font = [UIFont fontWithName:@"Thonburi" size:11];
    self.mobilelab.lineBreakMode = NSLineBreakByWordWrapping;
    self.mobilelab.textColor = [UIColor whiteColor];
    [self.mobilelab mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.contactlab.mas_right).offset(10);
        make.top.equalTo(view.mas_top).offset(5);
        make.height.equalTo(@15);
    }];
    
    
    
    self.statuslab = [[UILabel alloc]init];
    [view addSubview:self.statuslab];
    self.statuslab.font = [UIFont fontWithName:@"Thonburi" size:9];
    self.statuslab.lineBreakMode = NSLineBreakByWordWrapping;
    self.statuslab.textColor = [UIColor whiteColor];
    [self.statuslab mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(view.mas_left).offset(10);
        make.top.equalTo(self.contactlab.mas_bottom).offset(5);
        make.height.equalTo(@15);
    }];
    
    
    
    self.remarklab = [[UILabel alloc]init];
    [view addSubview:self.remarklab];
    self.remarklab.font = [UIFont fontWithName:@"Thonburi" size:9];
    self.remarklab.lineBreakMode = NSLineBreakByWordWrapping;
    self.remarklab.textColor = [UIColor whiteColor];
    [self.remarklab mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.statuslab.mas_right).offset(10);
        make.top.equalTo(self.statuslab.mas_top);
        make.height.equalTo(@15);
    }];
    
    
    
    
    self.auditlab = [[UILabel alloc]init];
    [view addSubview:self.auditlab];
    self.auditlab.font = [UIFont fontWithName:@"Thonburi" size:9];
    self.auditlab.lineBreakMode = NSLineBreakByWordWrapping;
    self.auditlab.textColor = [UIColor whiteColor];
    [self.auditlab mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(view.mas_left).offset(10);
        make.top.equalTo(self.statuslab.mas_bottom).offset(5);
        make.height.equalTo(@15);
    }];
    
    
    
    self.datelinelab = [[UILabel alloc]init];
    [view addSubview:self.datelinelab];
    self.datelinelab.font = [UIFont fontWithName:@"Thonburi" size:9];
    self.datelinelab.lineBreakMode = NSLineBreakByWordWrapping;
    self.datelinelab.textColor = [UIColor whiteColor];
    [self.datelinelab mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.auditlab.mas_right).offset(10);
        make.top.equalTo(self.auditlab.mas_top);
        make.height.equalTo(@15);
    }];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
