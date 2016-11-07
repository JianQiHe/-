//
//  SerachZXGSViewController.m
//  家装
//
//  Created by mac on 16/8/3.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "SerachZXGSViewController.h"

@interface SerachZXGSViewController ()<UISearchBarDelegate>
@property (nonatomic,strong)UIButton *rightBtn;
@end

@implementation SerachZXGSViewController
{
    UISearchBar *searchBar;

}

-(void)viewWillAppear:(BOOL)animated
{
    [searchBar becomeFirstResponder];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    searchBar = [[UISearchBar alloc] init];
    searchBar.delegate = self;
    searchBar.backgroundColor = [UIColor clearColor];
    searchBar.barTintColor = [UIColor whiteColor];
    searchBar.placeholder = @"|搜索公司";
    self.navigationItem.titleView = searchBar;
    
    
    
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithCustomView:self.rightBtn];
    [self.navigationItem setRightBarButtonItem:rightBarButton];
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(reKeyBoard)];
    [self.view addGestureRecognizer:tap];
    // Do any additional setup after loading the view.
}
- (UIButton *)rightBtn
{
    if (_rightBtn == nil) {
        _rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(180, 0, 60, 30)];
        [_rightBtn setTitle:@"搜索" forState:UIControlStateNormal];
        [_rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        //        [_rightBtn setTitle:@"搜索" forState:UIControlStateNormal];
        [_rightBtn addTarget:self action:@selector(search) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightBtn;
}
-(void)search
{
    NSLog(@"点击了");
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
    NSLog(@"nihaoa");
}
- (void)reKeyBoard
{
    [searchBar resignFirstResponder];
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
