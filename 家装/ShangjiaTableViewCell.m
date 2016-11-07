//
//  ShangjiaTableViewCell.m
//  家装
//
//  Created by mac on 16/7/15.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ShangjiaTableViewCell.h"

@implementation ShangjiaTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier])
    {
        [self CreatShangjiaTableViewCell];
    }
    return self;
}
-(void)CreatShangjiaTableViewCell
{
    ShangjiaTableViewCell *cell = self;
    
    
    UIView *v1 = [[UIView alloc]init];
    v1.backgroundColor = [UIColor whiteColor];
    [cell addSubview:v1];
    
    [v1 mas_makeConstraints:^(MASConstraintMaker *make){
        make.edges.equalTo(cell).with.insets(UIEdgeInsetsMake(10, 0, 0, 0));
        
    }];
    
    
    self.suzilab = [[UILabel alloc]init];
    self.suzilab.textAlignment = 1;
    self.suzilab.font = [UIFont systemFontOfSize:30];
    self.suzilab.textColor = [UIColor redColor];
    [v1 addSubview:self.suzilab];
    [self.suzilab mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(v1.mas_top).with.offset(-5);
        make.right.equalTo(v1.mas_right).with.offset(-5);
        make.width.equalTo(@50);
        make.height.equalTo(@40);
    }];
    
    UILabel *xinyonglab = [[UILabel alloc]init];
    xinyonglab.text = @"信用指数";
    xinyonglab.textAlignment = 0;
    xinyonglab.font = [UIFont systemFontOfSize:12];
    [v1 addSubview:xinyonglab];
    [xinyonglab mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.suzilab.mas_top).with.offset(35);
        make.right.equalTo(self.suzilab.mas_right);
        make.width.equalTo(self.suzilab.mas_width);
        make.height.equalTo(@20);
    }];
    
    
    self.img= [[UIImageView alloc]init];
    self.img.backgroundColor = [UIColor grayColor];

    [v1 addSubview:self.img];
    [self.img mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(v1).with.offset(10);
        make.left.equalTo(v1).with.offset(5);
        make.bottom.equalTo(v1).with.offset(-10);
        make.width.equalTo(@120);
        
    }];


    self.labOne= [[UILabel alloc]init];
    self.labOne.textAlignment = 0;
    self.labOne.numberOfLines = 2;
    self.labOne.lineBreakMode = NSLineBreakByTruncatingTail;
    self.labOne.font = [UIFont systemFontOfSize:11];
    [v1 addSubview:self.labOne];
    [self.labOne mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.img);
        make.height.equalTo(@30);
        make.left.equalTo(self.img.mas_right).with.offset(5);
        make.right.equalTo(xinyonglab.mas_left).offset(-2);
        
    }];
    
    


    self.labTwo = [[UILabel alloc]init];
    self.labTwo.textAlignment = 0;
    self.labTwo.font = [UIFont systemFontOfSize:9];
    self.labTwo.textColor = [UIColor blackColor];
    [v1 addSubview:self.labTwo];
    [self.labTwo mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.labOne.mas_bottom).with.offset(0);
        make.left.equalTo(self.labOne).with.offset(5);
        make.width.equalTo(self.labOne);
        make.height.equalTo(@12);
    }];

    


    self.labThree = [[UILabel alloc]init];
    self.labThree.textAlignment =0;
    self.labThree.font = [UIFont systemFontOfSize:9];
    self.labThree.textColor = [UIColor blackColor];
    [v1 addSubview:self.labThree];
    [self.labThree mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.labTwo.mas_bottom).offset(5);
        make.left.equalTo(self.labTwo);
        make.width.equalTo(self.labTwo);
        make.height.equalTo(self.labTwo);
    }];
    
    

    self.lab1 = [[UILabel alloc]init];
    self.lab1.textAlignment =0;
    self.lab1.font = [UIFont systemFontOfSize:9];
    self.lab1.lineBreakMode = NSLineBreakByWordWrapping;
    self.lab1.textColor = [UIColor redColor];
    [v1 addSubview:self.lab1];
    [self.lab1 mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.labThree.mas_bottom).with.offset(5);
        make.left.equalTo(self.img.mas_right).with.offset(10);
        make.height.equalTo(self.labThree);
    }];



    self.lab2 = [[UILabel alloc]init];
    self.lab2.textAlignment =0;
    self.lab2.lineBreakMode = NSLineBreakByWordWrapping;
    self.lab2.font = [UIFont systemFontOfSize:9];
    self.lab2.textColor = [UIColor redColor];
    [v1 addSubview:self.lab2];

    [self.lab2 mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.lab1.mas_top);
        make.left.equalTo(self.lab1.mas_right).offset(5);
        make.height.equalTo(self.lab1.mas_height);
    }];
    
    



    
    self.enterBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [v1 addSubview:self.enterBtn];
    [self.enterBtn setTitle:@"进入店铺" forState:UIControlStateNormal];
    self.enterBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    self.enterBtn.backgroundColor = [UIColor colorWithRed:1/255.0 green:175/255.0 blue:99/255.0 alpha:1];
    [self.enterBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.enterBtn mas_makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(v1.mas_right).offset(-5);
        make.bottom.equalTo(v1.mas_bottom).offset(-5);
        make.width.equalTo(@70);
        make.height.equalTo(@25);
    }];
    
    

    
}
@end
