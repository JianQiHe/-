//
//  ZXGSTableViewCell.m
//  家装
//
//  Created by mac on 16/7/18.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ZXGSTableViewCell.h"

@implementation ZXGSTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self creatZXGSTableViewCell];
    }
    return self;
}
-(void)creatZXGSTableViewCell
{
    ZXGSTableViewCell *cell = self;
    
    
    
    UIView *v1 = [[UIView alloc]init];
    v1.backgroundColor = [UIColor whiteColor];
    [cell addSubview:v1];
    [v1 mas_makeConstraints:^(MASConstraintMaker *make){
        make.edges.equalTo(cell).with.insets(UIEdgeInsetsMake(10, 10, 10, 10));
        
        
    }];
    
    
    self.img= [[UIImageView alloc]init];
    [v1 addSubview:self.img];
    self.img.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.img mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(v1).with.offset(5);
        make.left.equalTo(v1).with.offset(5);
        make.bottom.equalTo(v1).with.offset(-5);
        make.width.equalTo(@85);
        
    }];
    
    self.labOne = [[UILabel alloc]init];
    self.labOne.lineBreakMode=NSLineBreakByWordWrapping;
    self.labOne.font = [UIFont systemFontOfSize:13];
    [v1 addSubview:self.labOne];
    [self.labOne mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.img.mas_top).offset(10);
        make.height.equalTo(@15);
        make.right.equalTo(v1.mas_right).offset(-60);
        make.left.equalTo(self.img.mas_right).with.offset(5);
    }];
    
    
    self.labTwo = [[UILabel alloc]init];
    self.labTwo.lineBreakMode=NSLineBreakByWordWrapping;
    self.labTwo.font = [UIFont systemFontOfSize:9];
    self.labTwo.textColor = [UIColor grayColor];
    [v1 addSubview:self.labTwo];
    [self.labTwo mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.labOne.mas_bottom).with.offset(5);
        make.left.equalTo(self.labOne).with.offset(5);
        make.height.equalTo(self.labOne);
    }];
    
    
    self.labThree = [[UILabel alloc]init];
    self.labThree.textAlignment =0;
    self.labThree.font = [UIFont systemFontOfSize:9];
    self.labThree.textColor = [UIColor grayColor];
    [v1 addSubview:self.labThree];
    [self.labThree mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.labTwo.mas_bottom);
        make.left.equalTo(self.labTwo);
        make.right.equalTo(v1.mas_right).offset(-5);
        make.height.equalTo(self.labTwo);
    }];
    
    self.lab1 = [[UILabel alloc]init];
    self.lab1.lineBreakMode=NSLineBreakByWordWrapping;
    self.lab1.font = [UIFont systemFontOfSize:9];
    self.lab1.textColor = [UIColor redColor];
    [v1 addSubview:self.lab1];
    [self.lab1 mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.labThree.mas_bottom).with.offset(2);
        make.left.equalTo(self.img.mas_right).with.offset(10);
        make.height.equalTo(self.labThree);
    }];
    
    
    
    
    self.lab2 = [[UILabel alloc]init];
    self.lab2.lineBreakMode=NSLineBreakByWordWrapping;
    self.lab2.font = [UIFont systemFontOfSize:9];
    self.lab2.textColor = [UIColor redColor];
    [v1 addSubview:self.lab2];
    [self.lab2 mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.lab1.mas_top);
        make.left.equalTo(self.lab1.mas_right);
        make.height.equalTo(self.lab1.mas_height);
    }];
    
    
    
    self.lab3 = [[UILabel alloc]init];
    self.lab3.lineBreakMode=NSLineBreakByWordWrapping;
    self.lab3.font = [UIFont systemFontOfSize:9];
    self.lab3.textColor = [UIColor redColor];
    [v1 addSubview:self.lab3];
    [self.lab3 mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.lab2.mas_top);
        make.left.equalTo(self.lab2.mas_right);
        make.height.equalTo(self.lab2);
    }];
    
    
    
    self.lab4 = [[UILabel alloc]init];
    self.lab4.lineBreakMode=NSLineBreakByWordWrapping;
    self.lab4.font = [UIFont systemFontOfSize:9];
    self.lab4.textColor = [UIColor redColor];
    [v1 addSubview:self.lab4];
    [self.lab4 mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.lab3.mas_top);
        make.left.equalTo(self.lab3.mas_right);
        make.height.equalTo(self.lab3);
    }];
    
    
    
    self.yuyuelab = [[UILabel alloc]init];
    self.yuyuelab.text = @"免费预约";
    self.yuyuelab.textAlignment = 1;
    self.yuyuelab.font = [UIFont systemFontOfSize:15];
    self.yuyuelab.layer.cornerRadius = 3;//设置边缘弯曲角度
    self.yuyuelab.clipsToBounds = YES;//（iOS7以后需要设置）
    //设置边框
    self.yuyuelab.layer.borderColor = [[UIColor orangeColor] CGColor];
    self.yuyuelab.layer.borderWidth = 1;
    self.yuyuelab.textColor = [UIColor orangeColor];
    [v1 addSubview:self.yuyuelab];
    [self.yuyuelab mas_makeConstraints:^(MASConstraintMaker *make){
        make.bottom.equalTo(v1.mas_bottom).with.offset(-5);
        make.right.equalTo(v1.mas_right).with.offset(-7);
        make.width.equalTo(@70);
        make.height.equalTo(@20);
    }];
    
    
    self.lijilab = [[UILabel alloc]init];
    self.lijilab.text = @"立即招标";
    self.lijilab.textAlignment = 1;
    self.lijilab.font = [UIFont systemFontOfSize:15];
    self.lijilab.layer.cornerRadius = 3;//设置边缘弯曲角度
    self.lijilab.clipsToBounds = YES;//（iOS7以后需要设置）
    self.lijilab.backgroundColor = [UIColor orangeColor];
    self.lijilab.textColor = [UIColor whiteColor];
    [v1 addSubview:self.lijilab];
    [self.lijilab mas_makeConstraints:^(MASConstraintMaker *make){
        make.bottom.equalTo(v1.mas_bottom).with.offset(-5);
        make.right.equalTo(self.yuyuelab.mas_left).with.offset(-10);
        make.width.equalTo(@70);
        make.height.equalTo(@20);
    }];

    
    
    
    self.suzilab = [[UILabel alloc]init];
    self.suzilab.textAlignment = 0;
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
    
    

}
@end
