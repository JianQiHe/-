//
//  DesignTableViewCell.m
//  家装
//
//  Created by mac on 16/8/4.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "DesignTableViewCell.h"

@implementation DesignTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self CreatDesignTableViewCell];
    }
    return  self;
}
-(void)CreatDesignTableViewCell
{
    DesignTableViewCell *cell = self;
    

    
    self.namelab = [[UILabel alloc]init];
    self.namelab.textColor = [UIColor blackColor];
    self.namelab.font = [UIFont systemFontOfSize:15];
    self.namelab.textAlignment = 0;
    [cell addSubview:self.namelab];
    [self.namelab mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(cell.mas_left).offset(10);
        make.top.equalTo(cell.mas_top).offset(10);
        make.width.equalTo(@50);
        make.height.equalTo(@15);
        
    }];
    
    
    self.qqlab = [[UILabel alloc]init];
    self.qqlab.textColor = [UIColor redColor];
    self.qqlab.font = [UIFont systemFontOfSize:13];
    self.qqlab.textAlignment = 1;
    [cell addSubview:self.qqlab];
    [self.qqlab mas_makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(cell.mas_right).offset(-10);
        make.bottom.equalTo(self.namelab.mas_bottom);
        make.width.equalTo(@120);
        make.height.equalTo(@15);
    }];
    

    //预约
    self.yuyue = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.yuyue setTitle:@"免费预约" forState:UIControlStateNormal];
    [self.yuyue setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.yuyue.backgroundColor = [UIColor redColor];
    self.yuyue.titleLabel.font = [UIFont systemFontOfSize:15];
    [cell addSubview:self.yuyue];
    [self.yuyue mas_makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(cell.mas_right).offset(-5);
        make.bottom.equalTo(cell.mas_bottom).offset(-5);
        make.width.equalTo(@70);
        make.height.equalTo(@20);
    }];
    
    
    UIView *view2 = [[UIView alloc]init];
    [cell addSubview:view2];
    view2.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [view2 mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.namelab.mas_bottom).offset(5);
        make.left.equalTo(cell.mas_left);
        make.right.equalTo(cell.mas_right);
        make.height.equalTo(@80);
    }];
    
    
    
    
    //左边图片部分
    self.imagV = [[UIImageView alloc]initWithFrame:CGRectMake(10, 5, 70, 70)];
    self.imagV.backgroundColor = [UIColor darkGrayColor];
    [view2 addSubview:self.imagV];
    // 右边评分部分
#pragma mark -----------------分数条-----------------------
    
    
    
    //设计
    
    self.designscorelab = [[UILabel alloc]init];
    self.designscorelab.textColor = [UIColor grayColor];
    self.designscorelab.font = [UIFont systemFontOfSize:10];
    [view2 addSubview:self.designscorelab];
    [self.designscorelab mas_makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(view2.mas_right).offset(-1);
        make.top.equalTo(self.imagV.mas_top).offset(5);
        make.width.equalTo(@20);
        make.height.equalTo(@15);
    }];
    
    UILabel *scorelab = [[UILabel alloc]init];
    scorelab.backgroundColor = [UIColor grayColor];
    scorelab.layer.cornerRadius = 3;
    scorelab.clipsToBounds = YES;
    [view2 addSubview:scorelab];
    [scorelab mas_makeConstraints:^(MASConstraintMaker *make){
        make.width.equalTo(@80);
        make.height.equalTo(@7);
        make.right.equalTo(self.designscorelab.mas_left).offset(-1);
        make.bottom.equalTo(self.designscorelab.mas_bottom).offset(-4);
    }];
    

    self.scorelab2 = [[UILabel alloc]init];
    self.scorelab2.backgroundColor = [UIColor redColor];
    self.scorelab2.layer.cornerRadius = 3;
    self.scorelab2.clipsToBounds = YES;
    [scorelab addSubview:self.scorelab2];

    
    UILabel *design = [[UILabel alloc]init];
    design.text = @"设计：";
    design.textColor = [UIColor redColor];
    design.font = [UIFont systemFontOfSize:10];
    [view2 addSubview:design];
    [design mas_makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(scorelab.mas_left).offset(-1);
        make.bottom.equalTo(scorelab.mas_bottom).offset(2);
        make.width.equalTo(@35);
        make.height.equalTo(@10);
    }];
    
    
    
    
    
    
    //服务
    self.servescorelab = [[UILabel alloc]init];
    //取出lab的值
    int b = [self.servescorelab.text intValue];
    self.servescorelab.textColor = [UIColor grayColor];
    self.servescorelab.font = [UIFont systemFontOfSize:10];
    [view2 addSubview:self.servescorelab];
    [self.servescorelab mas_makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(self.designscorelab.mas_right);
        make.top.equalTo(self.designscorelab.mas_bottom).offset(10);
        make.width.equalTo(@20);
        make.height.equalTo(@15);
    }];
    
    UILabel *servelab = [[UILabel alloc]init];
    servelab.backgroundColor = [UIColor grayColor];
    servelab.layer.cornerRadius = 3;
    servelab.clipsToBounds = YES;
    [view2 addSubview:servelab];
    [servelab mas_makeConstraints:^(MASConstraintMaker *make){
        make.width.equalTo(@80);
        make.height.equalTo(@7);
        make.right.equalTo(self.servescorelab.mas_left).offset(-1);
        make.bottom.equalTo(self.servescorelab.mas_bottom).offset(-4);
    }];
    

    self.servelab2 = [[UILabel alloc]init];
    self.servelab2.backgroundColor = [UIColor redColor];
    self.servelab2.layer.cornerRadius = 3;
    self.servelab2.clipsToBounds = YES;
    [servelab addSubview:self.servelab2];

    
    
    UILabel *serve = [[UILabel alloc]init];
    serve.text = @"服务：";
    serve.textColor = [UIColor redColor];
    serve.font = [UIFont systemFontOfSize:10];
    [view2 addSubview:serve];
    [serve mas_makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(servelab.mas_left).offset(-1);
        make.bottom.equalTo(servelab.mas_bottom).offset(2);
        make.width.equalTo(@35);
        make.height.equalTo(@10);
    }];
    
    
    // 贴心
    
    
    self.tiexinscorelab = [[UILabel alloc]init];
    self.tiexinscorelab.textColor = [UIColor grayColor];
    self.tiexinscorelab.font = [UIFont systemFontOfSize:10];
    [view2 addSubview:self.tiexinscorelab];
    [self.tiexinscorelab mas_makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(self.servescorelab.mas_right);
        make.top.equalTo(self.servescorelab.mas_bottom).offset(10);
        make.width.equalTo(@20);
        make.height.equalTo(@15);
    }];
    
    UILabel *tiexinlab = [[UILabel alloc]init];
    tiexinlab.backgroundColor = [UIColor grayColor];
    tiexinlab.layer.cornerRadius = 3;
    tiexinlab.clipsToBounds = YES;
    [view2 addSubview:tiexinlab];
    [tiexinlab mas_makeConstraints:^(MASConstraintMaker *make){
        make.width.equalTo(@80);
        make.height.equalTo(@7);
        make.right.equalTo(self.tiexinscorelab.mas_left).offset(-1);
        make.bottom.equalTo(self.tiexinscorelab.mas_bottom).offset(-4);
    }];
    
 
    self.tiexinlab2 = [[UILabel alloc]init];
    self.tiexinlab2.backgroundColor = [UIColor redColor];
    self.tiexinlab2.layer.cornerRadius = 3;
    self.tiexinlab2.clipsToBounds = YES;
    [tiexinlab addSubview:self.tiexinlab2];

    
    
    UILabel *tiexin = [[UILabel alloc]init];
    tiexin.text = @"贴心：";
    tiexin.textColor = [UIColor redColor];
    tiexin.font = [UIFont systemFontOfSize:10];
    [view2 addSubview:tiexin];
    [tiexin mas_makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(tiexinlab.mas_left).offset(-1);
        make.bottom.equalTo(tiexinlab.mas_bottom).offset(2);
        make.width.equalTo(@35);
        make.height.equalTo(@10);
    }];
    
    
    
    
    
    
    
    
#pragma mark -----------------中间部分-----------------------
    //中间部分
    
    self.School = [[UILabel alloc]init];
    self.School.textColor = [UIColor grayColor];
    self.School.font = [UIFont systemFontOfSize:11];
    self.School.lineBreakMode = NSLineBreakByTruncatingTail;
    [view2 addSubview:self.School];
    [self.School mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.imagV.mas_right).offset(2);
        make.top.equalTo(self.imagV.mas_top);
        make.right.equalTo(serve.mas_left).offset(-5);
        make.height.equalTo(@15);
    }];
    
    
    
    
    
    
    
    self.anli = [[UILabel alloc]init];
    self.anli.textColor = [UIColor grayColor];
    self.anli.font = [UIFont systemFontOfSize:11];
    self.anli.lineBreakMode = NSLineBreakByTruncatingTail;
    [view2 addSubview:self.anli];
    [self.anli mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.School.mas_left);
        make.top.equalTo(self.School.mas_bottom).offset(7);
        make.height.equalTo(@10);
        make.right.equalTo(serve.mas_left).offset(-5);
    }];

    
    self.mobile = [[UILabel alloc]init];
    self.mobile.textColor = [UIColor grayColor];
    self.mobile.font = [UIFont systemFontOfSize:11];
    self.mobile.lineBreakMode = NSLineBreakByTruncatingTail;
    [view2 addSubview:self.mobile];
    [self.mobile mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.imagV.mas_right).offset(2);
        make.top.equalTo(self.anli.mas_bottom).offset(7);
        make.right.equalTo(serve.mas_left).offset(-5);
        make.height.equalTo(@10);
    }];
    
    
    
    
    self.SJLN = [[UILabel alloc]init];
    self.SJLN.textColor = [UIColor grayColor];
    self.SJLN.font = [UIFont systemFontOfSize:11];
    self.SJLN.lineBreakMode = NSLineBreakByTruncatingTail;
    [view2 addSubview:self.SJLN];
    [self.SJLN mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.School.mas_left);
        make.top.equalTo(self.mobile.mas_bottom).offset(7);
        make.height.equalTo(@10);
        make.right.equalTo(serve.mas_left).offset(-5);
    }];
    
    
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
