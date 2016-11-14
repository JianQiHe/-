//
//  StudyViewController.m
//  家装
//
//  Created by mac on 16/6/25.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "StudyViewController.h"

@interface StudyViewController ()

@end

@implementation StudyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"学装修"];
    UIWebView * webView = [[UIWebView alloc]initWithFrame:self.view.frame];

    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://jiazhuang.siruoit.com/index.php?article-detail-144.html"]];

    //    jiazhuang.siruoit.com/index.php?api/api-blockitem43/   http://jiazhuang.siruoit.com/index.php?article-detail-118.html
//    http://jiazhuang.siruoit.com/index.php?article.html 
    
    [self.view addSubview:webView];
    [webView loadRequest:request];

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
