//
//  GWDDTableViewCell.m
//  家装
//
//  Created by mac on 16/7/7.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "GWDDTableViewCell.h"

@implementation GWDDTableViewCell
{
    int a;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self initcreatGWDDTableViewCell];
    }
    return self;
}
-(void)initcreatGWDDTableViewCell
{
    GWDDTableViewCell *Cell = self;

    UIView *view1 = [[UIView alloc]init];
    [Cell addSubview:view1];
    view1.backgroundColor = [UIColor whiteColor];
    [view1 mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(Cell.mas_left);
        make.right.equalTo(Cell.mas_right);
        make.top.equalTo(Cell.mas_top);
        make.height.equalTo(@25);
}];
    UIImageView *imagV = [[UIImageView alloc]init];
    imagV.image = [UIImage imageNamed:@"商铺"];
    [view1 addSubview:imagV];
    [imagV mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(view1.mas_left).offset(10);
        make.top.equalTo(view1.mas_top).offset(5);
        make.bottom.equalTo(view1.mas_bottom).offset(-5);
        make.width.equalTo(@15);
}];
    
    self.titlelab = [[UILabel alloc]init];
    [view1 addSubview:self.titlelab];
    self.titlelab.font = [UIFont fontWithName:@"Thonburi" size:11];
    self.titlelab.lineBreakMode = NSLineBreakByWordWrapping;
    [self.titlelab mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(imagV.mas_right).offset(10);
        make.bottom.equalTo(imagV.mas_bottom);
        make.height.equalTo(@15);
}];

    self.pay_status = [[UILabel alloc]init];
    [view1 addSubview:self.pay_status];
    self.pay_status.font = [UIFont fontWithName:@"Thonburi" size:11];
    self.pay_status.lineBreakMode = NSLineBreakByWordWrapping;
    self.pay_status.textColor = [UIColor redColor];
    [self.pay_status mas_makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(view1.mas_right).offset(-10);
        make.bottom.equalTo(imagV.mas_bottom);
        make.height.equalTo(@15);
    }];
    
    

    self.photo = [[UIImageView alloc]init];
    [Cell addSubview:self.photo];
    [self.photo mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(view1.mas_left).offset(10);
        make.top.equalTo(view1.mas_bottom).offset(5);
        make.width.equalTo(@50);
        make.height.equalTo(@50);
    }];
    
    
    
    self.product_name = [[UILabel alloc]init];
    [Cell addSubview:self.product_name];
    self.product_name.font = [UIFont fontWithName:@"Thonburi" size:10];
    self.product_name.numberOfLines = 0;
    self.product_name.lineBreakMode = NSLineBreakByTruncatingTail;
    [self.product_name mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.photo.mas_right).offset(5);
        make.top.equalTo(self.photo.mas_top);
        make.right.equalTo(Cell.mas_right).offset(-(Width)/5);
        make.height.equalTo(@30);
    }];
    
    
    
    self.product_price = [[UILabel alloc]init];
    [Cell addSubview:self.product_price];
    self.product_price.font = [UIFont fontWithName:@"Thonburi" size:10];
    self.product_price.lineBreakMode = NSLineBreakByWordWrapping;
    [self.product_price mas_makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(Cell.mas_right).offset(-5);
        make.top.equalTo(self.photo.mas_top);
        make.height.equalTo(@15);
    }];

    
    self.number = [[UILabel alloc]init];
    [Cell addSubview:self.number];
    self.number.font = [UIFont fontWithName:@"Thonburi" size:8];
    self.number.lineBreakMode = NSLineBreakByWordWrapping;
    [self.number mas_makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(Cell.mas_right).offset(-5);
        make.top.equalTo(self.product_price.mas_bottom);
        make.height.equalTo(@15);
    }];
    
    
    UIView *view2 = [[UIView alloc]init];
    [Cell addSubview:view2];
    view2.backgroundColor = [UIColor whiteColor];
    [view2 mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(Cell.mas_left);
        make.right.equalTo(Cell.mas_right);
        make.top.equalTo(self.photo.mas_bottom).offset(5);
        make.height.equalTo(@25);
}];


    self.freight = [[UILabel alloc]init];
    [Cell addSubview:self.freight];
    self.freight.font = [UIFont fontWithName:@"Thonburi" size:10];
    self.freight.lineBreakMode = NSLineBreakByWordWrapping;
    [self.freight mas_makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(view2.mas_right).offset(-5);
        make.top.equalTo(view2.mas_top).offset(5);
        make.height.equalTo(@15);
    }];

    
    
    
    self.amount = [[UILabel alloc]init];
    [Cell addSubview:self.amount];
    self.amount.font = [UIFont fontWithName:@"Thonburi" size:10];
    self.amount.lineBreakMode = NSLineBreakByWordWrapping;
    [self.amount mas_makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(self.freight.mas_left).offset(-5);
        make.bottom.equalTo(self.freight.mas_bottom);
        make.height.equalTo(@15);
    }];

    UIView *view3 = [[UIView alloc]init];
    view3.backgroundColor = [UIColor whiteColor];
    [Cell addSubview:view3];
    [view3 mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(Cell.mas_left);
        make.right.equalTo(Cell.mas_right);
        make.top.equalTo(view2.mas_bottom).offset(1);
        make.bottom.equalTo(Cell.mas_bottom).offset(-10);
}];

    self.queren = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.queren setTitle:@"确认收货" forState:UIControlStateNormal];
    self.queren.titleLabel.font = [UIFont systemFontOfSize:12];
    self.queren.layer.cornerRadius = 3;
    self.queren.backgroundColor = [UIColor orangeColor];
    [view3 addSubview:self.queren];
    [self.queren mas_makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(view3.mas_right).offset(-5);
        make.width.equalTo(@60);
        make.top.equalTo(view3.mas_top).offset(5);
        make.bottom.equalTo(view3.mas_bottom).offset(-5);
}];

    
    self.quxiao = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.quxiao setTitle:@"取消订单" forState:UIControlStateNormal];
    [self.quxiao setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.quxiao.titleLabel.font = [UIFont systemFontOfSize:12];
    self.quxiao.layer.borderColor = [[UIColor blackColor] CGColor];
    //设置边框宽度
    self.quxiao.layer.borderWidth = 1.0f;
    //给按钮设置角的弧度
    self.quxiao.layer.cornerRadius = 3.0f;
    //设置背景颜色
    self.quxiao.backgroundColor = [UIColor redColor];
    self.quxiao.layer.masksToBounds = YES;
    self.quxiao.backgroundColor = [UIColor whiteColor];
    [view3 addSubview:self.quxiao];
    [self.quxiao mas_makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(self.queren.mas_left).offset(-10);
        make.width.equalTo(@60);
        make.top.equalTo(view3.mas_top).offset(5);
        make.bottom.equalTo(view3.mas_bottom).offset(-5);
    }];
    
    
    

}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
