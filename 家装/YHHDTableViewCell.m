//
//  YHHDTableViewCell.m
//  家装
//
//  Created by mac on 16/6/30.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "YHHDTableViewCell.h"

@implementation YHHDTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self initYHHDTabViewcell];
    }
    return self;
}
-(void)initYHHDTabViewcell
{
    YHHDTableViewCell *cell = self;
    cell.backgroundColor = [UIColor whiteColor];
    self.imagV = [[UIImageView alloc]init];
    self.imagV.backgroundColor  = [UIColor grayColor];
    [cell addSubview:self.imagV];
    [self.imagV mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(cell.mas_left).offset(10);
        make.top.equalTo(cell.mas_top).offset(15);
        make.bottom.equalTo(cell.mas_bottom).offset(-15);
        make.width.equalTo(@120);
}];
    //建材优惠
    self.label = [[UILabel alloc]init];
    self.label.font = [UIFont systemFontOfSize:12];
    self.label.numberOfLines = 0;
    self.label.lineBreakMode = NSLineBreakByTruncatingTail;
    [cell addSubview:self.label];
    [self.label mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.imagV.mas_right).offset(2);
        make.bottom.equalTo(self.imagV.mas_top).offset(7);
        make.height.equalTo(@15);
        make.right.equalTo(cell.mas_right).offset(-5);
}];

    //活动时间
    self.lab = [[UILabel alloc]init];
    self.lab.font = [UIFont systemFontOfSize:10];
    self.lab.numberOfLines = 0;
    self.lab.lineBreakMode = NSLineBreakByTruncatingTail;
    self.lab.textColor = [UIColor grayColor];
    [cell addSubview:self.lab];
    [self.lab mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.label.mas_left);
        make.top.equalTo(self.label.mas_bottom);
        make.height.equalTo(@15);

    }];
    
    
    
    //结束时间
    self.lab2 = [[UILabel alloc]init];
    self.lab2.font = [UIFont systemFontOfSize:10];
    self.lab2.numberOfLines = 0;
    self.lab2.lineBreakMode = NSLineBreakByTruncatingTail;
    self.lab2.textColor = [UIColor grayColor];
    [cell addSubview:self.lab2];
    [self.lab2 mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.lab.mas_left);
        make.top.equalTo(self.lab.mas_bottom);
        make.height.equalTo(@15);
    }];
    
    
    
    
    
    //活动地点
    self.lab3 = [[UILabel alloc]init];
    self.lab3.font = [UIFont systemFontOfSize:10];
    self.lab3.numberOfLines = 0;
    self.lab3.lineBreakMode = NSLineBreakByTruncatingTail;
    self.lab3.textColor = [UIColor grayColor];
    [cell addSubview:self.lab3];
    [self.lab3 mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.lab2.mas_left);
        make.top.equalTo(self.lab2.mas_bottom);
        make.height.equalTo(@15);
        make.right.equalTo(cell.mas_right).offset(-5);
    }];

    self.lab4 = [[UILabel alloc]init];
    self.lab4.font = [UIFont systemFontOfSize:10];
    self.lab4.numberOfLines = 0;
    self.lab4.lineBreakMode = NSLineBreakByTruncatingTail;
    self.lab4.textColor = [UIColor grayColor];
    [cell addSubview:self.lab4];
    [self.lab4 mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.lab3.mas_left);
        make.top.equalTo(self.lab3.mas_bottom);
        make.height.equalTo(@15);
    }];

    
    self.btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [cell addSubview:self.btn];
    [self.btn mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.lab4.mas_left);
        make.top.equalTo(self.lab4.mas_bottom);
        make.bottom.equalTo(self.imagV.mas_bottom);
        make.width.equalTo(@80);
}];
    
    self.lab5 = [[UILabel alloc]init];
    self.lab5.font = [UIFont systemFontOfSize:10];
    self.lab5.numberOfLines = 0;
    self.lab5.lineBreakMode = NSLineBreakByTruncatingTail;
    self.lab5.textColor = [UIColor grayColor];
    [cell addSubview:self.lab5];
    [self.lab5 mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.btn.mas_right).offset(2);
        make.bottom.equalTo(self.btn.mas_bottom).offset(-2);
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
