//
//  TKDDViewController.m
//  家装
//
//  Created by mac on 16/5/14.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "TKDDViewController.h"

@interface TKDDViewController ()

@end

@implementation TKDDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.title = @"退款/售后";
    
    
    UIImageView *imagV =[[UIImageView alloc]init];
    imagV.image = [UIImage imageNamed:@"订单"];
    [self.view addSubview:imagV];
    [imagV mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.view.mas_left).offset((Width-80)/2);
        make.right.equalTo(self.view.mas_right).offset(-(Width-80)/2);
        make.top.equalTo(self.view.mas_top).offset((Height-80)/2);
        make.height.equalTo(@80);
}];
    
    
    UILabel *lab = [[UILabel alloc]init];
    [self.view addSubview:lab];
    lab.text = @"您还没有相关的订单";
    lab.textAlignment = 1;
    lab.font = [UIFont systemFontOfSize:15];
    lab.backgroundColor = [UIColor clearColor];
    [lab mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(imagV.mas_left).offset(-40);
        make.right.equalTo(imagV.mas_right).offset(40);
        make.top.equalTo(imagV.mas_bottom).offset(5);
        make.height.equalTo(@15);
}];

    
    
    UILabel *label = [[UILabel alloc]init];
    [self.view addSubview:label];
    label.text = @"可以去看看有哪些想买的";
    label.textAlignment = 1;
    label.font = [UIFont systemFontOfSize:10];
    label.textColor = [UIColor lightGrayColor];
    label.backgroundColor = [UIColor clearColor];
    [label mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(imagV.mas_left).offset(-30);
        make.right.equalTo(imagV.mas_right).offset(30);
        make.top.equalTo(lab.mas_bottom).offset(5);
        make.height.equalTo(@15);
    }];
    
    

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
