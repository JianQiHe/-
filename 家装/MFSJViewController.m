//
//  MFSJViewController.m
//  家装
//
//  Created by mac on 16/6/21.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "MFSJViewController.h"
#import "TZImagePickerController.h"

@interface MFSJViewController ()<UIScrollViewDelegate> {

    UILabel *choosefileLab;
    NSMutableArray *_photoArray;
}

@end

@implementation MFSJViewController
{
    UIScrollView *scr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *arr = @[@"招标类型",@"装修预算",@"装修面积",@"小区名称",@"所在地区",@"详细地址",@"备注要求"];
    self.view.backgroundColor = [UIColor whiteColor];
    
    _photoArray = [NSMutableArray array];
    
    
    
    
    if (Height==480) {
        scr = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, Width, Height)];
        scr.delegate = self;
        [self.view addSubview:scr];
        scr.backgroundColor = [UIColor groupTableViewBackgroundColor];
        scr.showsHorizontalScrollIndicator = NO;
        scr.contentSize = CGSizeMake(0, 1.2*Height);
        
    }else
    {
        scr = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, Width, Height)];
        scr.delegate = self;
        [self.view addSubview:scr];
        scr.backgroundColor = [UIColor groupTableViewBackgroundColor];
        scr.showsHorizontalScrollIndicator = NO;
        scr.contentSize = CGSizeMake(0, 0);
    }
    
    
    
    UILabel *name = [[UILabel alloc]initWithFrame:CGRectMake(10, 20, 60, 40)];
    name.font = [UIFont systemFontOfSize:13];
    name.textAlignment = 2;
    NSMutableAttributedString *noteStr2 = [[NSMutableAttributedString alloc] initWithString:@"      ＊姓名"];
    NSRange redRange2 = NSMakeRange([[noteStr2 string] rangeOfString:@"＊"].location, [[noteStr2 string] rangeOfString:@"＊"].length);
    [noteStr2 addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:redRange2];
    [name setAttributedText:noteStr2];
    [name sizeToFit];
    [scr addSubview:name];
    
    UILabel *phone = [[UILabel alloc]initWithFrame:CGRectMake(5, 60, 65, 40)];
    phone.font = [UIFont systemFontOfSize:13];
#pragma mark -----------------label上的字符部分改变颜色-----------------------
    NSMutableAttributedString *noteStr = [[NSMutableAttributedString alloc] initWithString:@"＊联系电话"];
    NSRange redRange = NSMakeRange([[noteStr string] rangeOfString:@"＊"].location, [[noteStr string] rangeOfString:@"＊"].length);
    [noteStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:redRange];
    [phone setAttributedText:noteStr];
    [phone sizeToFit];
    phone.textAlignment = 2;
    [scr addSubview:phone];
    
    for (int i = 0; i<7; i++ ) {
        UILabel *lab = [[UILabel alloc]init];
        [scr addSubview:lab];
        lab.font = [UIFont systemFontOfSize:13];
        lab.tag = i;
        lab.text = arr[i];
        lab.textAlignment = 2;
        lab.frame = CGRectMake(10, 10+80+i*40, 60, 40);
    }
    
    for (int i= 0; i<9; i++) {
        UITextField *textfield = [[UITextField alloc]init];
        textfield.backgroundColor = [UIColor whiteColor];
        [scr addSubview:textfield];
        textfield.tag = 10+i;
        textfield.layer.cornerRadius = 5;
        textfield.frame = CGRectMake(75, 10+i*40, Width-90, 30);
        if (i==8) {
            textfield.frame = CGRectMake(75, 10+40*8, Width-90, 70);
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    UITextField *cangzao = [self.view viewWithTag:18];//
#pragma mark -----------------底部布局-----------------------
    UIButton *chooseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [chooseBtn setTitle:@"选择文件" forState:UIControlStateNormal];
    chooseBtn.backgroundColor = [UIColor orangeColor];
    [chooseBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [chooseBtn addTarget:self action:@selector(selectChooseBtn) forControlEvents:UIControlEventTouchUpInside];
    chooseBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    chooseBtn.layer.cornerRadius = 7;
    [scr addSubview:chooseBtn];
    [chooseBtn mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(cangzao.mas_bottom).offset(10);
        make.left.equalTo(cangzao.mas_left).offset(-40);
        make.width.equalTo(@80);
        make.height.equalTo(@20);
    }];
    
    choosefileLab = [[UILabel alloc]init];
    [scr addSubview:choosefileLab];
    choosefileLab.text = @"未选择任何文件";
    choosefileLab.font = [UIFont systemFontOfSize:12];
    [choosefileLab mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(chooseBtn.mas_top);
        make.left.equalTo(chooseBtn.mas_right).offset(10);
        make.width.equalTo(@100);
        make.height.equalTo(chooseBtn.mas_height);
    }];
    
    
    UILabel *shuoming = [[UILabel alloc]init];
    [scr addSubview:shuoming];
    shuoming.text = @"上传户型图，报价更准确，并可提前一天获取报价方案！";
    shuoming.font = [UIFont systemFontOfSize:10];
    shuoming.textColor = [UIColor darkGrayColor];
    shuoming.textAlignment = 0;
    [shuoming mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(chooseBtn.mas_bottom).offset(5);
        make.left.equalTo(chooseBtn.mas_left).offset(10);
        make.right.equalTo(self.view.mas_right);//
        make.height.equalTo(@15);
    }];
    
    
    
    UIButton *fabu = [UIButton buttonWithType:UIButtonTypeCustom];
    [fabu setTitle:@"免费发布招标" forState:UIControlStateNormal];
    [fabu addTarget:self action:@selector(releaseBtn) forControlEvents:UIControlEventTouchUpInside];
    fabu.backgroundColor = [UIColor orangeColor];
    [fabu setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    fabu.titleLabel.font = [UIFont systemFontOfSize:12];
    fabu.layer.cornerRadius = 7;
    [scr addSubview:fabu];
    [fabu mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(shuoming.mas_bottom).offset(10);
        make.left.equalTo(chooseBtn.mas_left);
        make.width.equalTo(@80);
        make.height.equalTo(@25);
    }];
    
    
    
    UILabel *bodalab = [[UILabel alloc]init];
    [scr addSubview:bodalab];
    bodalab.text = @"或拨打";
    bodalab.font = [UIFont systemFontOfSize:14];
    bodalab.textColor = [UIColor darkGrayColor];
    bodalab.textAlignment = 0;
    [bodalab mas_makeConstraints:^(MASConstraintMaker *make){
        make.bottom.equalTo(fabu.mas_bottom).offset(-2);
        make.left.equalTo(fabu.mas_right).offset(5);
        make.width.equalTo(@50);
        make.height.equalTo(@15);
    }];
    
    
    UILabel *haomalab = [[UILabel alloc]init];
    [scr addSubview:haomalab];
    haomalab.text = @"4009993809";
    haomalab.font = [UIFont systemFontOfSize:20];
    haomalab.textColor = [UIColor orangeColor];
    haomalab.textAlignment = 0;
    haomalab.numberOfLines = 0;//根据最大行数需求来设置
    haomalab.lineBreakMode = NSLineBreakByTruncatingTail;
    [haomalab mas_makeConstraints:^(MASConstraintMaker *make){
        make.bottom.equalTo(bodalab.mas_bottom);
        make.left.equalTo(bodalab.mas_right).offset(1);
        make.height.equalTo(@15);
    }];
    
    // Do any additional setup after loading the view.
}

#pragma mark - 选择文件
- (void)selectChooseBtn{
    
    TZImagePickerController *pickVC = [[TZImagePickerController alloc] initWithMaxImagesCount:9 delegate:self];
    pickVC.allowTakePicture = NO;
    [pickVC setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
        
        [_photoArray addObjectsFromArray:photos];
        if (_photoArray.count > 0) {
            choosefileLab.text = [NSString stringWithFormat:@"你已选择%lu个文件", (unsigned long)_photoArray.count];
        }
    }];
    [self presentViewController:pickVC animated:YES completion:nil];
}

#pragma mark - 免费发布
- (void)releaseBtn{
    
    NSMutableArray *textArray = [NSMutableArray array];
    for (int i = 0; i < 9; i++) {
        UITextField *textfield = (UITextField *)[self.view viewWithTag:10 + i];
        [textArray addObject:[NSString stringWithFormat:@"%@", textfield.text]];
    }
    NSLog(@"%@", textArray);
    
    if (_photoArray.count > 0) {
        
    }else {
        [MBProgressHUD showSuccess:@"请选择文件!"];
    }
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
