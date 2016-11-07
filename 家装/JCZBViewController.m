//
//  JCZBViewController.m
//  家装
//
//  Created by mac on 16/6/21.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "JCZBViewController.h"

@interface JCZBViewController ()<UIScrollViewDelegate>
{
    UIScrollView *scr;
}

@end

@implementation JCZBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    
    if (Height==480) {
        scr = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, Width, Height)];
        scr.delegate = self;
        [self.view addSubview:scr];
        scr.backgroundColor = [UIColor groupTableViewBackgroundColor];
        scr.showsHorizontalScrollIndicator = NO;
        scr.contentSize = CGSizeMake(0, 1.02*Height);
        
    }else
    {
        scr = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, Width, Height)];
        scr.delegate = self;
        [self.view addSubview:scr];
        scr.backgroundColor = [UIColor groupTableViewBackgroundColor];
        scr.showsHorizontalScrollIndicator = NO;
        scr.contentSize = CGSizeMake(0, 0);
    }
    
    
    
    
    #pragma mark -----------------label上的字符部分改变颜色-----------------------
    
    UILabel *name = [[UILabel alloc]initWithFrame:CGRectMake(10, 20, 60, 40)];
    name.font = [UIFont systemFontOfSize:13];
    name.textAlignment = 2;
    NSMutableAttributedString *noteStr2 = [[NSMutableAttributedString alloc] initWithString:@"      ＊姓名"];
    NSRange redRange2 = NSMakeRange([[noteStr2 string] rangeOfString:@"＊"].location, [[noteStr2 string] rangeOfString:@"＊"].length);
    [noteStr2 addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:redRange2];
    [name setAttributedText:noteStr2];
    [name sizeToFit];
    [scr addSubview:name];
    
    UILabel *phone = [[UILabel alloc]initWithFrame:CGRectMake(5, 60, 65, 40)];
    phone.font = [UIFont systemFontOfSize:13];

    NSMutableAttributedString *noteStr = [[NSMutableAttributedString alloc] initWithString:@"＊联系电话"];
    NSRange redRange = NSMakeRange([[noteStr string] rangeOfString:@"＊"].location, [[noteStr string] rangeOfString:@"＊"].length);
    [noteStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:redRange];
    [phone setAttributedText:noteStr];
    [phone sizeToFit];
    phone.textAlignment = 2;
    [scr addSubview:phone];


    UITextField *namefield = [[UITextField alloc]init];
    namefield.backgroundColor = [UIColor whiteColor];
    [scr addSubview:namefield];
    namefield.layer.cornerRadius = 5;
    [namefield mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(name.mas_right).offset(5);
        make.top.equalTo(name.mas_top).offset(-10);
        make.height.equalTo(@30);
        make.right.equalTo(self.view.mas_right).offset(-20);
}];

    UITextField *phonefield = [[UITextField alloc]init];
    phonefield.backgroundColor = [UIColor whiteColor];
    [scr addSubview:phonefield];
    phonefield.layer.cornerRadius = 5;
    [phonefield mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(phone.mas_right).offset(5);
        make.top.equalTo(phone.mas_top).offset(-10);
        make.height.equalTo(@30);
        make.right.equalTo(self.view.mas_right).offset(-20);
    }];

    
    #pragma mark -----------------地墙面-----------------------
    
    UILabel *diqiangmian = [[UILabel alloc]initWithFrame:CGRectMake(10, 85, 60, 40)];
    diqiangmian.font = [UIFont systemFontOfSize:13];
    diqiangmian.textAlignment = 2;
    diqiangmian.text = @"地墙面";
    [scr addSubview:diqiangmian];
    
    
    //地板
    UIImageView *diban = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Nocheck"]];
    [scr addSubview:diban];
    [diban mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(diqiangmian.mas_right).offset(5);
        make.bottom.equalTo(diqiangmian.mas_bottom).offset(-10);
        make.top.equalTo(diqiangmian.mas_top).offset(10);
        make.width.equalTo(@20);
}];

    UILabel *dibanlab = [[UILabel alloc]init];
    dibanlab.text = @"地板";
    dibanlab.font = [UIFont systemFontOfSize:13];
    dibanlab.textAlignment = 0;
    [scr addSubview:dibanlab];
    [dibanlab mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(diban.mas_right).offset(5);
        make.top.equalTo(diban.mas_top);
        make.bottom.equalTo(diban.mas_bottom);
        make.width.equalTo(@30);
}];

    
    
    
    
    
    
    
    
    //油漆
    UIImageView *youqi = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Nocheck"]];
    
    [scr addSubview:youqi];
    [youqi mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(dibanlab.mas_right).offset(15);
        make.bottom.equalTo(diban.mas_bottom);
        make.top.equalTo(diban.mas_top);
        make.width.equalTo(@20);
    }];
    
    UILabel *youqilab = [[UILabel alloc]init];
    youqilab.text = @"油漆";
    youqilab.font = [UIFont systemFontOfSize:13];
    youqilab.textAlignment = 0;
    [scr addSubview:youqilab];
    [youqilab mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(youqi.mas_right).offset(5);
        make.top.equalTo(youqi.mas_top);
        make.bottom.equalTo(youqi.mas_bottom);
        make.width.equalTo(@30);
    }];

    
    
    
    
    
    
    
    //门窗
    UIImageView *menchuang = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Nocheck"]];
    [scr addSubview:menchuang];
    [menchuang mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(youqilab.mas_right).offset(15);
        make.bottom.equalTo(diban.mas_bottom);
        make.top.equalTo(diban.mas_top);
        make.width.equalTo(@20);
    }];
    
    UILabel *menchuanglab = [[UILabel alloc]init];
    menchuanglab.text = @"门窗";
    menchuanglab.font = [UIFont systemFontOfSize:13];
    menchuanglab.textAlignment = 0;
    [scr addSubview:menchuanglab];
    [menchuanglab mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(menchuang.mas_right).offset(5);
        make.top.equalTo(menchuang.mas_top);
        make.bottom.equalTo(menchuang.mas_bottom);
        make.width.equalTo(@30);
    }];
    
    
    
    
    
    
    
    
    
    
    
    
    //瓷砖
    UIImageView *cizhuan = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Nocheck"]];
    [scr addSubview:cizhuan];
    [cizhuan mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(diban.mas_left);
        make.top.equalTo(diban.mas_bottom).offset(15);
        make.height.equalTo(diban.mas_height);
        make.width.equalTo(@20);
    }];
    
    UILabel *cizhuanlab = [[UILabel alloc]init];
    cizhuanlab.text = @"瓷砖";
    cizhuanlab.font = [UIFont systemFontOfSize:13];
    cizhuanlab.textAlignment = 0;
    [scr addSubview:cizhuanlab];
    [cizhuanlab mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(cizhuan.mas_right).offset(5);
        make.top.equalTo(cizhuan.mas_top);
        make.bottom.equalTo(cizhuan.mas_bottom);
        make.width.equalTo(@30);
    }];

    
    
    
    
    
    
    
    //墙纸
    UIImageView *qiangzhi = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Nocheck"]];
    [scr addSubview:qiangzhi];
    [qiangzhi mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(cizhuanlab.mas_right).offset(15);
        make.bottom.equalTo(cizhuan.mas_bottom);
        make.top.equalTo(cizhuan.mas_top);
        make.width.equalTo(@20);
    }];
    
    UILabel *qiangzhilab = [[UILabel alloc]init];
    qiangzhilab .text = @"墙纸";
    qiangzhilab .font = [UIFont systemFontOfSize:13];
    qiangzhilab .textAlignment = 0;
    [scr addSubview:qiangzhilab ];
    [qiangzhilab  mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(qiangzhi.mas_right).offset(5);
        make.top.equalTo(qiangzhi.mas_top);
        make.bottom.equalTo(qiangzhi.mas_bottom);
        make.width.equalTo(@30);
    }];
    
    
#pragma mark -----------------中间部分布局-----------------------
    for (int i=0 ; i<5; i++) {
        NSArray *arr = @[@"装修面积",@"小区名称",@"所在地区",@"详细地址",@"备注要求"];
        UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(10, 150+i*40, 60, 40)];
        [scr addSubview:lab];
        lab.font = [UIFont systemFontOfSize:13];
        lab.tag = i;
        lab.text = arr[i];
        lab.textAlignment = 2;
        
    }
    for (int i= 0; i<5; i++) {
        UITextField *textfield = [[UITextField alloc]init];
        textfield.backgroundColor = [UIColor whiteColor];
        [scr addSubview:textfield];
        textfield.tag = 10+i;
        textfield.layer.cornerRadius = 5;
        textfield.frame = CGRectMake(75, 155+i*40, Width-95, 30);
        if (i==4) {
            textfield.frame = CGRectMake(75, 155+40*4, Width-95, 70);
        }
    }
#pragma mark -----------------底部-----------------------
    
    UITextField *cangzao = [self.view viewWithTag:14];//

    UIButton *fabu = [UIButton buttonWithType:UIButtonTypeCustom];
    [fabu setTitle:@"免费发布招标" forState:UIControlStateNormal];
    fabu.backgroundColor = [UIColor orangeColor];
    [fabu setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    fabu.titleLabel.font = [UIFont systemFontOfSize:12];
    fabu.layer.cornerRadius = 7;
    [scr addSubview:fabu];
    [fabu mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(cangzao.mas_bottom).offset(10);
        make.left.equalTo(name.mas_left);
        make.width.equalTo(@80);
        make.height.equalTo(@25);
    }];
    
    
    
    UILabel *bodalab = [[UILabel alloc]init];
    [scr addSubview:bodalab];
    bodalab.text = @"或拨打";
    bodalab.font = [UIFont systemFontOfSize:14];
    bodalab.textColor = [UIColor darkGrayColor];
    bodalab.textAlignment = 0;
    [bodalab mas_makeConstraints:^(MASConstraintMaker *make){
        make.bottom.equalTo(fabu.mas_bottom).offset(-2);
        make.left.equalTo(fabu.mas_right).offset(5);
        make.width.equalTo(@50);
        make.height.equalTo(@15);
    }];
    
    
    UILabel *haomalab = [[UILabel alloc]init];
    [scr addSubview:haomalab];
    haomalab.text = @"4009993809";
    haomalab.font = [UIFont systemFontOfSize:20];
    haomalab.textColor = [UIColor orangeColor];
    haomalab.textAlignment = 0;
    haomalab.numberOfLines = 0;//根据最大行数需求来设置
    haomalab.lineBreakMode = NSLineBreakByTruncatingTail;
    [haomalab mas_makeConstraints:^(MASConstraintMaker *make){
        make.bottom.equalTo(bodalab.mas_bottom);
        make.left.equalTo(bodalab.mas_right).offset(1);
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
