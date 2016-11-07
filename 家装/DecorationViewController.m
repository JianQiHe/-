//
//  DecorationViewController.m
//  家装
//
//  Created by 十月 on 16/10/21.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "DecorationViewController.h"
#import "NJRequsets.h"


@interface DecorationViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *imgScrollView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *depositLabel;//保证金
@property (weak, nonatomic) IBOutlet UILabel *telNumlabe;
@property (weak, nonatomic) IBOutlet UIImageView *telImage;
@property (weak, nonatomic) IBOutlet UILabel *prestigeLabel;//信用
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *stateLabel;//案例

@property (weak, nonatomic) IBOutlet UIButton *bidBtn;//招标
@property (weak, nonatomic) IBOutlet UIButton *appointBtn;



@end

@implementation DecorationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self dataSource];

}

- (void)dataSource{
    
    self.depositLabel.layer.cornerRadius = 3;
    self.depositLabel.clipsToBounds = YES;
    self.titleLabel.text = [NSString stringWithFormat:@"%@",[_dicSource objectForKey:@"title"]];
    self.telNumlabe.text = [NSString stringWithFormat:@"%@",[_dicSource objectForKey:@"phone"]];
    self.addressLabel.text = [NSString stringWithFormat:@"地址:%@",[_dicSource objectForKey:@"addr"]];
    //http://jiazhuang.siruoit.com/attachs/photo/201512/20151215_B4D0DDB4273A567C51FBEE1C4BCB5F31.png
//    201512/20151215_55464EC164B74BA45460009A027D0148.jpg"
    //[1]	(null)	@"logo" : @"photo/201512/20151215_B4D0DDB4273A567C51FBEE1C4BCB5F31.png"
//    NSString *imagVStr = [NSString stringWithFormat:@"%@%@",PhotoUrl,[_dicSource objectForKey:@"logo"]];
//    [ sd_setImageWithURL:[NSURL URLWithString:imagVStr] placeholderImage:nil];
    UIImageView *imageView= [[UIImageView alloc]init];
    imageView.backgroundColor = [UIColor redColor];
    NSString *imgS = [NSString stringWithFormat:@"%@%@",PhotoUrl,[_dicSource objectForKey:@"thumb"]];
    
    [imageView sd_setImageWithURL:[NSURL URLWithString:imgS] placeholderImage:nil];
    [_imgScrollView addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.imgScrollView.mas_right).offset(0);
        make.left.equalTo(self.imgScrollView.mas_left).offset(0);
        make.top.equalTo(self.imgScrollView.mas_top).offset(0);
        make.bottom.equalTo(self.imgScrollView.mas_bottom).offset(0);

    }];
    
    [self.telImage setImage:[UIImage imageNamed:@"tellimg"]];
    NSString *case_num = [_dicSource objectForKey:@"case_num"];
    NSString *site_num = [_dicSource objectForKey:@"site_num"];
    NSString *yuyue_num = [_dicSource objectForKey:@"yuyue_num"];

    self.stateLabel.text = [NSString stringWithFormat:@"案例:%@ 在建工地:%@ 签单人数:%@ 预约人数:%@",case_num,site_num,site_num,yuyue_num];
    self.prestigeLabel.text = [NSString stringWithFormat:@"%@",[_dicSource objectForKey:@"score"]];
    
}


- (IBAction)touchUpBidBtnAction:(id)sender {
}
- (IBAction)touchUpAppointBtnAction:(id)sender {
}



@end
