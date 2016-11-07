//
//  AddressTableViewCell.m
//  家装
//
//  Created by hjq on 2016/10/18.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "AddressTableViewCell.h"

@implementation AddressTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self customCell];
    }
    
    return self;
}

- (void)customCell {
    
    UIView *View = [[UIView alloc]init];
    View.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:View];
    [View mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.contentView.mas_top);
        make.right.equalTo(self.contentView.mas_right);
        make.left.equalTo(self.contentView.mas_left);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-5);
    }];
    
    _iconImg = [[UIImageView alloc] init];
    _iconImg.image = [UIImage imageNamed:@"110"];
    _iconImg.backgroundColor = [UIColor grayColor];
    [View addSubview:_iconImg];
    [_iconImg mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(View.mas_left).offset(10);
        make.width.equalTo(@30);
        make.height.equalTo(@30);
        make.top.equalTo(View.mas_top).offset(20);
    }];
    
    _titleLabel = [[UILabel alloc]init];
    _titleLabel.text = @"收货人：德莱文";
    _titleLabel.font = [UIFont systemFontOfSize:12];
    _titleLabel.numberOfLines = 0;//根据最大行数需求来设置
    _titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    [View addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(View.mas_top).offset(5);
        make.left.equalTo(View.mas_left).offset(50);
        make.height.equalTo(@10);
    }];
    
    _contentLabel = [[UILabel alloc]init];
    _contentLabel.text = @"收货地址：上海市 奉贤区 望圆南路 1320号 卓越世纪中心  3号楼902";
    _contentLabel.textColor = [UIColor grayColor];
    _contentLabel.font = [UIFont systemFontOfSize:9];
    _contentLabel.numberOfLines = 2;//根据最大行数需求来设置

    [View addSubview:_contentLabel];
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(_titleLabel.mas_left);
        make.right.equalTo(self.contentView.mas_right);
        make.top.equalTo(_titleLabel.mas_bottom);
        make.height.equalTo(@30);
    }];
    
    
    
    _button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [_button1 setTitle:@"设为默认" forState:0];
    [_button1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _button1.titleLabel.font = [UIFont systemFontOfSize:12];
    [_button1 setBackgroundColor:[UIColor redColor]];
    _button1.layer.cornerRadius = 4.0;
    [View addSubview:_button1];
    [_button1 mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(_titleLabel.mas_left);
        make.bottom.equalTo(View.mas_bottom).offset(-5);
        make.height.equalTo(@15);
        make.width.equalTo(@60);
    }];
    
    
    _button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [_button2 setTitle:@"编辑" forState:0];
    [_button2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _button2.titleLabel.font = [UIFont systemFontOfSize:12];
    [_button2 setBackgroundColor:[UIColor redColor]];
    _button2.layer.cornerRadius = 4.0;
    [View addSubview:_button2];
    [_button2 mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(_button1.mas_right).offset(5);
        make.bottom.equalTo(_button1.mas_bottom);
        make.height.equalTo(@15);
        make.width.equalTo(@60);
    }];
    
    _button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [_button3 setTitle:@"删除" forState:0];
    [_button3 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _button3.titleLabel.font = [UIFont systemFontOfSize:12];
    [_button3 setBackgroundColor:[UIColor redColor]];
    
    _button3.layer.cornerRadius = 4.0;
    [View addSubview:_button3];
    [_button3 mas_makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(View.mas_right).offset(-10);
        make.bottom.equalTo(View.mas_bottom).offset(-5);
        make.height.equalTo(@15);
        make.width.equalTo(@40);
    }];
    
}

- (void)showData:(NSString *)str IndexPath:(NSIndexPath *)indexPath {
    
    _titleLabel.text = [NSString stringWithFormat:@"=========%ld", (long)indexPath.row];

    _button1.tag = 1000 + indexPath.row;
    _button2.tag = 2000 + indexPath.row;
    _button3.tag = 3000 + indexPath.row;
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
