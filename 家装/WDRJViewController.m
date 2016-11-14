//
//  WDRJViewController.m
//  家装
//
//  Created by mac on 16/5/13.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "WDRJViewController.h"
#import "Masonry.h"
#import "TPXQViewController.h"
#import "WDRJTableViewCell.h"
#import "AddDiaryViewController.h"

@interface WDRJViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation WDRJViewController
{
    NSData *data;
    NSMutableDictionary *dict;
    int a;
    NSMutableArray *arr;//创建日期
    UITableView *tbView;

    
    NSString *UidStr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
     self.navigationItem.title = @"我的日记";
    tbView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tbView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    tbView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tbView];
    tbView.delegate = self;
    tbView.dataSource = self;
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor orangeColor];
    [btn addTarget:self action:@selector(addDiary) forControlEvents:UIControlEventTouchUpInside];
    [tbView addSubview:btn];
    btn.layer.cornerRadius = 20.0;
    [btn setImage:[UIImage imageNamed:@"组-5"] forState:UIControlStateNormal];
    btn.layer.shadowOffset = CGSizeMake(1, 1);
    btn.layer.shadowOpacity = 0.8;
    [btn mas_makeConstraints:^(MASConstraintMaker *make){
        make.bottom.equalTo(self.view.mas_bottom).offset(-20);
        make.height.equalTo(@40);
        make.width.equalTo(@40);
        make.centerX.equalTo(self.view.mas_centerX);
    }];

    
    
    
 //我的日记
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *Dic = [userDefaults objectForKey:@"User"];
    UidStr = Dic[@"data"][0][@"uid"];
    
    NSString *str=[NSString stringWithFormat:@"http://jiazhuang.siruoit.com/index.php?api/api-diary/%@/1",UidStr];

    NSURL *url = [NSURL URLWithString:[str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];                        // UTF－8
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc]initWithRequest:request];
    // 请求数据，设置成功与失败的回调函数
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSString *html = operation.responseString;
        data=[html dataUsingEncoding:NSUTF8StringEncoding];
        dict = [NSMutableDictionary dictionaryWithDictionary:[NSJSONSerialization  JSONObjectWithData:data options:0 error:nil]];
        NSLog(@"获取到的数据为1111：%@",dict);

        a =(int)[dict[@"data"] count];
        arr = [[NSMutableArray alloc]init];
        for (int i=0; i<a; i++) {
            //创建日期
            NSString *timestr = dict[@"data"][i][@"dateline"];
            NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
            [formatter setDateStyle:NSDateFormatterMediumStyle];
            [formatter setTimeStyle:NSDateFormatterShortStyle];
            [formatter setDateFormat:@"yyyy-MM-dd-HH:mm:ss"];//@"yyyy-MM-dd-HHMMss"
            NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timestr doubleValue]];
            NSString *dateString = [formatter stringFromDate:date];
            
            [arr addObject:dateString];

           
        }
        [tbView reloadData];

    }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"发生错误！%@",error);
    }];
    // 加入队列
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperation:operation];

    
    

    // Do any additional setup after loading the view.
}

#pragma mark- 添加日记
- (void)addDiary{
    
    AddDiaryViewController *addDiaryComtroller = [[AddDiaryViewController alloc] init];
    addDiaryComtroller.hidesBottomBarWhenPushed = YES;
    addDiaryComtroller.navigationItem.title = @"发表日记";
    [self.navigationController pushViewController:addDiaryComtroller animated:YES];
    
    
    
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return a;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 145;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"WDRJTableViewCell";
    WDRJTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell)
    {
        cell = [[WDRJTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    
    cell.backgroundColor = [UIColor groupTableViewBackgroundColor];
    cell.selectionStyle = NO;
    
    
    cell.lab1.text = dict[@"data"][indexPath.row][@"title"];
    
    
    NSString *string = [NSString stringWithFormat:@"%@至%@",dict[@"data"][indexPath.row][@"start_date"],dict[@"data"][indexPath.row][@"end_date"]];
    cell.lab2.text = string;
    
    
    NSString *string2 =[NSString stringWithFormat:@"装修方式:%@",dict[@"data"][indexPath.row][@"way"]];
    cell.lab3.text = string2;
    
    NSString *string3 = [NSString stringWithFormat:@"空间户型:%@",dict[@"data"][indexPath.row][@"type"]];
    cell.lab4.text =string3;
    
    
    
    
    NSString *string4 = [NSString stringWithFormat:@"http://jiazhuang.siruoit.com/%@",dict[@"data"][indexPath.row][@"thumb"]];
    [cell.imgV1  sd_setImageWithURL:[NSURL URLWithString:string4] placeholderImage:[UIImage imageNamed:@"shouyelunbotu"]];

    NSString *string5 = [NSString stringWithFormat:@"小区:%@",dict[@"data"][indexPath.row][@"home_name"]];
    cell.lab5.text = string5;
    
    
    NSString *string6 = [NSString stringWithFormat:@"城市:%@",dict[@"data"][indexPath.row][@"city"]];
    cell.lab6.text = string6;
    
    NSString *string7 = [NSString stringWithFormat:@"发布时间:%@",arr[indexPath.row]];
    cell.lab7.text = string7;
    
    if (dict[@"data"][indexPath.row][@"audit"]== 0) {
        cell.lab8.text = @"未审核";
    }else
        cell.lab8.text = @"已审核";
    
    
    [cell.imgV1 setUserInteractionEnabled:YES];
    UITapGestureRecognizer *TPXQ=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(toTPXQ)];
    [cell.imgV1 addGestureRecognizer:TPXQ];
    return cell;
    
}
-(void)toTPXQ
{
    self.hidesBottomBarWhenPushed = YES;
    TPXQViewController *view = [[TPXQViewController alloc]init];
    [self.navigationController pushViewController:view animated:YES];
}


#pragma mark -----------------左滑删除-----------------------

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}
-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
//    NSArray *arr = @[@{},@{},@"2"];
//    
//    NSDictionary *dic = @{@"data":arr,@"2":arr1};
//    NSMutableArray *mmm = arr;
//    [mmm removeObjectAtIndex:0];
//    mmm = @[@"234",@"2"];
//    [dic setValue:mmm forKey:@"data"];
    
    
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        
        NSString *diarystr = dict[@"data"][indexPath.row][@"diary_id"];
        
        NSString *str1=[NSString stringWithFormat:@"http://jiazhuang.siruoit.com/index.php?api/api-diary/%@/%@",UidStr,diarystr];
        
        NSURL *url1 = [NSURL URLWithString:[str1 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];                        // UTF－8
        NSURLRequest *request1 = [NSURLRequest requestWithURL:url1];
        AFHTTPRequestOperation *operation1 = [[AFHTTPRequestOperation alloc]initWithRequest:request1];
        // 请求数据，设置成功与失败的回调函数
        [operation1 setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSString *html1 = operation.responseString;
           NSData *data1=[html1 dataUsingEncoding:NSUTF8StringEncoding];
           NSDictionary *dict1 = [NSMutableDictionary dictionaryWithDictionary:[NSJSONSerialization  JSONObjectWithData:data1 options:0 error:nil]];
            NSLog(@"删除信息%@",dict1[@"data"]);
            

            
        }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"发生错误！%@",error);
        }];
        // 加入队列
        NSOperationQueue *queue = [[NSOperationQueue alloc] init];
        [queue addOperation:operation1];

        
        
        
        
        
        

        NSMutableArray *arr1 = [[NSMutableArray alloc] initWithArray:dict[@"data"]];
        NSLog(@"arr==%@",arr1);
        [arr1 removeObjectAtIndex:indexPath.row];
        [dict setValue:arr1 forKey:@"data"];
//        [tableView deleteRowsAtIndexPaths:@[indexPath]withRowAnimation:UITableViewRowAnimationAutomatic];
        a = (int)[dict[@"data"] count];
        [tbView reloadData];
    }
    else
    {
//        [dict[@"data"] addObject:@100];
//        NSIndexPath *newIndexPath = [NSIndexPath indexPathForRow:[dict[@"data"] count ] - 1 inSection:0];
//        [tableView insertRowsAtIndexPaths:@[newIndexPath]withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}


//- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    UITableViewRowAction *likeAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"喜欢" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
//        // 实现相关的逻辑代码
//        // ...
//        // 在最后希望cell可以自动回到默认状态，所以需要退出编辑模式
//        tableView.editing = NO;
//    }];
//    UITableViewRowAction *deleteAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
//        // 首先改变model
//
//        [dict[@"data"] removeObjectAtIndex:dict[@"data"][indexPath.row]];
//        // 接着刷新view
//        [tbView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
//        // 不需要主动退出编辑模式，上面更新view的操作完成后就会自动退出编辑模式
//    }];
//    return @[deleteAction, likeAction];
//}
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
