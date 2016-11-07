//
//  SureOrderViewController.m
//  家装
//
//  Created by 十月 on 16/10/19.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "SureOrderViewController.h"

@interface SureOrderViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *bgScrollview;

@property (weak, nonatomic) IBOutlet UIView *oneView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *telNumLab;
@property (weak, nonatomic) IBOutlet UILabel *addressLab;
@property (weak, nonatomic) IBOutlet UILabel *storeLabe;

@property (weak, nonatomic) IBOutlet UIView *twoView;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *titleLab;

@property (weak, nonatomic) IBOutlet UILabel *typeLab;
@property (weak, nonatomic) IBOutlet UILabel *timeLab;
@property (weak, nonatomic) IBOutlet UILabel *moneyLab;
@property (weak, nonatomic) IBOutlet UILabel *numLab;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UILabel *priceLab;
@property (weak, nonatomic) IBOutlet UIButton *affirmBtn;
@property (weak, nonatomic) IBOutlet UIButton *selectAddressBtn;
//数量
@property (weak, nonatomic) IBOutlet UIButton *minusbtn;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;
@property (weak, nonatomic) IBOutlet UILabel *numbLab;
//淘包保
@property (weak, nonatomic) IBOutlet UIButton *insurBtn;
//快递
@property (weak, nonatomic) IBOutlet UIButton *expressBtn;
@property (weak, nonatomic) IBOutlet UILabel *expresslab;
//运费险
@property (weak, nonatomic) IBOutlet UIButton *freightBtn;
@property (weak, nonatomic) IBOutlet UILabel *freightLab;
@property (weak, nonatomic) IBOutlet UITextField *messageField;

@end

@implementation SureOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"back"]forState:UIControlStateNormal];
    [button setFrame:CGRectMake(0,0,20,30)];
    //    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(jumpBack:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = barButtonItem;

    self.bgScrollview.contentSize = CGSizeMake(Width, Height);
//    self.bgScrollview.showsVerticalScrollIndicator = FALSE;   //隐藏滚动条
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeKeyBorad)];
    [self.bgScrollview addGestureRecognizer:tap];
    self.storeLabe.text = [NSString stringWithFormat:@"%@",[self.contDic objectForKey:@"shopName"]];
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:    [self.contDic objectForKey:@"imgName"]] placeholderImage:[UIImage imageNamed:@"photo"]];
    self.moneyLab.text = [NSString stringWithFormat:@"¥:%@",[self.contDic objectForKey:@"price"]];

    self.priceLab.text = [NSString stringWithFormat:@"合计¥:%d  ",([[self.contDic objectForKey:@"number"] integerValue]*[[self.contDic objectForKey:@"price"] integerValue])];
    self.numLab.text = [NSString stringWithFormat:@"×%@",[self.contDic objectForKey:@"number"]];
    self.numbLab.text =[NSString stringWithFormat:@"%@",[self.contDic objectForKey:@"number"]];
    self.titleLab.text = [NSString stringWithFormat:@"%@",[self.contDic objectForKey:@"title"]];
    
}
- (void)jumpBack:(UIButton *)btn{
    
    [self.navigationController popViewControllerAnimated:YES];

}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [super touchesBegan:touches withEvent:event];
//    [self.view endEditing:YES];
//}

- (void)closeKeyBorad{
    
    [self.view endEditing:YES];
    
//    [UIView animateWithDuration:0.38f animations:^{
//        
//        [self.bgScrollview setContentOffset:CGPointMake(0.0, 0.0)];
//        
//    }];
}

#pragma mark -
#pragma mark UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    [self closeKeyBorad];
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    [UIView animateWithDuration:0.38f animations:^{
        
        [self.bgScrollview setFrame:CGRectMake(0, -220, Width, self.view.frame.size.height)];
    }];


}
//确定
- (IBAction)touchUpAffirmBtn:(id)sender {
    
}

- (IBAction)touchUpSelectAddress:(id)sender {
    
}

- (IBAction)touchUpAddBtn:(id)sender {
    NSInteger count = [_numbLab.text integerValue];
    count++;
    NSString *numStr = [NSString stringWithFormat:@"%ld",(long)count];
    _numbLab.text = numStr;
    _numLab.text = [NSString stringWithFormat:@"×%@",numStr];
    self.priceLab.text = [NSString stringWithFormat:@"合计¥:%d  ",([[self.contDic objectForKey:@"price"] integerValue]*count)];
}

- (IBAction)touchUpMinusBtn:(id)sender {
    NSInteger count = [_numbLab.text integerValue];
    count--;
    NSString *numStr = [NSString stringWithFormat:@"%ld",(long)count];
    if (count<1) {
        _numbLab.text = @"1";
        _numLab.text = @"×1";

    }else{
        _numbLab.text = numStr;
        _numLab.text = [NSString stringWithFormat:@"×%@",numStr];
        self.priceLab.text = [NSString stringWithFormat:@"合计¥:%d  ",([[self.contDic objectForKey:@"price"] integerValue]*count)];
        
    }

}
- (IBAction)touchUpInsurBtn:(id)sender {
}
- (IBAction)touchUpEpressBtn:(id)sender {
}
- (IBAction)touchUpFreightBtn:(id)sender {
}

@end
