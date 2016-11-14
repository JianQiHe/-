//
//  AppoinPViewController.m
//  家装
//
//  Created by 十月 on 16/11/10.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "AppoinPViewController.h"
#import "AppoinPTableViewCell.h"

@interface AppoinPViewController ()

@property (weak, nonatomic) IBOutlet UITableView *AppoinTableView;
@end

@implementation AppoinPViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 98;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *AppoinPTableViewCellIdentifier = @"AppoinPTableViewCellIdentifier";
    AppoinPTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:AppoinPTableViewCellIdentifier];
    if (cell == nil) {
        
        NSArray *nib = [[NSArray alloc]initWithArray:[[NSBundle mainBundle] loadNibNamed:@"AppoinPTableViewCell"
                                                                                   owner:self
                                                                                 options:nil]];
        for (id xib_ in nib) {
            
            if ([xib_ isKindOfClass:[AppoinPTableViewCell class]]) {
                
                cell = (AppoinPTableViewCell *)xib_;
                break;
            }
        }
    }
    
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor clearColor];
    
//    NSDictionary *dict = [cardMutArray objectAtIndex:indexPath.row];
//    if ([[dict objectForKey:@"cardType"] isEqualToString:@"1"]) {
//        if ([[dict objectForKey:@"actFlag"] isEqualToString:@"1"]) {
//            cell.bgImageView.image = [UIImage imageNamed:@"qinqinka"];
//            cell.moneyLabel.text = [NSString stringWithFormat:@"%@元", [dict objectForKey:@"fees"]];
//        }
//        if ([[dict objectForKey:@"actFlag"] isEqualToString:@"2"]) {
//            cell.bgImageView.image = [UIImage imageNamed:@"jifenka"];
//            cell.moneyLabel.text = [NSString stringWithFormat:@"%@积分", [dict objectForKey:@"fees"]];
//        }
//    }
//    if ([[dict objectForKey:@"cardType"] isEqualToString:@"2"]) {
//        cell.bgImageView.image = [UIImage imageNamed:@"jifenka"];
//        cell.moneyLabel.text = [NSString stringWithFormat:@"%@积分", [dict objectForKey:@"fees"]];
//    }
//    if ([[dict objectForKey:@"actFlag"] isEqualToString:@"2"]) {
//        cell.activityBtn.hidden = NO;
//        cell.arrowImageView.hidden = NO;
//        cell.drugNameLabel.frame = CGRectMake(30, 23, 196, 20);
//        cell.companyNameLabel.frame = CGRectMake(30, 37, 196, 20);
//        cell.lineImageView.frame = CGRectMake(15, 55, 290, 1);
//        cell.timeLabel.frame = CGRectMake(30, 60, 250, 20);
//        cell.detailBtn.frame = CGRectMake(252, 25, 48, 20);
//        cell.moneyLabel.frame = CGRectMake(202, 25, 57, 20);
//        cell.backImageView.frame = CGRectMake(202, 25, 98, 20);
//    }
//    [cell.activityBtn addTarget:self action:@selector(touchUpActivityButton:) forControlEvents:UIControlEventTouchUpInside];
//    cell.activityBtn.layer.cornerRadius = 5;
//    cell.drugNameLabel.text = [dict objectForKey:@"medName"];
//    cell.companyNameLabel.text = [dict objectForKey:@"entName"];
//    cell.timeLabel.text = [NSString stringWithFormat:@"有效日期：%@", [dict objectForKey:@"validity"]];
//    cell.applyLabel.text = [NSString stringWithFormat:@"剩余：%@张", [dict objectForKey:@"availableNums"]];
//    
//    cell.distribBtn.layer.cornerRadius = 6;
//    cell.distribBtn.layer.masksToBounds = YES;
//    
//    [cell.distribBtn setTag:indexPath.row];
//    [cell.distribBtn addTarget:self action:@selector(touchUpDistribButton:) forControlEvents:UIControlEventTouchUpInside];
//    
//    NSMutableArray *array = [NSMutableArray array];
//    for (int i = 1; i < 3; i++) {
//        NSString *str = [NSString stringWithFormat:@"jiantou%d.png",i];
//        UIImage *image = [UIImage imageNamed:str];
//        [array addObject:image];
//    }
//    cell.arrowImageView.animationImages = array;
//    cell.arrowImageView.animationDuration = 1.0f;
//    [cell.arrowImageView startAnimating];
//    
//    cell.detailBtn.tag = indexPath.row;
//    [cell.detailBtn addTarget:self action:@selector(touchUpDetailButton:) forControlEvents:UIControlEventTouchUpInside];
//    
    return cell;
}


@end
