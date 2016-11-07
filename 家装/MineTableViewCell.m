//
//  MineTableViewCell.m
//  家装
//
//  Created by mac on 16/7/2.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "MineTableViewCell.h"
#import "MineViewController.h"
@implementation MineTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self initMineTableViewcell];
    }
    return self;
}
-(void)initMineTableViewcell
{
    MineTableViewCell *cell = self;
    UIView *v = [[UIView alloc]init];
    v.backgroundColor = [UIColor whiteColor];
    [cell addSubview:v];
    [v mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(cell.mas_top);
        make.left.equalTo(cell.mas_left);
        make.right.equalTo(cell.mas_right);
        make.bottom.equalTo(cell.mas_bottom);
    }];
    self.imgv = [[UIImageView alloc]init];
    self.imgv.image = [UIImage imageNamed:@"wodezhuangxiu.png"];
    [v addSubview:self.imgv];
    [self.imgv mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(v.mas_top).offset(5);
        make.left.equalTo(v.mas_left).offset(15);
        make.bottom.equalTo(v.mas_bottom).offset(-5);
        make.width.equalTo(@27);
    }];

    self.lab = [[UILabel alloc]init];
    [v addSubview:self.lab];
    [self.lab mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(v.mas_top);
        make.right.equalTo(v.mas_right);
        make.left.equalTo(self.imgv.mas_right).offset(25);
        make.bottom.equalTo(v.mas_bottom);
    }];

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
