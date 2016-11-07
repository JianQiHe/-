//
//  ShopScrollViewTableViewCell.m
//  家装
//
//  Created by mac on 16/7/9.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ShopScrollViewTableViewCell.h"

@implementation ShopScrollViewTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self initcell];
    }
    return  self;
}
-(void)btnClick:(UIButton *)btn{
    
    if (self.whenClick) {
        
        self.whenClick(self);
    }
    
    
}
#pragma mark -----------------cell上4个view 的点击方法-----------------------

-(void)toFirstProductDetail1:(UIImageView *)imagV
{
    if (self.imgV1Click) {
        self.imgV1Click(self);
    }
}

-(void)toFirstProductDetail2:(UIImageView *)imagV
{
    if (self.imgV2Click) {
        self.imgV2Click(self);
    }
}
-(void)toFirstProductDetail3:(UIImageView *)imagV
{
    if (self.imgV3Click) {
        self.imgV3Click(self);
    }
}
-(void)toFirstProductDetail4:(UIImageView *)imagV
{
    if (self.imgV4Click) {
        self.imgV4Click(self);
    }
}

-(void)initcell
{
//    ShopScrollViewTableViewCell *Cell = self;
    
    UIView *view = [[UIView alloc]init];
    [self addSubview:view];
    view.backgroundColor = [UIColor whiteColor];
    [view mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.mas_left);
        make.top.equalTo(self.mas_top);
        make.height.equalTo(@20);
        make.right.equalTo(self.mas_right);
}];
    
    self.Shoplistlab = [[UILabel alloc]init];
    self.Shoplistlab.font = [UIFont fontWithName:@"Arial" size:13];
    self.Shoplistlab.textAlignment = 0;
    self.Shoplistlab.lineBreakMode = NSLineBreakByWordWrapping;
    [view addSubview:self.Shoplistlab];
    [self.Shoplistlab mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(view.mas_left).offset(10);
        make.top.equalTo(view.mas_top);
        make.bottom.equalTo(view.mas_bottom);
    }];
    
    
    self.MoreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.MoreBtn setTitle:@"更多" forState:UIControlStateNormal];
    
    [self.MoreBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.MoreBtn.titleLabel.font = [UIFont fontWithName:@"Arial" size:13];
    self.MoreBtn.titleLabel.textAlignment = 0;
    [self.MoreBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [view addSubview:self.MoreBtn];
    [self.MoreBtn mas_makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(view.mas_right);
        make.top.equalTo(view.mas_top);
        make.bottom.equalTo(view.mas_bottom);
        make.width.equalTo(@70);
    }];



    

    UIImageView  *imgV = [[UIImageView alloc]init];
    [view addSubview:imgV];
    imgV.image = [UIImage imageNamed:@"箭头"];
    [imgV mas_makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(view.mas_right).offset(-8);
        make.top.equalTo(view.mas_top).offset(3);
        make.height.equalTo(@15);
        make.width.equalTo(@15);
}];


    
    
    

    
    self.scr = [[UIScrollView alloc]init];
    self.scr.backgroundColor = [UIColor whiteColor];
    self.scr.showsHorizontalScrollIndicator = NO;
    self.scr.contentSize = CGSizeMake(4*130,0);
    self.scr.scrollEnabled = YES;
    self.scr.userInteractionEnabled = YES;
    [self addSubview:self.scr];
    [self.scr mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.mas_left);
        make.top.equalTo(view.mas_bottom).offset(5);
        make.bottom.equalTo(self.mas_bottom).offset(-5);
        make.right.equalTo(self.mas_right);
    }];
    
    
    
    
    
      #pragma mark -----------------第一件商品-----------------------
    
    
    
    
    UIView *view1 = [[UIView alloc]init];
    [self.scr addSubview:view1];
    [view1 mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.scr.mas_left).offset(10);
        make.top.equalTo(self.scr.mas_top).offset(5);
        make.height.equalTo(@130);
        make.width.equalTo(@120);
    }];

    self.imgV1 = [[UIImageView alloc]init];
    self.imgV1.backgroundColor = [UIColor lightGrayColor];
    self.imgV1.tag = 1;
    [view1 addSubview:self.imgV1];
    [self.imgV1 mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(view1.mas_left);
        make.top.equalTo(view1.mas_top);
        make.right.equalTo(view1.mas_right);
        make.height.equalTo(@90);
}];

    UITapGestureRecognizer *FirstProductDetail1=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(toFirstProductDetail1:)];
    [self.imgV1 addGestureRecognizer:FirstProductDetail1];
    
    
    
    
    
    
    
    self.lab1 = [[UILabel alloc]init];
    self.lab1.font = [UIFont fontWithName:@"Arial" size:9];
    self.lab1.textAlignment = 0;
    self.lab1.numberOfLines = 2;
    self.lab1.lineBreakMode = NSLineBreakByTruncatingTail;
    [view1 addSubview:self.lab1];
    [self.lab1 mas_makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(self.imgV1.mas_right);
        make.top.equalTo(self.imgV1.mas_bottom);
        make.left.equalTo(self.imgV1.mas_left);
        make.height.equalTo(@25);
    }];

    self.Pricelab1 = [[UILabel alloc]init];
    self.Pricelab1.font = [UIFont fontWithName:@"Arial" size:11];
    self.Pricelab1.lineBreakMode = NSLineBreakByWordWrapping;
    self.Pricelab1.textColor = [UIColor redColor];
    [view1 addSubview:self.Pricelab1];
    [self.Pricelab1 mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(view1.mas_left).offset(5);
        make.bottom.equalTo(view1.mas_bottom);
        make.height.equalTo(@15);
}];

    self.market_price1 = [[UILabel alloc]init];
    self.market_price1.font = [UIFont fontWithName:@"Arial" size:10];
    self.market_price1.lineBreakMode = NSLineBreakByWordWrapping;
    self.market_price1.textColor = [UIColor lightGrayColor];
    [view1 addSubview:self.market_price1];
    [self.market_price1 mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.Pricelab1.mas_right).offset(5);
        make.bottom.equalTo(view1.mas_bottom);
        make.height.equalTo(@15);
}];

    UILabel *linelab = [[UILabel alloc]init];
    linelab.backgroundColor = [UIColor darkGrayColor];
    [self.market_price1 addSubview:linelab];
    [linelab mas_makeConstraints:^(MASConstraintMaker *make){
        make.width.equalTo(self.market_price1.mas_width);
        make.height.equalTo(@0.5);
        make.top.equalTo(self.market_price1.mas_centerY);
        make.left.equalTo(self.market_price1.mas_left);
}];

    
    
    
    
    
    
    
    #pragma mark -----------------第二件商品-----------------------
    
    
    
    UIView *view2 = [[UIView alloc]init];
    [self.scr addSubview:view2];
    [view2 mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(view1.mas_right).offset(10);
        make.top.equalTo(self.scr.mas_top).offset(5);
        make.height.equalTo(@130);
        make.width.equalTo(@120);
    }];
    
    self.imgV2 = [[UIImageView alloc]init];
    self.imgV2.backgroundColor = [UIColor lightGrayColor];
    self.imgV2.tag = 2;
    [view2 addSubview:self.imgV2];
    [self.imgV2 mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(view2.mas_left);
        make.top.equalTo(view2.mas_top);
        make.right.equalTo(view2.mas_right);
        make.height.equalTo(@90);
    }];
    UITapGestureRecognizer *FirstProductDetail2=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(toFirstProductDetail2:)];
    [self.imgV2 addGestureRecognizer:FirstProductDetail2];
    
    
    
    
    
    self.lab2 = [[UILabel alloc]init];
    self.lab2.font = [UIFont fontWithName:@"Arial" size:9];
    self.lab2.textAlignment = 0;
    self.lab2.numberOfLines = 2;
    self.lab2.lineBreakMode = NSLineBreakByTruncatingTail;
    [view2 addSubview:self.lab2];
    [self.lab2 mas_makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(self.imgV2.mas_right);
        make.top.equalTo(self.imgV2.mas_bottom);
        make.left.equalTo(self.imgV2.mas_left);
        make.height.equalTo(@25);
    }];
    
    self.Pricelab2 = [[UILabel alloc]init];
    self.Pricelab2.font = [UIFont fontWithName:@"Arial" size:11];
    self.Pricelab2.lineBreakMode = NSLineBreakByWordWrapping;
    self.Pricelab2.textColor = [UIColor redColor];
    [view2 addSubview:self.Pricelab2];
    [self.Pricelab2 mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(view2.mas_left).offset(5);
        make.bottom.equalTo(view2.mas_bottom);
        make.height.equalTo(@15);
    }];
    
    self.market_price2 = [[UILabel alloc]init];
    self.market_price2.font = [UIFont fontWithName:@"Arial" size:10];
    self.market_price2.lineBreakMode = NSLineBreakByWordWrapping;
    self.market_price2.textColor = [UIColor lightGrayColor];
    [view2 addSubview:self.market_price2];
    [self.market_price2 mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.Pricelab2.mas_right).offset(5);
        make.bottom.equalTo(view2.mas_bottom);
        make.height.equalTo(@15);
    }];
    
    UILabel *linelab2 = [[UILabel alloc]init];
    linelab2.backgroundColor = [UIColor darkGrayColor];
    [self.market_price2 addSubview:linelab2];
    [linelab2 mas_makeConstraints:^(MASConstraintMaker *make){
        make.width.equalTo(self.market_price2.mas_width);
        make.height.equalTo(@0.5);
        make.top.equalTo(self.market_price2.mas_centerY);
        make.left.equalTo(self.market_price2.mas_left);
    }];

    
    
    
    #pragma mark -----------------第三件商品-----------------------
    
    UIView *view3 = [[UIView alloc]init];
    [self.scr addSubview:view3];
    [view3 mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(view2.mas_right).offset(10);
        make.top.equalTo(self.scr.mas_top).offset(5);
        make.height.equalTo(@130);
        make.width.equalTo(@120);
    }];
    
    self.imgV3 = [[UIImageView alloc]init];
    self.imgV3.backgroundColor = [UIColor lightGrayColor];
    self.imgV3.tag = 3;
    [view3 addSubview:self.imgV3];
    [self.imgV3 mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(view3.mas_left);
        make.top.equalTo(view3.mas_top);
        make.right.equalTo(view3.mas_right);
        make.height.equalTo(@90);
    }];
    UITapGestureRecognizer *FirstProductDetail3=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(toFirstProductDetail3:)];
    [self.imgV3 addGestureRecognizer:FirstProductDetail3];
    
    
    
    
    
    self.lab3 = [[UILabel alloc]init];
    self.lab3.font = [UIFont fontWithName:@"Arial" size:9];
    self.lab3.textAlignment = 0;
    self.lab3.numberOfLines = 2;
    self.lab3.lineBreakMode = NSLineBreakByTruncatingTail;
    [view3 addSubview:self.lab3];
    [self.lab3 mas_makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(self.imgV3.mas_right);
        make.top.equalTo(self.imgV3.mas_bottom);
        make.left.equalTo(self.imgV3.mas_left);
        make.height.equalTo(@25);
    }];
    
    
    self.lab3 = [[UILabel alloc]init];
    self.lab3.font = [UIFont fontWithName:@"Arial" size:9];
    self.lab3.textAlignment = 0;
    self.lab3.numberOfLines = 2;
    self.lab3.lineBreakMode = NSLineBreakByTruncatingTail;
    [view3 addSubview:self.lab3];
    [self.lab3 mas_makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(self.imgV3.mas_right);
        make.top.equalTo(self.imgV3.mas_bottom);
        make.left.equalTo(self.imgV3.mas_left);
        make.height.equalTo(@25);
    }];
    
    self.Pricelab3 = [[UILabel alloc]init];
    self.Pricelab3.font = [UIFont fontWithName:@"Arial" size:11];
    self.Pricelab3.lineBreakMode = NSLineBreakByWordWrapping;
    self.Pricelab3.textColor = [UIColor redColor];
    [view3 addSubview:self.Pricelab3];
    [self.Pricelab3 mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(view3.mas_left).offset(5);
        make.bottom.equalTo(view3.mas_bottom);
        make.height.equalTo(@15);
    }];
    
    self.market_price3 = [[UILabel alloc]init];
    self.market_price3.font = [UIFont fontWithName:@"Arial" size:10];
    self.market_price3.lineBreakMode = NSLineBreakByWordWrapping;
    self.market_price3.textColor = [UIColor lightGrayColor];
    [view3 addSubview:self.market_price3];
    [self.market_price3 mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.Pricelab3.mas_right).offset(5);
        make.bottom.equalTo(view3.mas_bottom);
        make.height.equalTo(@15);
    }];
    
    UILabel *linelab3 = [[UILabel alloc]init];
    linelab3.backgroundColor = [UIColor darkGrayColor];
    [self.market_price3 addSubview:linelab3];
    [linelab3 mas_makeConstraints:^(MASConstraintMaker *make){
        make.width.equalTo(self.market_price3.mas_width);
        make.height.equalTo(@0.5);
        make.top.equalTo(self.market_price3.mas_centerY);
        make.left.equalTo(self.market_price3.mas_left);
    }];

    
    
    #pragma mark -----------------第四件商品-----------------------

    
    UIView *view4 = [[UIView alloc]init];
    [self.scr addSubview:view4];
    [view4 mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(view3.mas_right).offset(10);
        make.top.equalTo(self.scr.mas_top).offset(5);
        make.height.equalTo(@130);
        make.width.equalTo(@120);
    }];
    
    self.imgV4 = [[UIImageView alloc]init];
    self.imgV4.backgroundColor = [UIColor lightGrayColor];
    self.imgV4.tag = 4;
    [view4 addSubview:self.imgV4];
    [self.imgV4 mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(view4.mas_left);
        make.top.equalTo(view4.mas_top);
        make.right.equalTo(view4.mas_right);
        make.height.equalTo(@90);
    }];
    UITapGestureRecognizer *FirstProductDetail4=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(toFirstProductDetail4:)];
    [self.imgV4 addGestureRecognizer:FirstProductDetail4];
    
    
    

    self.lab4 = [[UILabel alloc]init];
    self.lab4.font = [UIFont fontWithName:@"Arial" size:9];
    self.lab4.textAlignment = 0;
    self.lab4.numberOfLines = 2;
    self.lab4.lineBreakMode = NSLineBreakByTruncatingTail;
    [view4 addSubview:self.lab4];
    [self.lab4 mas_makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(self.imgV4.mas_right);
        make.top.equalTo(self.imgV4.mas_bottom);
        make.left.equalTo(self.imgV4.mas_left);
        make.height.equalTo(@25);
    }];
    
    self.lab4 = [[UILabel alloc]init];
    self.lab4.font = [UIFont fontWithName:@"Arial" size:9];
    self.lab4.textAlignment = 0;
    self.lab4.numberOfLines = 2;
    self.lab4.lineBreakMode = NSLineBreakByTruncatingTail;
    [view4 addSubview:self.lab4];
    [self.lab4 mas_makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(self.imgV4.mas_right);
        make.top.equalTo(self.imgV4.mas_bottom);
        make.left.equalTo(self.imgV4.mas_left);
        make.height.equalTo(@25);
    }];
    
    

    
    self.Pricelab4 = [[UILabel alloc]init];
    self.Pricelab4.font = [UIFont fontWithName:@"Arial" size:11];
    self.Pricelab4.lineBreakMode = NSLineBreakByWordWrapping;
    self.Pricelab4.textColor = [UIColor redColor];
    [view4 addSubview:self.Pricelab4];
    [self.Pricelab4 mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(view4.mas_left).offset(5);
        make.bottom.equalTo(view4.mas_bottom);
        make.height.equalTo(@15);
    }];
    
    self.market_price4 = [[UILabel alloc]init];
    self.market_price4.font = [UIFont fontWithName:@"Arial" size:10];
    self.market_price4.lineBreakMode = NSLineBreakByWordWrapping;
    self.market_price4.textColor = [UIColor lightGrayColor];
    [view4 addSubview:self.market_price4];
    [self.market_price4 mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.Pricelab4.mas_right).offset(5);
        make.bottom.equalTo(view4.mas_bottom);
        make.height.equalTo(@15);
    }];
    
    UILabel *linelab4 = [[UILabel alloc]init];
    linelab4.backgroundColor = [UIColor darkGrayColor];
    [self.market_price4 addSubview:linelab4];
    [linelab4 mas_makeConstraints:^(MASConstraintMaker *make){
        make.width.equalTo(self.market_price4.mas_width);
        make.height.equalTo(@0.5);
        make.top.equalTo(self.market_price4.mas_centerY);
        make.left.equalTo(self.market_price4.mas_left);
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
