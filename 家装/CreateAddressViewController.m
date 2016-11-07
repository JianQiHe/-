//
//  CreateAddressViewController.m
//  家装
//
//  Created by 十月 on 16/10/17.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "CreateAddressViewController.h"

@interface CreateAddressViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *bgScrollView;
@property (weak, nonatomic) IBOutlet UITextField *consignee;
@property (weak, nonatomic) IBOutlet UITextField *telNum;
@property (weak, nonatomic) IBOutlet UITextField *province;
@property (weak, nonatomic) IBOutlet UITextField *city;
@property (weak, nonatomic) IBOutlet UITextField *area;
@property (weak, nonatomic) IBOutlet UITextView *address;
@property (weak, nonatomic) IBOutlet UIButton *commitBtn;

@end

@implementation CreateAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.commitBtn.layer.cornerRadius = 18;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)touchUpCommitBtn:(id)sender {
}


@end
