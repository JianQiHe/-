//
//  SPXQViewController.m
//  家装
//
//  Created by mac on 16/5/25.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "SPXQViewController.h"
#import "Masonry.h"
@interface SPXQViewController ()<UIScrollViewDelegate>

@end

@implementation SPXQViewController
{
    UIScrollView *scrollview;
    UIPageControl *pagecontrol;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"点击你就返回咯" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = item;
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    self.navigationItem.title = @"详情";
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    NSArray *arr = @[@"SPXQ1.jpg",@"SPXQ2.jpg",@"SPXQ3.jpg",@"SPXQ4.jpg",@"SPXQ5.jpg"];
    scrollview = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-200)];
    scrollview.delegate = self;
    for (int i = 0; i<5; i++)
    {
        UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(i*scrollview.frame.size.width, 0,scrollview.frame.size.width , scrollview.frame.size.height)];
        img.image = [UIImage imageNamed:arr[i]];
        [scrollview addSubview:img];
    }
    scrollview.showsHorizontalScrollIndicator = NO;
    scrollview.contentSize = CGSizeMake(arr.count*scrollview.frame.size.width, 0);
    [self.view addSubview:scrollview];
    scrollview.pagingEnabled = YES;
    pagecontrol = [[UIPageControl alloc]initWithFrame:CGRectMake(scrollview.frame.size.width/2-35, scrollview.frame.size.height-15, 70, 20)];
    pagecontrol.numberOfPages = 5;
    [self.view addSubview:pagecontrol];
    
    
    
    
    
    UIView *firstView = [[UIView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-195, self.view.frame.size.width, 60)];
    firstView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:firstView];
    UILabel *lab1 = [[UILabel alloc]init];
    lab1.text = @"某某装修公司";
    lab1.font = [UIFont systemFontOfSize:17];
    lab1.numberOfLines = 0;
    lab1.lineBreakMode = NSLineBreakByWordWrapping;
    [firstView addSubview:lab1];

    [lab1 mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(firstView.mas_left).offset(10);
        make.top.equalTo(firstView.mas_top).offset(5);
        make.height.equalTo(@20);
}];

    UILabel *lab2 = [[UILabel alloc]init];
    lab2.text = @"10000保证金";
    lab2.backgroundColor = [UIColor orangeColor];
    lab2.font = [UIFont systemFontOfSize:10];
    lab2.numberOfLines = 0;
    lab2.lineBreakMode = NSLineBreakByWordWrapping;
    lab2.clipsToBounds = YES;
    lab2.layer.cornerRadius = 5;
    [firstView addSubview:lab2];
    
    [lab2 mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(lab1.mas_right).offset(10);
        make.bottom.equalTo(lab1.mas_bottom).offset(-2);
        make.height.equalTo(@15);
    }];

    UIImageView *imgv = [[UIImageView alloc]init];
    imgv.image = [UIImage imageNamed:@"电话.png"];
    [firstView addSubview:imgv];
    [imgv mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(firstView.mas_left).offset(10);
        make.bottom.equalTo(firstView.mas_bottom).offset(-5);
        make.width.equalTo(@20);
        make.height.equalTo(@20);
}];

   // 0 205 122
    
    UILabel *lab3 = [[UILabel alloc]init];
    lab3.text = @"021-6000758";
    lab3.font = [UIFont systemFontOfSize:13];
    lab3.numberOfLines = 0;
    lab3.lineBreakMode = NSLineBreakByWordWrapping;
    lab3.textColor = [UIColor colorWithRed:0/255.0 green:205/225.0 blue:122/255.0 alpha:1];
    [firstView addSubview:lab3];
    [lab3 mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(imgv.mas_right).offset(5);
        make.bottom.equalTo(imgv.mas_bottom);
        make.height.equalTo(@15);
}];
    
    UILabel *lab4 = [[UILabel alloc]init];
    lab4.text = @"50";
    lab4.textColor =[UIColor orangeColor];
    lab4.font = [UIFont systemFontOfSize:25];
    lab4.textAlignment = 1;
    [firstView addSubview:lab4];
    [lab4 mas_makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(firstView.mas_right).offset(-5);
        make.top.equalTo(firstView.mas_top).offset(5);
        make.width.equalTo(@40);
        make.height.equalTo(@30);
}];
    UILabel *lab5 = [[UILabel alloc]init];
    lab5.text = @"信用指数";
    lab5.textColor = [UIColor grayColor];
    lab5.font = [UIFont systemFontOfSize:10];
    lab5.textAlignment = 1;
    [firstView addSubview:lab5];
    [lab5 mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(lab4.mas_bottom);
        make.right.equalTo(lab4.mas_right);
        make.left.equalTo(lab4.mas_left);
        make.height.equalTo(@10);
}];

    UILabel *lab6 = [[UILabel alloc]init];
    lab6.backgroundColor = [UIColor grayColor];
    [firstView addSubview:lab6];
    [lab6 mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(lab4.mas_top).offset(5);
        make.bottom.equalTo(lab5.mas_bottom);
        make.width.equalTo(@1);
        make.right.equalTo(lab4.mas_left).offset(-20);
}];

    UIButton *leftbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftbtn.frame =CGRectMake(0, self.view.frame.size.height-50, self.view.frame.size.width/2, 50);
    leftbtn.backgroundColor = [UIColor whiteColor];
    [leftbtn setTitle:@"立即招标" forState:UIControlStateNormal];
    [leftbtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [self.view addSubview:leftbtn];
    
    UIButton *rightbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightbtn.frame =CGRectMake(self.view.frame.size.width/2, self.view.frame.size.height-50, self.view.frame.size.width/2, 50);
    [rightbtn setTitle:@"免费预约" forState:UIControlStateNormal];
    [rightbtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    rightbtn.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:rightbtn];
    

    UIView *secView = [[UIView alloc]init];
    secView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:secView];
    [secView mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.top.equalTo(firstView.mas_bottom).offset(5);
        make.bottom.equalTo(leftbtn.mas_top).offset(-5);
}];


    UILabel *label1 = [[UILabel alloc]init];
    label1.text = @"地址：上海市浦东新区山城路20号帝国大厦902";
    label1.font = [UIFont systemFontOfSize:10];
    label1.textColor = [UIColor grayColor];
    label1.numberOfLines = 0;
    label1.lineBreakMode = NSLineBreakByWordWrapping;
    [secView addSubview:label1];
    [label1 mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(secView.mas_top).offset(15);
        make.left.equalTo(secView.mas_left).offset(15);
        make.height.equalTo(@20);
}];

    UILabel *label2 = [[UILabel alloc]init];
    label2.text = @"案例：28";
    label2.font = [UIFont systemFontOfSize:10];
    label2.textColor = [UIColor grayColor];
    label2.numberOfLines = 0;
    label2.lineBreakMode = NSLineBreakByWordWrapping;
    [secView addSubview:label2];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(label1.mas_left).offset(5);
        make.top.equalTo(label1.mas_bottom);
        make.height.equalTo(@20);
}];

    
    
    UILabel *label3 = [[UILabel alloc]init];
    label3.text = @" 在建工地：0";
    label3.font = [UIFont systemFontOfSize:10];
    label3.textColor = [UIColor grayColor];
    label3.numberOfLines = 0;
    label3.lineBreakMode = NSLineBreakByWordWrapping;
    [secView addSubview:label3];
    [label3 mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(label2.mas_right).offset(5);
        make.top.equalTo(label2.mas_top);
        make.height.equalTo(label2);
}];


    
    
    UILabel *label4 = [[UILabel alloc]init];
    label4.text = @"签单数：2";
    label4.font = [UIFont systemFontOfSize:10];
    label4.textColor = [UIColor grayColor];
    label4.numberOfLines = 0;
    label4.lineBreakMode = NSLineBreakByWordWrapping;
    [secView addSubview:label4];
    [label4 mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(label3.mas_right).offset(5);
        make.top.equalTo(label3.mas_top);
        make.height.equalTo(label3);
}];


    
    UILabel *label5 = [[UILabel alloc]init];
    label5.text = @"预约数：85";
    label5.font = [UIFont systemFontOfSize:10];
    label5.textColor = [UIColor grayColor];
    label5.numberOfLines = 0;
    label5.lineBreakMode = NSLineBreakByWordWrapping;
    [secView addSubview:label5];
    [label5 mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(label4.mas_right).offset(5);
        make.top.equalTo(label4.mas_top);
        make.height.equalTo(label4);
}];


    
        // Do any additional setup after loading the view.
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //偏移超过一半滚到下一个imageView
    if ((scrollview.contentOffset.x+scrollview.frame.size.width/2)/scrollview.frame.size.width)
    {
        pagecontrol.currentPage = (scrollview.contentOffset.x+scrollview.frame.size.width/2)/scrollview.frame.size.width;
    }
    //    NSLog(@"ssss");
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
