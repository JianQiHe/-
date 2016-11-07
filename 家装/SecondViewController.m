//
//  SecondViewController.m
//  家装
//
//  Created by mac on 16/5/3.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "SecondViewController.h"
#import "HomeController.h"
@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *label1=[[UILabel alloc]init];
    label1.frame=CGRectMake(38, 80, 300, 30);
    label1.backgroundColor=[UIColor whiteColor];
    label1.text=@"This is secondviewcontroller";
    [self.view addSubview:label1];
    
    UIButton *btn2=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn2.frame=CGRectMake(38, 120, 300, 30);
    [btn2 setTitle:@"backTo" forState:UIControlStateNormal];
    btn2.backgroundColor=[UIColor orangeColor];
    [self.view addSubview:btn2];
    [btn2 addTarget:self action:@selector(backTo) forControlEvents:UIControlEventTouchUpInside];
    
    //设置导航标题，这个时候的返回按钮的title就是上一级的navigationItem的title文字
    [self.navigationItem setTitle:@"子页"];
    
    //我们也可以在子页中自定义一个返回按钮覆盖原先的"<back"
    UIBarButtonItem *barBtn5=[[UIBarButtonItem alloc]initWithTitle:@"回家" style:UIBarButtonItemStylePlain target:self action:@selector(backTo)];
    self.navigationItem.leftBarButtonItem=barBtn5;
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)backTo{
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:0] animated:YES];
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
