//
//  AboutUs.m
//  家装
//
//  Created by mac on 16/7/18.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "AboutUs.h"

@interface AboutUs()

@end


@implementation AboutUs

-(void)viewDidLoad
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *label1 = [[UILabel alloc]init];
    label1.font = [UIFont systemFontOfSize:12];
    label1.text = @"版权所有2006-2016东方拜尔装饰工程股份有限公司(www.jzmhw.com.cn)";
    label1.textColor = [UIColor blackColor];
    label1.numberOfLines = 2;
    label1.textAlignment = 1;
    [self.view addSubview:label1];
    [label1 mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.view.mas_left).offset(40);
        make.right.equalTo(self.view.mas_right).offset(-40);
        make.top.equalTo(self.view.mas_top).offset(100);
        make.height.equalTo(@30);
    }];
    
    
    
    
    UILabel *label2 = [[UILabel alloc]init];
    label2.font = [UIFont systemFontOfSize:9];
    label2.text = @"Copyright © 2006-2016 www.jzmhw.com.cn All Rights Reserved.";
    label2.textColor = [UIColor blackColor];
    label2.numberOfLines = 2;
    label2.textAlignment = 1;
    [self.view addSubview:label2];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.view.mas_left).offset(30);
        make.right.equalTo(self.view.mas_right).offset(-30);
        make.top.equalTo(label1.mas_bottom);
        make.height.equalTo(@30);
    }];
}
@end
