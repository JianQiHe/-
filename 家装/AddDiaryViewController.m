//
//  AddDiaryViewController.m
//  家装
//
//  Created by  on 16/10/14.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "AddDiaryViewController.h"
#import "TZImagePickerController.h"

@interface AddDiaryViewController ()<UIScrollViewDelegate,UITextViewDelegate,UITextFieldDelegate,TZImagePickerControllerDelegate>{
    NSMutableArray *_photoArray;

}

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UITextField *titlefield;

@property (nonatomic, strong) UILabel *stageLabel;//阶段
@property (nonatomic, strong) UILabel *stageText;

@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UITextView *contentField;//内容

@property (nonatomic, strong) UIButton *selectImg;//选择图片
@property (nonatomic, strong) UILabel *imageLabel;


@property (nonatomic, strong) UIScrollView *scrollview;

@property (nonatomic, strong) UIButton *issueBtn;//发布

@end

@implementation AddDiaryViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    _photoArray = [NSMutableArray array];
    
    if (Height==480) {
        _scrollview = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, Width, Height)];
        _scrollview.delegate = self;
        [self.view addSubview:_scrollview];
        _scrollview.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _scrollview.showsHorizontalScrollIndicator = NO;
        _scrollview.contentSize = CGSizeMake(0, 1.2*Height);
        
    }else
    {
        _scrollview = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, Width, Height)];
        _scrollview.delegate = self;
        [self.view addSubview:_scrollview];
        _scrollview.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _scrollview.showsHorizontalScrollIndicator = NO;
        //        scr.contentSize = CGSizeMake(0, 0);
        _scrollview.contentSize = CGSizeMake(0, 1.2*Height);
        
    }
    [self createViews];
}

- (void)createViews{
    
    self.titleLabel = ({
        UILabel *label = [UILabel new];
        label.textAlignment = NSTextAlignmentLeft;
        label.text = @" 标题";
        label.backgroundColor = [UIColor whiteColor];
        label.textColor = [UIColor grayColor];
        label.layer.cornerRadius = 5;
        label.font = [UIFont boldSystemFontOfSize:15];
        [self.scrollview addSubview:label];
        label;
    });
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.scrollview.mas_top).offset(10);
        make.left.mas_equalTo(self.scrollview.mas_left).offset(10);
        make.size.mas_equalTo(CGSizeMake(Width - 20, 45));
    }];

    self.titlefield = ({
        UITextField *field = [UITextField new];
        field.textAlignment = NSTextAlignmentLeft;
        field.borderStyle = UITextBorderStyleNone;
//        field.backgroundColor = [UIColor redColor];
        field.delegate = self;
        field.textColor = [UIColor blackColor];
        field.font = [UIFont systemFontOfSize:15];
        [self.scrollview addSubview:field];
        field;
    });
    [self.titlefield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.left.mas_equalTo(50);
        make.size.mas_equalTo(CGSizeMake(Width - 60, 45));
    }];
    self.stageLabel = ({
        UILabel *label = [UILabel new];
        label.textAlignment = NSTextAlignmentLeft;
        label.text = @" 施工阶段";
        label.backgroundColor = [UIColor whiteColor];
        label.textColor = [UIColor grayColor];
        label.layer.cornerRadius = 5;
        label.font = [UIFont boldSystemFontOfSize:15];
        [self.scrollview addSubview:label];
        label;
    });
    [self.stageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(10);
        make.left.mas_equalTo(self.scrollview.mas_left).offset(10);
        make.size.mas_equalTo(CGSizeMake(Width - 20, 45));
    }];
    
    self.contentLabel = ({
        UILabel *contentLabel = [UILabel new];
        contentLabel.textAlignment = NSTextAlignmentLeft;
        contentLabel.text = @" 内容:";
        contentLabel.backgroundColor = [UIColor whiteColor];
        contentLabel.textColor = [UIColor grayColor];
        contentLabel.layer.cornerRadius = 5;
        contentLabel.font = [UIFont boldSystemFontOfSize:15];
        [self.scrollview addSubview:contentLabel];
        contentLabel;
    });
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.stageLabel.mas_bottom).offset(10);
        make.left.mas_equalTo(self.scrollview.mas_left).offset(10);
        make.size.mas_equalTo(CGSizeMake(40, 150));
        
    }];

    self.contentField = ({
        UITextView *contentField = [UITextView new];
        contentField.textAlignment = NSTextAlignmentLeft;
//        contentField.backgroundColor = [UIColor redColor];
        contentField.textColor = [UIColor blackColor];
        contentField.delegate = self;
        contentField.font = [UIFont systemFontOfSize:15];
        [self.scrollview addSubview:contentField];
        contentField;
    });
    [self.contentField mas_makeConstraints:^(MASConstraintMaker *make) {

        make.left.mas_equalTo(self.contentLabel.mas_right).offset(0);
        make.top.mas_equalTo(self.stageLabel.mas_bottom).offset(10);
        make.size.mas_equalTo(CGSizeMake(Width - 60, 150));


    }];
    
    self.selectImg = ({
        UIButton *selectImg = [UIButton new];
        [selectImg setTitle:@" 图片上传" forState:UIControlStateNormal];
        [selectImg setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        selectImg.backgroundColor = [UIColor whiteColor];
        selectImg.titleLabel.font = [UIFont systemFontOfSize:15];
        selectImg.titleLabel.textAlignment = 0;
        selectImg.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        selectImg.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        [selectImg addTarget:self action:@selector(selectImageAction) forControlEvents:UIControlEventTouchUpInside];
        [self.scrollview addSubview:selectImg];
        selectImg;
    });
    [self.selectImg mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.contentLabel.mas_bottom).offset(0);
        make.left.mas_equalTo(self.scrollview.mas_right).offset(10);
        make.size.mas_equalTo(CGSizeMake(Width - 20, 30));
        
    }];
    
    self.imageLabel = ({
        UILabel *imageLabel = [[UILabel alloc] init];
        imageLabel.backgroundColor = [UIColor whiteColor];
        [self.scrollview addSubview:imageLabel];
        imageLabel;
    });
    [self.imageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.selectImg.mas_bottom).offset(0);
        make.left.mas_equalTo(self.scrollview).offset(10);
        make.size.mas_equalTo(CGSizeMake(Width - 20, 0));
    }];
    
    self.issueBtn = ({
        UIButton *issueBtn = [UIButton new];
        issueBtn.layer.cornerRadius = 5;
        [issueBtn setTitle:@"发布" forState:UIControlStateNormal];
        issueBtn.backgroundColor = [UIColor redColor];
        [issueBtn addTarget:self action:@selector(touchUpIssueBtn:) forControlEvents:UIControlEventTouchUpInside];

        [self.scrollview addSubview:issueBtn];
        issueBtn;
    });

    [self.issueBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.imageLabel.mas_bottom).offset(30);
        make.left.mas_equalTo(self.scrollview.mas_left).offset(10);
        make.size.mas_equalTo(CGSizeMake(Width - 20, 40));
    }];
}

- (void)upDateView{
    [self.imageLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.selectImg.mas_bottom).offset(0);
        make.left.mas_equalTo(self.scrollview).offset(10);
        make.size.mas_equalTo(CGSizeMake(Width - 20, 65));
    }];

    
}

- (void)selectImageAction{
    [self.view endEditing:YES];
    
    TZImagePickerController *pickVC = [[TZImagePickerController alloc] initWithMaxImagesCount:9 delegate:self];
    pickVC.allowTakePicture = NO;
    [pickVC setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
        
        [_photoArray addObjectsFromArray:photos];
        
        for (int i = 0; i < [_photoArray count]; i++) {
            if (_photoArray.count > 3) {
                [_photoArray removeAllObjects];
                UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"照片最多选择3张" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
                [alertView show];
                
                return;
            }

            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * ((Width - 40)/3 + 5)+5, 5, (Width - 40)/3, 53)];
            imageView.image = [_photoArray objectAtIndex:i];
            imageView.tag = i;
            [self upDateView];
            [self.imageLabel addSubview:imageView];
            
        }
//        if (_photoArray.count > 0) {
////            choosefileLab.text = [NSString stringWithFormat:@"你已选择%lu个文件", (unsigned long)_photoArray.count];
//            
//        }
    }];
    [self presentViewController:pickVC animated:YES completion:nil];

}

#pragma mark UITextViewDelegate
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    
//    self.descTipField.hidden = YES;
    return YES;
}
- (void)textViewDidEndEditing:(UITextView *)textView{
    [self.view endEditing:YES];
    
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}
- (BOOL)textViewShouldEndEditing:(UITextView *)textView {
    
//    if ([self stringIsEmpty:textView.text]) {
    
//        self.descTipField.hidden = NO;
//    }
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.view endEditing:YES];
    return YES;
}

- (void)touchUpIssueBtn:(UIButton *)sender{
    [self.view endEditing:YES];


}
- (void)closeKeyBoard{
    [self.view endEditing:YES];
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
