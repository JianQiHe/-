//
//  GroupShopViewController.m
//  家装
//
//  Created by mac on 16/6/30.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "GroupShopViewController.h"
#import "GroupShopCollectionViewCell.h"
#import "MJRefresh.h"
#import "NJRequsets.h"
#import "GroupShopDetailViewController.h"
@interface GroupShopViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate>
@property (strong, nonatomic)UICollectionView *collectionView;

@end

@implementation GroupShopViewController
{
    NSDictionary *dict1;//items
    NSDictionary *dict2;//home_list
}


- (void)viewDidLoad {
    [super viewDidLoad];

    //确定是水平滚动，还是垂直滚动
    self.title = @"团装优惠";
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    self.collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, Width, Height) collectionViewLayout:flowLayout];
    self.collectionView.dataSource=self;
    self.collectionView.delegate=self;
    [self.collectionView setBackgroundColor:[UIColor clearColor]];
    
    //注册Cell，必须要有
    [self.collectionView registerClass:[GroupShopCollectionViewCell class] forCellWithReuseIdentifier:@"GroupShopCollectionViewCell"];
    [self.view addSubview:self.collectionView];

    [self wangluoqingqiu];
    
    
#pragma mark -----------------MJRefreh-----------------------
    
    self.collectionView.mj_header=[MJRefreshNormalHeader headerWithRefreshingBlock: ^ {
        //调用此块。当进入刷新状态自动
        [self wangluoqingqiu];
    }];
    
    self.collectionView.mj_footer =[MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        
        [self wangluoqingqiu];
        // 进入刷新状态后会自动调用这个block
        
    }];



    // Do any additional setup after loading the view.
}


#pragma mark -- UICollectionViewDataSource

//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [dict2[@"home_list"] count];
}

//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"GroupShopCollectionViewCell";
    
    
    //赋值在这里赋值
    GroupShopCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    NSString *imagVStr = [NSString stringWithFormat:@"%@%@",PhotoUrl,dict2[@"home_list"][indexPath.row][@"thumb"]];
    [cell.imagev sd_setImageWithURL:[NSURL URLWithString:imagVStr] placeholderImage:nil];
    cell.nameLab.text = dict1[@"items"][indexPath.row][@"title"];
    cell.lab.text = @"立省";
    NSString *moneyStr = [NSString stringWithFormat:@"¥%@",dict1[@"items"][indexPath.row][@"jieyue"]];
    cell.Moneylab.text =moneyStr;
    NSString *signStr = [NSString stringWithFormat:@"%@人已参团",dict1[@"items"][indexPath.row][@"sign_num"]];
    cell.Peoplelab.text = signStr;
    
    [cell.btn setTitle:@"已结束" forState:UIControlStateNormal];
    [cell.btn addTarget:self action:@selector(toSignup) forControlEvents:UIControlEventTouchUpInside];
    [cell.btn setBackgroundColor:[UIColor grayColor]];
    
    
    
    return cell;
}
-(void)toSignup
{
    UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"活动已结束，下次早点来哦！～" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [myAlertView show];
}
#pragma mark --UICollectionViewDelegateFlowLayout

//定义每个Item 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(Width/2, 160);
}

//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}
//cell没个之间的行距离和列距离
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    
    return 0;
}





-(void)wangluoqingqiu
{
    
    NSString *str=[NSString stringWithFormat:@"http://jiazhuang.siruoit.com/index.php?api/api-tuan"];
    
    NSURL *url = [NSURL URLWithString:[str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];                        // UTF－8
    NSLog(@"url：%@", url);
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc]initWithRequest:request];
    // 请求数据，设置成功与失败的回调函数
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSString *html = operation.responseString;
        NSData *data=[html dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *dict=[NSJSONSerialization  JSONObjectWithData:data options:0 error:nil];
        
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:nil];
        NSString *str = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        //            NSLog(@"返回的数据：%@", dict);
        NSLog(@"Json:%@", str);
        
        dict1 = [NSDictionary dictionaryWithDictionary:dict[@"data"][0]];
        dict2 = [NSDictionary dictionaryWithDictionary:dict[@"data"][1]];

        [_collectionView reloadData];
        [self.collectionView.mj_header endRefreshing];
        [self.collectionView.mj_footer endRefreshing];

        NSLog(@"count%ld",[dict1[@"items"] count]);
        NSLog(@"count%ld",[dict2[@"home_list"]count]);
    }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"发生错误！%@",error);
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"错误" message:@"服务器数据异常" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        
        [myAlertView show];
    }];
    // 加入队列
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperation:operation];
    
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    self.hidesBottomBarWhenPushed = YES;
    GroupShopDetailViewController *view = [[GroupShopDetailViewController alloc]init];
    view.dict1 = dict1;
    view.dict2 = dict2;
    view.NumberStr = [NSString stringWithFormat:@"%ld",indexPath.row];
    [self.navigationController pushViewController:view animated:YES];
    NSLog(@"row=======%ld",indexPath.row);
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
