//
//  RechargeMoneyViewController.m
//  家装
//
//  Created by 十月 on 16/10/18.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "RechargeMoneyViewController.h"

@interface RechargeMoneyViewController ()
@property (weak, nonatomic) IBOutlet UILabel *BankCard;
@property (weak, nonatomic) IBOutlet UILabel *sum;
@property (weak, nonatomic) IBOutlet UIButton *addCard;
@property (weak, nonatomic) IBOutlet UIButton *submitBtn;
@property (weak, nonatomic) IBOutlet UITextField *sumField;

@end

@implementation RechargeMoneyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.submitBtn.layer.cornerRadius = 5;
      
    

}

- (IBAction)touchUpAddCard:(id)sender {
    [self.view endEditing:YES];

}

- (IBAction)touchUpSubmitBtn:(id)sender {
    [self.view endEditing:YES];
    
}


@end
