//
//  XiaoquTableViewCell.m
//  家装
//
//  Created by mac on 16/6/28.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "XiaoquTableViewCell.h"

@implementation XiaoquTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self initcell];
    }
    return self;
}
-(void)initcell
{
    XiaoquTableViewCell *cell = self;

    UIView *view1 = [[UIView alloc]init];
    [cell addSubview:view1];
    view1.backgroundColor = [UIColor whiteColor];
    [view1 mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(cell.mas_left);
        make.right.equalTo(cell.mas_right);
        make.top.equalTo(cell.mas_top).offset(5);
        make.bottom.equalTo(cell.mas_bottom).offset(-5);
        
}];
    //小区名字
    self.nameLab = [[UILabel alloc]init];
    [cell addSubview:self.nameLab];
    self.nameLab.font = [UIFont systemFontOfSize:15];
    self.nameLab.textColor = [UIColor redColor];
    [view1 addSubview:self.nameLab];
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(view1.mas_left).offset(10);
        make.top.equalTo(view1.mas_top).offset(10);
        make.width.equalTo(@80);
        make.height.equalTo(@15);

}];

    
    //查看次数
    self.ViewNumber = [[UILabel alloc]init];
    [cell addSubview:self.ViewNumber];
    self.ViewNumber.font = [UIFont systemFontOfSize:15];
    self.ViewNumber.textColor = [UIColor blackColor];
    self.ViewNumber.lineBreakMode = NSLineBreakByWordWrapping;
    [view1 addSubview:self.ViewNumber];
    [self.ViewNumber mas_makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(view1.mas_right).offset(-5);
        make.bottom.equalTo(self.nameLab.mas_bottom);
        make.height.equalTo(@15);
    }];
    
//点击预约
    self.yuyueBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.yuyueBtn setTitle:@"立即预约" forState:UIControlStateNormal];
    [self.yuyueBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.yuyueBtn.backgroundColor = [UIColor orangeColor];
    self.yuyueBtn.layer.cornerRadius = 5;
    self.yuyueBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [cell addSubview:self.yuyueBtn];
    [self.yuyueBtn mas_makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(cell.mas_right).offset(-10);
        make.width.equalTo(@70);
        make.height.equalTo(@20);
        make.bottom.equalTo(cell.mas_bottom).offset(-10);
    }];
    
    
    UIView *view2 = [[UIView alloc]init];
    [view1 addSubview:view2];
    view2.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [view2 mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(view1.mas_left);
        make.right.equalTo(view1.mas_right);
        make.top.equalTo(self.nameLab.mas_bottom).offset(5);
        make.bottom.equalTo(self.yuyueBtn.mas_top).offset(-5);
}];

    //小区图片
    self.imagV = [[UIImageView alloc]init];
    self.imagV.backgroundColor = [UIColor darkGrayColor];
    [view2 addSubview:self.imagV];
    [self.imagV mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(view2.mas_left).offset(10);
        make.top.equalTo(view2.mas_top).offset(10);
        make.bottom.equalTo(view2.mas_bottom).offset(-10);
        make.width.equalTo(self.imagV.mas_height);
    }];

    //均价
    self.PriceLab = [[UILabel alloc]init];
    [view2 addSubview:self.PriceLab];
    self.PriceLab.font = [UIFont systemFontOfSize:10];
    self.PriceLab.textAlignment = 0;
    self.PriceLab.numberOfLines = 0;
    self.PriceLab.textColor = [UIColor grayColor];
    self.PriceLab.lineBreakMode = NSLineBreakByTruncatingTail;
    [self.PriceLab mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.imagV.mas_right).offset(2);
        make.top.equalTo(self.imagV.mas_top).offset(5);
        make.height.equalTo(@15);
}];

    self.TimeLab = [[UILabel alloc]init];
    self.TimeLab.font = [UIFont systemFontOfSize:10];
    self.TimeLab.textAlignment = 0;
    self.TimeLab.numberOfLines = 0;
    self.TimeLab.textColor = [UIColor grayColor];
    self.TimeLab.lineBreakMode = NSLineBreakByTruncatingTail;
    [view2 addSubview:self.TimeLab];
    [self.TimeLab mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.PriceLab.mas_bottom).offset(5);
        make.left.equalTo(self.PriceLab.mas_left);
        make.height.equalTo(@15);
}];

    self.Adress = [[UILabel alloc]init];
    self.Adress.font = [UIFont systemFontOfSize:10];
    self.Adress.textAlignment = 0;
    self.Adress.numberOfLines = 0;
    self.Adress.textColor = [UIColor grayColor];
    self.Adress.lineBreakMode = NSLineBreakByTruncatingTail;
    [view2 addSubview:self.Adress];
    [self.Adress mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.TimeLab.mas_bottom).offset(5);
        make.left.equalTo(self.PriceLab.mas_left);
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
