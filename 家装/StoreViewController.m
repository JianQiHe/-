//
//  StoreViewController.m
//  家装
//
//  Created by  on 16/11/9.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "StoreViewController.h"
#import "FinanicalViewController.h"
#import "GWDDViewController.h"
#import "AppoinPViewController.h"

@interface StoreViewController ()
@property (weak, nonatomic) IBOutlet UILabel *titleOne;
@property (weak, nonatomic) IBOutlet UILabel *financialLabel;
@property (weak, nonatomic) IBOutlet UIButton *financialBtn;
@property (weak, nonatomic) IBOutlet UILabel *titleTwo;
@property (weak, nonatomic) IBOutlet UILabel *orderLabel;
@property (weak, nonatomic) IBOutlet UIButton *orderBtn;
@property (weak, nonatomic) IBOutlet UILabel *appointLabel;
@property (weak, nonatomic) IBOutlet UIButton *appointBtn;
@property (weak, nonatomic) IBOutlet UILabel *tenderLabel;//投标
@property (weak, nonatomic) IBOutlet UIButton *tenderBtn;
@property (weak, nonatomic) IBOutlet UILabel *bidLabel;//竞标
@property (weak, nonatomic) IBOutlet UIButton *bidBtn;

@end

@implementation StoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)touchUpFinancialBtnAction:(id)sender {
    FinanicalViewController *controller = [[FinanicalViewController alloc] initWithNibName:@"FinanicalViewController" bundle:nil];
    controller.navigationItem.title = @"财务管理";
    controller.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:controller animated:YES];

}

- (IBAction)touchUpOrderBtnAction:(id)sender {
    self.hidesBottomBarWhenPushed = YES;
    GWDDViewController *view = [[GWDDViewController alloc]init];
    [self.navigationController pushViewController:view animated:YES];
    
}

- (IBAction)touchUpAppointBtnAction:(id)sender {
    self.hidesBottomBarWhenPushed = YES;
    AppoinPViewController *controller = [[AppoinPViewController alloc]init];
    controller.navigationItem.title = @"预约管理";
    [self.navigationController pushViewController:controller animated:YES];

}

- (IBAction)touchUpTenderBtnAction:(id)sender {
}

- (IBAction)touchUpBidBtnAction:(id)sender {
}

@end
