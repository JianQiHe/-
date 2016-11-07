//
//  WoKerCollectionViewCell.m
//  家装
//
//  Created by mac on 16/6/28.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "WoKerCollectionViewCell.h"

@implementation WoKerCollectionViewCell


-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        [self creatWorkerCell];
        
    }
    
    return self;
}

-(void)creatWorkerCell
{
    WoKerCollectionViewCell *cell = self;
    
    cell.backgroundColor = [UIColor whiteColor];
    self.imagev = [[UIImageView alloc]init];
    self.imagev.backgroundColor = [UIColor darkGrayColor];
    [cell addSubview:self.imagev];
    [self.imagev mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(cell.mas_left).offset(10);
        make.top.equalTo(cell.mas_top).offset(20);
        make.right.equalTo(cell.mas_right).offset(-10);
        make.height.equalTo(self.imagev.mas_width);
    }];

    self.nameLab = [[UILabel alloc]init];
    [cell addSubview:self.nameLab];
    self.nameLab.textAlignment = 0;
    self.nameLab.font = [UIFont systemFontOfSize:12];
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.imagev.mas_left);
        make.top.equalTo(self.imagev.mas_bottom);
        make.width.equalTo(@60);
        make.height.equalTo(@20);
}];

    self.yuyueLab = [[UILabel alloc]init];
    [cell addSubview:self.yuyueLab];
    self.yuyueLab.textAlignment = 0;
    self.yuyueLab.numberOfLines = 0;
    self.yuyueLab.lineBreakMode = NSLineBreakByTruncatingTail;
    self.yuyueLab.font = [UIFont systemFontOfSize:10];
    [self.yuyueLab mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.imagev.mas_left);
        make.bottom.equalTo(cell.mas_bottom).offset(-10);
        make.height.equalTo(@15);
    }];
    
    
    self.NumberLab = [[UILabel alloc]init];
    [cell addSubview:self.NumberLab];
    self.NumberLab.textAlignment = 0;
    self.NumberLab.numberOfLines = 0;
    self.NumberLab.textColor = [UIColor redColor];
    self.NumberLab.lineBreakMode = NSLineBreakByTruncatingTail;
    self.NumberLab.font = [UIFont systemFontOfSize:15];
    [self.NumberLab mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.yuyueLab.mas_right).offset(2);
        make.bottom.equalTo(self.yuyueLab.mas_bottom);
        make.height.equalTo(@15);
    }];

    
    
    self.LineLab = [[UILabel alloc]init];
    [cell addSubview:self.LineLab];
    self.LineLab.backgroundColor = [UIColor grayColor];
    [self.LineLab mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(cell.mas_left).offset(cell.frame.size.width/2);
        make.bottom.equalTo(self.yuyueLab.mas_bottom);
        make.width.equalTo(@1);
        make.height.equalTo(@15);
    }];
    
    /**
     *  123
     */
    self.yuyueBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.yuyueBtn setTitle:@"立即预约" forState:UIControlStateNormal];
    [self.yuyueBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.yuyueBtn.backgroundColor = [UIColor orangeColor];
    self.yuyueBtn.titleLabel.font = [UIFont systemFontOfSize:10];
    [cell addSubview:self.yuyueBtn];
    [self.yuyueBtn mas_makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(cell.mas_right).offset(-5);
        make.width.equalTo(@60);
        make.height.equalTo(@25);
        make.bottom.equalTo(cell.mas_bottom).offset(-10);
}];

}


@end
