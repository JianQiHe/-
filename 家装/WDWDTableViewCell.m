//
//  WDWDTableViewCell.m
//  家装
//
//  Created by mac on 16/7/5.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "WDWDTableViewCell.h"

@implementation WDWDTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self initWDWDTableViewCell];
    }
    return self;
}
-(void)initWDWDTableViewCell
{
    WDWDTableViewCell *Cell  = self;
    
    UIView *View = [[UIView alloc]init];
    View.backgroundColor = [UIColor whiteColor];
    [Cell addSubview:View];
    [View mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(Cell.mas_top).offset(5);
        make.left.equalTo(Cell.mas_left);
        make.right.equalTo(Cell.mas_right);
        make.bottom.equalTo(Cell.mas_bottom);
    }];
    
    
    self.lab2 = [[UILabel alloc]init];
    self.lab2.font = [UIFont systemFontOfSize:10];
    self.lab2.textColor = [UIColor lightGrayColor];
//    self.lab2.numberOfLines = 0;
//    self.lab2.lineBreakMode = NSLineBreakByTruncatingTail;
    [View addSubview:self.lab2];
    [self.lab2 mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(View.mas_top).offset(5);
        make.right.equalTo(View.mas_right);
        make.height.equalTo(@20);
        make.width.equalTo(@110);
    }];
    
    
    
    
    self.lab = [[UILabel alloc]init];
    self.lab.font = [UIFont systemFontOfSize:15];
//    self.lab.numberOfLines = 0;
//    self.lab.lineBreakMode = NSLineBreakByTruncatingTail;
    self.lab.lineBreakMode = NSLineBreakByWordWrapping;
    [View addSubview:self.lab];
    [self.lab mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(View.mas_top).offset(5);
        make.left.equalTo(View.mas_left).offset(5);
        make.right.equalTo(self.lab2.mas_left).offset(-5);
        make.height.equalTo(@20);
    }];
    
    


    
    
    
    self.lab3 = [[UILabel alloc]init];
    self.lab3.font = [UIFont systemFontOfSize:9];
    self.lab3.textColor = [UIColor lightGrayColor];
    self.lab3.numberOfLines = 0;
    self.lab3.lineBreakMode = NSLineBreakByTruncatingTail;
    [View addSubview:self.lab3];
    [self.lab3 mas_makeConstraints:^(MASConstraintMaker *make){
        make.bottom.equalTo(View.mas_bottom).offset(-2);
        make.left.equalTo(View.mas_left).offset(10);
        make.height.equalTo(@15);
    }];
    
    
    self.lab4 = [[UILabel alloc]init];
    self.lab4.font = [UIFont systemFontOfSize:9];
    self.lab4.textColor = [UIColor lightGrayColor];
    self.lab4.numberOfLines = 0;
    self.lab4.lineBreakMode = NSLineBreakByTruncatingTail;
    [View addSubview:self.lab4];
    [self.lab4 mas_makeConstraints:^(MASConstraintMaker *make){
        make.bottom.equalTo(self.lab3.mas_bottom);
        make.left.equalTo(self.lab3.mas_right).offset(10);
        make.height.equalTo(@15);
    }];
    
    
    self.lab5 = [[UILabel alloc]init];
    self.lab5.font = [UIFont systemFontOfSize:10];
    self.lab5.textColor = [UIColor redColor];
    self.lab5.numberOfLines = 0;
    self.lab5.lineBreakMode = NSLineBreakByTruncatingTail;
    [View addSubview:self.lab5];
    [self.lab5 mas_makeConstraints:^(MASConstraintMaker *make){
        make.bottom.equalTo(self.lab4.mas_bottom);
        make.right.equalTo(View.mas_right).offset(-5);
        make.height.equalTo(@20);
    }];
    
    
//    UIImageView *imgV = [[UIImageView alloc]init];
//    imgV.backgroundColor = [UIColor grayColor];
//    [View addSubview:imgV];
//    [imgV mas_makeConstraints:^(MASConstraintMaker *make){
//        make.top.equalTo(View.mas_top).offset(15);
//        make.left.equalTo(View.mas_left).offset(15);
//        make.width.equalTo(@30);
//        make.height.equalTo(@30);
//    }];
///    UILabel *lab2 = [[UILabel alloc]init];
//    lab2.text = @"问题描述问题描述问题描述问题描述问题描述问题描述问题描述问题描述问题描述问题描述问题描述问题描述问题描述问题描述问题描述问题描述问题描述问题描述问题描述问题描述问题描述问题描述问题描述问题描述问题描述问题描述问题描述问题描述问题描述问题描述问题描述问题描述问题描述问题描述问题描述问题描述问题描述问题描述问题描述问题描述问题描述问题描述问题描述问题描述问题描述问题描述";
//    lab2.numberOfLines = 0;
//    lab2.lineBreakMode = 0;
//    lab2.font = [UIFont systemFontOfSize:10];
//    [View addSubview:lab2];
//    [lab2 mas_makeConstraints:^(MASConstraintMaker *make){
//        make.top.equalTo(lab.mas_bottom);
//        make.left.equalTo(lab.mas_left);
//        make.right.equalTo(View.mas_right).offset(-5);
//        make.height.equalTo(@40);
//    }];
//    
//    
//    
//    UILabel *lab3 = [[UILabel alloc]init];
//    lab3.text = @"已解决";
//    lab3.textColor = [UIColor greenColor];
//    lab3.font = [UIFont systemFontOfSize:15];
//    [View addSubview:lab3];
//    [lab3 mas_makeConstraints:^(MASConstraintMaker *make){
//        make.right.equalTo(View.mas_right).offset(-5);
//        make.bottom.equalTo(View.mas_bottom);
//        make.width.equalTo(@60);
//        make.height.equalTo(@20);
//    }];
    
    

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
