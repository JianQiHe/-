//
//  SZTableViewCell.m
//  家装
//
//  Created by mac on 16/7/4.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "SZTableViewCell.h"

@implementation SZTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self initSZTableViewCell];
    }
    return self;
}
-(void)initSZTableViewCell
{
    SZTableViewCell *cell = self;
    
    cell.btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [cell.btn setTitle:@"注销" forState:UIControlStateNormal];
    cell.btn.titleLabel.font = [UIFont systemFontOfSize:17];
    cell.btn.layer.cornerRadius = 5;
    cell.btn.backgroundColor = [UIColor redColor];
    [cell.btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [cell addSubview:cell.btn];
    [cell.btn mas_makeConstraints:^(MASConstraintMaker *make){
        make.height.equalTo(@30);
        make.left.equalTo(cell.mas_left).offset(50);
        make.right.equalTo(cell.mas_right).offset(-50);
        make.top.equalTo(cell.mas_top).offset(20);
}];

    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
