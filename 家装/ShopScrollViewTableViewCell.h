//
//  ShopScrollViewTableViewCell.h
//  家装
//
//  Created by mac on 16/7/9.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ShopScrollViewTableViewCell;

typedef void(^My_block)(ShopScrollViewTableViewCell *cell);

@interface ShopScrollViewTableViewCell : UITableViewCell
@property (nonatomic, strong)UILabel *Shoplistlab;


@property (nonatomic, strong) My_block whenClick;

@property (nonatomic, strong) My_block imgV1Click;

@property (nonatomic, strong) My_block imgV2Click;

@property (nonatomic, strong) My_block imgV3Click;

@property (nonatomic, strong) My_block imgV4Click;


//@property (nonatomic, strong) void (^whenClick)(ShopScrollViewTableViewCell *cell);

@property (nonatomic, strong)UIButton *MoreBtn;

@property (nonatomic, strong) UIImageView *imgV1;

@property (nonatomic, strong) UIImageView *imgV2;

@property (nonatomic, strong) UIImageView *imgV3;

@property (nonatomic, strong) UIImageView *imgV4;

@property (nonatomic, strong) UIScrollView *scr;

@property (nonatomic, strong)UILabel *lab1;

@property (nonatomic, strong)UILabel *lab2;

@property (nonatomic, strong)UILabel *lab3;

@property (nonatomic, strong)UILabel *lab4;

@property (nonatomic, strong)UILabel *Pricelab1;

@property (nonatomic, strong)UILabel *Pricelab2;

@property (nonatomic, strong)UILabel *Pricelab3;

@property (nonatomic, strong)UILabel *Pricelab4;

@property (nonatomic, strong)UILabel *market_price1;

@property (nonatomic, strong)UILabel *market_price2;

@property (nonatomic, strong)UILabel *market_price3;

@property (nonatomic, strong)UILabel *market_price4;

@property (nonatomic, strong) UIImageView *IMAGV;

@property(nonatomic,strong) NSString *tagStr;

@end
