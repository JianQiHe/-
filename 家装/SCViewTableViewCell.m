//
//  SCViewTableViewCell.m
//  家装
//
//  Created by mac on 16/5/10.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "SCViewTableViewCell.h"
#import "masonry.h"
@implementation SCViewTableViewCell

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
    self.scview = [[UIView alloc]init];
    self.scview.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.scview];
    [self.scview mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.mas_top).with.offset(5);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.bottom.equalTo(self.mas_bottom);
}];

    
    self.igview = [[UIImageView alloc]init];
    UIImage *image = [UIImage imageNamed:@"测试"];
    self.igview.image = image;
    self.igview.backgroundColor = [UIColor redColor];
    [self.scview addSubview: self.igview];
    [self.igview mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.scview.mas_top).with.offset(5);
        make.left.equalTo(self.scview.mas_left).with.offset(20);
        make.width.equalTo(@70);
        make.bottom.equalTo(self.scview.mas_bottom).with.offset(-5);
        
}];

    self.btn1 = [UIButton buttonWithType:UIButtonTypeSystem];
    
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
