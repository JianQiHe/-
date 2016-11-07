//
//  YHHDViewController.m
//  家装
//
//  Created by mac on 16/6/30.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "YHHDViewController.h"
#import "YHHDTableViewCell.h"
#import "NJRequsets.h"
#import "MJRefresh.h"
@interface YHHDViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation YHHDViewController
{
    NSMutableDictionary *dict;
    UITableView *tabView;
    int a ;
    NSMutableArray *arr1;
    NSMutableArray *arr2;

    int b;//比较时间的返回值
    NSString *timeString;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"优惠活动";
    tabView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, Width, Height) style:UITableViewStylePlain];
    [self.view addSubview:tabView];
    tabView.delegate = self;
    tabView.dataSource = self;
    tabView.separatorStyle = NO;
//    tabView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tabView.backgroundColor = [UIColor whiteColor];
    [self wangluoqingqiu];
    //获取系统时间
//    NSDate *nowDate = [NSDate date];
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
//    dateFormatter.dateFormat = @"YYYY-MM-dd";
//    NSString *locationDate = [[NSString alloc]init];
//    locationDate = [dateFormatter stringFromDate:nowDate];
//    NSLog(@"当前时间%@",locationDate);
    
    
    //获取系统时间戳
    NSDate* date1 = [NSDate date];
    NSTimeInterval time1 =[date1 timeIntervalSince1970];
    timeString = [NSString stringWithFormat:@"%.0f",time1];
    NSLog(@"系统时间戳:%@",timeString);
    
    
    tabView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self wangluoqingqiu];
    }];
    
    tabView.mj_footer =[MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        
        // 进入刷新状态后会自动调用这个block
        [self wangluoqingqiu];
    }];

    // Do any additional setup after loading the view.
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return [dict[@"data"][1][@"activity"]count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *Cell = @"YHHDCell";
    YHHDTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Cell];
    if (!cell)
    {
        cell = [[YHHDTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Cell];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.label.text=dict[@"data"][1][@"activity"][indexPath.row][@"title"];
    
    NSString *imagVStr = [NSString stringWithFormat:@"%@%@",PhotoUrl,dict[@"data"][1][@"activity"][indexPath.row][@"thumb"]];
    [cell.imagV sd_setImageWithURL:[NSURL URLWithString:imagVStr] placeholderImage:[UIImage imageNamed:@"youhuihuodong"]];
    NSString *bgStr = [NSString stringWithFormat:@"活动时间：%@",arr1[indexPath.row]];
    cell.lab.text = bgStr;
    
    NSString *endStr = [NSString stringWithFormat:@"结束时间：%@",arr2[indexPath.row]];
    cell.lab2.text = endStr;
    
    NSString *addressStr = [NSString stringWithFormat:@"活动地点：%@",dict[@"data"][1][@"activity"][indexPath.row][@"addr"]];
    cell.lab3.text = addressStr;
    
    NSString *phoneStr = [NSString stringWithFormat:@"客服电话:%@",dict[@"data"][1][@"activity"][indexPath.row][@"phone"]];
    cell.lab4.text = phoneStr;
    
    NSString *sign_numStr = [NSString stringWithFormat:@"报名人数：%@",dict[@"data"][1][@"activity"][indexPath.row][@"sign_num"]];
    cell.lab5.text = sign_numStr;
    b =[self compareDate:timeString withDate:dict[@"data"][1][@"activity"][indexPath.row][@"end_time"]];
    if (b<0) {
        [cell.btn setTitle:@"立即报名" forState:UIControlStateNormal];
        [cell.btn setBackgroundColor:[UIColor colorWithRed:0.124 green:0.690 blue:0.495 alpha:1.000]];
        [cell.btn addTarget:self action:@selector(toSignUp) forControlEvents:UIControlEventTouchUpInside];
        
    }else
    {
        [cell.btn addTarget:self action:@selector(toSignUp) forControlEvents:UIControlEventTouchUpInside];
        [cell.btn setTitle:@"报名结束" forState:UIControlStateNormal];
        [cell.btn setBackgroundColor:[UIColor grayColor]];
    }
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)wangluoqingqiu
{
    
        NSString *str=[NSString stringWithFormat:@"http://jiazhuang.siruoit.com/index.php?api/api-activity/2/1"];
    
        NSURL *url = [NSURL URLWithString:[str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];                        // UTF－8
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc]initWithRequest:request];
        // 请求数据，设置成功与失败的回调函数
        [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            NSString *string = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
            NSData *jsonData = [string dataUsingEncoding:NSUTF8StringEncoding];
            NSError *err;
            dict = [NSJSONSerialization JSONObjectWithData:jsonData
                                                                options:NSJSONReadingMutableContainers
                
                                                                  error:&err];
            
            
            
            
            a =(int)[dict[@"data"][1][@"activity"]count];
            arr1 = [[NSMutableArray alloc]init];
            arr2 = [[NSMutableArray alloc]init];

            for (int i=0; i<a; i++) {
                //创建日期
                NSString *timestr1 = dict[@"data"][1][@"activity"][i][@"bg_time"];
                NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
                [formatter setDateStyle:NSDateFormatterMediumStyle];
                [formatter setTimeStyle:NSDateFormatterShortStyle];
                [formatter setDateFormat:@"yyyy-MM-dd"];//@"yyyy-MM-dd-HHMMss"
                NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timestr1 doubleValue]];
                NSString *dateString = [formatter stringFromDate:date];
                
                [arr1 addObject:dateString];
                
                
                NSString *timestr2 = dict[@"data"][1][@"activity"][i][@"end_time"];
                NSDateFormatter* formatter2 = [[NSDateFormatter alloc] init];
                [formatter2 setDateStyle:NSDateFormatterMediumStyle];
                [formatter2 setTimeStyle:NSDateFormatterShortStyle];
                [formatter2 setDateFormat:@"yyyy-MM-dd"];//@"yyyy-MM-dd-HHMMss"
                NSDate* date2 = [NSDate dateWithTimeIntervalSince1970:[timestr2 doubleValue]];
                NSString *dateString2 = [formatter stringFromDate:date2];
                
                [arr2 addObject:dateString2];

                
            }
            
            
            
            
            
            
            [tabView reloadData];
            [tabView.mj_header endRefreshing];
            [tabView.mj_footer endRefreshing];

//            NSLog(@"----%lu",[dict[@"data"][1][@"activity"]count]);
//            NSLog(@"--------%@",dict);
            if(err) {
                NSLog(@"json解析失败：%@",err);
            }
            
            
            
            

        }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"发生错误！%@",error);
            UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"错误" message:@"服务器数据异常" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
            
            [myAlertView show];
        }];
        // 加入队列
        NSOperationQueue *queue = [[NSOperationQueue alloc] init];
        [queue addOperation:operation];
}
-(void)toSignUp
{
    UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"活动已结束，下次早点来哦！～" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [myAlertView show];

}
-(int)compareDate:(NSString*)startDate withDate:(NSString*)endDate{
    
//    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    [formatter setDateFormat:@"yyyy-MM-dd"];
//    NSDate *date1 = [[NSDate alloc] init];
//    NSDate *date2 = [[NSDate alloc] init];
//    date1 = [formatter dateFromString:startDate];
//    date2 = [formatter dateFromString:endDate];
    NSComparisonResult result = [startDate compare:endDate];
    if (result == NSOrderedDescending) {
        //NSLog(@"startDate比 endDate时间晚");
        return 1;
    }
    else if (result == NSOrderedAscending){
        //NSLog(@"startDate比 endDate时间早");
        return -1;
    }
    //NSLog(@"两者时间是同一个时间");
    return 0;
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
