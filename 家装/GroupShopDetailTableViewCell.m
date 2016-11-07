//
//  GroupShopDetailTableViewCell.m
//  家装
//
//  Created by mac on 16/8/2.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "GroupShopDetailTableViewCell.h"

@implementation GroupShopDetailTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self CreatGroupShopDetailTableViewCell];
    }
    return self;
}
-(void)CreatGroupShopDetailTableViewCell
{
    GroupShopDetailTableViewCell *cell = self;
    
    self.lab = [[UILabel alloc]init];
    [cell addSubview:self.lab];
    self.lab.numberOfLines = 0;
    self.lab.font = [UIFont systemFontOfSize:11];
    self.lab.textColor = [UIColor blackColor];
    self.lab.lineBreakMode = NSLineBreakByWordWrapping;
    [self.lab mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(cell.mas_left).offset(5);
        make.right.equalTo(cell.mas_right).offset(-5);
        make.top.equalTo(cell.mas_top).offset(5);
        make.bottom.equalTo(cell.mas_bottom).offset(-5);
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
