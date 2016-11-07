//
//  XiaoquTableViewCell.h
//  家装
//
//  Created by mac on 16/6/28.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XiaoquTableViewCell : UITableViewCell
@property (nonatomic, strong) UILabel *nameLab;//小区名字
@property (nonatomic, strong) UILabel *ViewNumber;//查看次数
@property (nonatomic, strong) UIButton *yuyueBtn;//点击预约
@property (nonatomic, strong) UIImageView *imagV;//小区图片
@property (nonatomic, strong) UILabel *PriceLab;//均价
@property (nonatomic, strong) UILabel *TimeLab;//竣工时间
@property (nonatomic, strong) UILabel *Adress;
@end
