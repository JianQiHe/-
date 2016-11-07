//
//  WDWDViewController.m
//  家装
//
//  Created by mac on 16/5/14.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "WDWDViewController.h"
#import "WDWDTableViewCell.h"
@interface WDWDViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation WDWDViewController
{
    NSData *data;
    id dict;
    int a;
    NSMutableArray *arr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UITableView *tabview = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tabview.separatorStyle = UITableViewCellSeparatorStyleNone;
    tabview.backgroundColor = [UIColor groupTableViewBackgroundColor];
    tabview.delegate = self;
    tabview.dataSource = self;
    [self.view addSubview:tabview];

    
    
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *Dic = [userDefaults objectForKey:@"User"];
    NSString *UidStr = Dic[@"data"][0][@"uid"];

    
    
    NSString *str=[NSString stringWithFormat:@"http://jiazhuang.siruoit.com/index.php?api/api-ask/%@/1",UidStr];
    
    NSURL *url = [NSURL URLWithString:[str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];                        // UTF－8
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc]initWithRequest:request];
        // 请求数据，设置成功与失败的回调函数
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSString *html = operation.responseString;
            data=[html dataUsingEncoding:NSUTF8StringEncoding];
            dict=[NSJSONSerialization  JSONObjectWithData:data options:0 error:nil];
        NSLog(@"%@",dict);
        a =(int)[dict[@"data"] count];
        
        
        arr = [[NSMutableArray alloc]init];
        for (int i=0; i<a; i++) {
            NSString *timestr = dict[@"data"][i][@"dateline"];
            NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
            [formatter setDateStyle:NSDateFormatterMediumStyle];
            [formatter setTimeStyle:NSDateFormatterShortStyle];
            [formatter setDateFormat:@"yyyy-MM-dd-HH:mm:ss"];//@"yyyy-MM-dd-HHMMss"
            NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timestr doubleValue]];
            NSString *dateString = [formatter stringFromDate:date];
            [arr addObject:dateString];
//            NSLog(@"dateString%@",dateString);
        }
       

        [tabview reloadData];
        }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"发生错误！%@",error);
        }];
        // 加入队列
        NSOperationQueue *queue = [[NSOperationQueue alloc] init];
        [queue addOperation:operation];
    
    // Do any additional setup after loading the view.
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return a;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"WDWDTableViewCell";
    WDWDTableViewCell *Cell = [[WDWDTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    if (!Cell) {
        Cell = [[WDWDTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    Cell.backgroundColor = [UIColor clearColor];
    Cell.selectionStyle = NO;
    Cell.lab.text = dict[@"data"][indexPath.row][@"title"];//标题
    Cell.lab2.text =arr[indexPath.row];//问答时间
    NSString *string1 = [NSString stringWithFormat:@"查看次数%@",dict[@"data"][indexPath.row][@"views"]];
    Cell.lab3.text = string1;//浏览次数
    
    NSString *string2 = [NSString stringWithFormat:@"回答次数%@",dict[@"data"][indexPath.row][@"answer_num"]];
    Cell.lab4.text = string2;//回答次数
    
    NSString *string3 = dict[@"data"][indexPath.row][@"audit"];
    if ( string3==0 ) {
        Cell.lab5.text = @"问题已审核";
    }else
        Cell.lab5.text = @"问题未审核";
    
        return Cell;
    

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
