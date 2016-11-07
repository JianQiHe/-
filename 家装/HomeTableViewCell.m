//
//  HomeTableViewCell.m
//  家装
//
//  Created by mac on 16/6/30.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "HomeTableViewCell.h"

@implementation HomeTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self createHomeTableViewCell];
    }
    return self;
}
-(void)createHomeTableViewCell
{
    HomeTableViewCell *cell_temp = self;
    cell_temp.backgroundColor = [UIColor groupTableViewBackgroundColor];

    UIView *view2 = [[UIView alloc]init];
    view2.backgroundColor = [UIColor whiteColor];
    [cell_temp addSubview:view2];
    [view2 mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(cell_temp.mas_left);
        make.right.equalTo(cell_temp.mas_right);
        make.top.equalTo(cell_temp.mas_top).offset(2);
        make.bottom.equalTo(cell_temp.mas_bottom).offset(-2);
}];

    
    self.lab1 = [[UILabel alloc]init];
    [view2 addSubview:self.lab1];
    self.lab1.numberOfLines = 0;
    self.lab1.lineBreakMode = NSLineBreakByTruncatingTail;
    self.lab1.textColor = [UIColor grayColor];
    self.lab1.font = [UIFont systemFontOfSize:10];
    [self.lab1 mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(cell_temp.mas_left).offset(5);
        make.top.equalTo(cell_temp.mas_top).offset(3);
        make.height.equalTo(@15);
}];

    
    self.imagV = [[UIImageView alloc]init];
    self.imagV.backgroundColor = [UIColor grayColor];
    [view2 addSubview:self.imagV];
    [self.imagV mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(view2.mas_left);
        make.right.equalTo(view2.mas_right);
        make.bottom.equalTo(view2.mas_bottom);
        make.top.equalTo(self.lab1.mas_bottom).offset(2);
}];
    [self.imagV setUserInteractionEnabled:YES];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
