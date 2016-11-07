//
//  ShopClassTableViewCell.m
//  家装
//
//  Created by mac on 16/6/30.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ShopClassTableViewCell.h"

@implementation ShopClassTableViewCell
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
    ShopClassTableViewCell *cell = self;
    
    UIView *view1 = [[UIView alloc]init];
    [cell addSubview:view1];
    view1.backgroundColor = [UIColor clearColor];
    [view1 mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(cell.mas_left);
        make.right.equalTo(cell.mas_right);
        make.top.equalTo(cell.mas_top);
        make.bottom.equalTo(cell.mas_bottom);
        
    }];
    

    
    
    
    
    self.lab = [[UILabel alloc]init];
    [cell addSubview:self.lab];
    self.lab.font = [UIFont systemFontOfSize:12];
    self.lab.backgroundColor = [UIColor clearColor];
    self.lab.textAlignment = 1;
    [self.lab mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(view1.mas_left);
        make.right.equalTo(view1.mas_right);
        make.height.equalTo(view1.mas_height);
        make.top.equalTo(view1.mas_top);
}];


    UILabel *linelab = [[UILabel alloc]init];
    [cell addSubview:linelab];
    linelab.backgroundColor = [UIColor lightGrayColor];
    [linelab mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(cell.mas_left);
        make.right.equalTo(cell.mas_right);
        make.height.equalTo(@0.8);
        make.bottom.equalTo(cell.mas_bottom).offset(0.4);
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
