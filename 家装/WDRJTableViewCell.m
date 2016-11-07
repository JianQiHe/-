//
//  WDRJTableViewCell.m
//  家装
//
//  Created by mac on 16/7/5.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "WDRJTableViewCell.h"

@implementation WDRJTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self initWDRJTableViewCell];
    }
    return self;
}
-(void)initWDRJTableViewCell
{
    WDRJTableViewCell *cell = self;
    UIView *View = [[UIView alloc]init];
    View.backgroundColor = [UIColor whiteColor];
    [cell addSubview:View];
    [View mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(cell.mas_top).offset(5);
        make.right.equalTo(cell.mas_right);
        make.left.equalTo(cell.mas_left);
        make.bottom.equalTo(cell.mas_bottom);
    }];

    
    self.lab2 = [[UILabel alloc]init];
    self.lab2.font = [UIFont systemFontOfSize:12];
    self.lab2.textColor = [UIColor grayColor];
    [View addSubview:self.lab2];
    [self.lab2 mas_makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(cell.mas_right).offset(5);
        make.top.equalTo(View.mas_top).offset(10);
        make.height.equalTo(@12);
        make.width.equalTo(@160);
    }];
    
    self.lab1 = [[UILabel alloc]init];
    self.lab1.font = [UIFont systemFontOfSize:18];
    self.lab1.lineBreakMode = NSLineBreakByTruncatingTail;
    [View addSubview:self.lab1];
    [self.lab1 mas_makeConstraints:^(MASConstraintMaker *make){
        make.bottom.equalTo(self.lab2.mas_bottom);
        make.left.equalTo(View.mas_left).offset(5);
        make.right.equalTo(self.lab2.mas_left).offset(-5);
        make.height.equalTo(@15);
    }];
    
    self.lab3 = [[UILabel alloc]init];
    self.lab3.font = [UIFont systemFontOfSize:10];
    self.lab3.textColor = [UIColor grayColor];
    self.lab3.numberOfLines = 0;//根据最大行数需求来设置
    self.lab3.lineBreakMode = NSLineBreakByTruncatingTail;
    [View addSubview:self.lab3];
    [self.lab3 mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.lab1.mas_left);
        make.top.equalTo(self.lab1.mas_bottom).offset(5);
        make.height.equalTo(@15);
    }];
    
    
    
    self.lab4 = [[UILabel alloc]init];
    self.lab4.font = [UIFont systemFontOfSize:10];
    self.lab4.textColor = [UIColor grayColor];
    self.lab4.numberOfLines = 0;//根据最大行数需求来设置
    self.lab4.lineBreakMode = NSLineBreakByTruncatingTail;
    [View addSubview:self.lab4];
    [self.lab4 mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.lab3.mas_right).offset(20);
        make.bottom.equalTo(self.lab3.mas_bottom);
        make.height.equalTo(@15);
    }];
    
    
    self.lab5 = [[UILabel alloc]init];
    self.lab5.font = [UIFont systemFontOfSize:10];
    self.lab5.textColor = [UIColor grayColor];
    self.lab5.lineBreakMode = NSLineBreakByTruncatingTail;
    [View addSubview:self.lab5];
    [self.lab5 mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.lab4.mas_right).offset(10);
        make.bottom.equalTo(self.lab4.mas_bottom);
        make.height.equalTo(@15);
        make.right.equalTo(View.mas_right).offset(-5);
    }];
    
    
    
    CGFloat A = (Width-4*70)/5;
    
    self.imgV1 = [[UIImageView alloc]init];
    self.imgV1.backgroundColor = [UIColor grayColor];
    [View addSubview:self.imgV1];
    [self.imgV1 mas_makeConstraints:^(MASConstraintMaker *make){
    make.top.equalTo(self.lab3.mas_bottom).offset(5);
    make.left.equalTo(View.mas_left).offset(A);
    make.height.equalTo(@70);
    make.width.equalTo(@70);
}];

    
    
    self.lab6 = [[UILabel alloc]init];
    self.lab6.font = [UIFont systemFontOfSize:10];
    self.lab6.textColor = [UIColor grayColor];
    self.lab6.numberOfLines = 0;//根据最大行数需求来设置
    self.lab6.lineBreakMode = NSLineBreakByTruncatingTail;
    [View addSubview:self.lab6];
    [self.lab6 mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.lab1.mas_left);
        make.bottom.equalTo(View.mas_bottom).offset(-5);
        make.height.equalTo(@15);
    }];
    
    
    self.lab7 = [[UILabel alloc]init];
    self.lab7.font = [UIFont systemFontOfSize:10];
    self.lab7.textColor = [UIColor grayColor];
    self.lab7.numberOfLines = 0;//根据最大行数需求来设置
    self.lab7.lineBreakMode = NSLineBreakByTruncatingTail;
    [View addSubview:self.lab7];
    [self.lab7 mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.lab6.mas_right).offset(10);
        make.bottom.equalTo(self.lab6.mas_bottom);
        make.height.equalTo(@15);
    }];
    
    self.lab8 = [[UILabel alloc]init];
    self.lab8.font = [UIFont systemFontOfSize:13];
    self.lab8.textColor = [UIColor redColor];
    self.lab8.numberOfLines = 0;//根据最大行数需求来设置
    self.lab8.lineBreakMode = NSLineBreakByTruncatingTail;
    [View addSubview:self.lab8];
    [self.lab8 mas_makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(View.mas_right).offset(-5);
        make.bottom.equalTo(self.lab7.mas_bottom);
        make.height.equalTo(@15);
    }];
    
    
    
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
