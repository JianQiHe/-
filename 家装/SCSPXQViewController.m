//
//  SCSPXQViewController.m
//  家装
//
//  Created by mac on 16/5/26.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "SCSPXQViewController.h"
#import "Masonry.h"
#import "PrefixHeader.pch"
#import "NJRequsets.h"
@interface SCSPXQViewController ()<UIScrollViewDelegate>

@end

@implementation SCSPXQViewController
{
  
    UIScrollView *scrollview;
    UIPageControl *pagecontrol;
}

- (void)viewDidLoad {
    [super viewDidLoad];

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
    lab1.text = @"致尚重型铝合金窗帘轨道直轨轨罗马杆导轨测顶装";
    lab1.font = [UIFont systemFontOfSize:17];
    lab1.numberOfLines = 2;
    [firstView addSubview:lab1];
    
    [lab1 mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(firstView.mas_left).offset(10);
        make.top.equalTo(firstView.mas_top);
        make.height.equalTo(@50);
        make.right.equalTo(firstView.mas_right).offset(-70);
    }];
    
    UIImageView *imgV = [[UIImageView alloc]init];
    imgV.image = [UIImage imageNamed:@"收藏.png"];
    [firstView addSubview:imgV];
    [imgV mas_makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(firstView.mas_right).offset(-5);
        make.top.equalTo(firstView.mas_top).offset(5);
        make.width.equalTo(@40);
        make.height.equalTo(@40);
}];


    UILabel *lab6 = [[UILabel alloc]init];
    lab6.backgroundColor = [UIColor grayColor];
    [firstView addSubview:lab6];
    [lab6 mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(imgV.mas_top).offset(5);
        make.bottom.equalTo(imgV.mas_bottom);
        make.width.equalTo(@1);
        make.right.equalTo(imgV.mas_left).offset(-10);
    }];
    
    UIButton *leftbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftbtn.frame =CGRectMake(0, Height-50, Width/3, 50);
    leftbtn.backgroundColor = [UIColor whiteColor];
    [leftbtn setTitle:@"立即招标" forState:UIControlStateNormal];
    [leftbtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.view addSubview:leftbtn];
    
    UIButton *centerbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    centerbtn.frame = CGRectMake(Width/3,Height-50 , Width/3, 50);
    centerbtn.backgroundColor = [UIColor colorWithRed:253/255.0 green:198/255.0 blue:101/255.0 alpha:1];    [centerbtn setTitle:@"加入购物车" forState:UIControlStateNormal];
    [self.view addSubview:centerbtn];
    
    
    UIButton *rightbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightbtn.frame =CGRectMake(Width/3*2, Height-50, Width/3, 50);
    [rightbtn setTitle:@"立即购买" forState:UIControlStateNormal];
    [rightbtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    rightbtn.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:rightbtn];
    //253 198 101
    
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
    label1.text = @"店铺价：";
    label1.font = [UIFont systemFontOfSize:10];
    label1.textColor = [UIColor grayColor];
    label1.numberOfLines = 0;
    label1.lineBreakMode = NSLineBreakByWordWrapping;
    [secView addSubview:label1];
    [label1 mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(secView.mas_top).offset(10);
        make.left.equalTo(secView.mas_left).offset(15);
        make.height.equalTo(@15);
    }];
    
    UILabel *label2 = [[UILabel alloc]init];
    label2.text = @"总销量：28";
    label2.font = [UIFont systemFontOfSize:10];
    label2.textColor = [UIColor grayColor];
    label2.numberOfLines = 0;
    label2.lineBreakMode = NSLineBreakByWordWrapping;
    [secView addSubview:label2];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(label1.mas_left);
        make.top.equalTo(label1.mas_bottom).offset(10);
        make.height.equalTo(@20);
    }];
    UILabel *label6 = [[UILabel alloc]init];
    label6.text = @"2590.00";
    label6.font = [UIFont systemFontOfSize:20];
    label6.textColor = [UIColor redColor];
    label6.numberOfLines = 0;
    label6.lineBreakMode = NSLineBreakByWordWrapping;
    [secView addSubview:label6];
    [label6 mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(label1.mas_right);
        make.bottom.equalTo(label1.mas_bottom);
        make.height.equalTo(@20);
}];

    UILabel *label7 = [[UILabel alloc]init];
    label7.text = @"3599.00";
    label7.font = [UIFont systemFontOfSize:14];
    label7.textColor = [UIColor grayColor];
    label7.numberOfLines = 0;
    label7.lineBreakMode = NSLineBreakByWordWrapping;
    [secView addSubview:label7];
    [label7 mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(label6.mas_right);
        make.bottom.equalTo(label6.mas_bottom);
        make.height.equalTo(@15);
        
}];
    UILabel *line = [[UILabel alloc]init];
    line.backgroundColor = [UIColor grayColor];
    [secView addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make){
        make.width.equalTo(label7.mas_width);
        make.center.equalTo(label7);
        make.height.equalTo(@1);
}];


    
    
    UILabel *label3 = [[UILabel alloc]init];
    label3.text = @" 分类：导轨";
    label3.font = [UIFont systemFontOfSize:10];
    label3.textColor = [UIColor grayColor];
    label3.numberOfLines = 0;
    label3.lineBreakMode = NSLineBreakByWordWrapping;
    [secView addSubview:label3];
    [label3 mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(label2.mas_right).offset(15);
        make.top.equalTo(label2.mas_top);
        make.height.equalTo(label2);
    }];
    
    
    
    
    UILabel *label4 = [[UILabel alloc]init];
    label4.text = @"运费：0.00";
    label4.font = [UIFont systemFontOfSize:10];
    label4.textColor = [UIColor grayColor];
    label4.numberOfLines = 0;
    label4.lineBreakMode = NSLineBreakByWordWrapping;
    [secView addSubview:label4];
    [label4 mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(label3.mas_right).offset(15);
        make.top.equalTo(label3.mas_top);
        make.height.equalTo(label3);
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
    // Do any additional setup after loading the view.



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
