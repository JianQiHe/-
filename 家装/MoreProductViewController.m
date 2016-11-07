//
//  MoreProductViewController.m
//  家装
//
//  Created by mac on 16/7/12.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "MoreProductViewController.h"
#import "MoreProductCollectionViewCell.h"
#import "ProductDetailViewController.h"
#import "MJRefresh.h"
@interface MoreProductViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@end

@implementation MoreProductViewController
{
    NSMutableDictionary *dict;
    
    
    UIView *backgroundView;
    NSMutableDictionary *dict2;
    int k;
    NSMutableArray *arrs;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    k = 1;

    //确定是水平滚动，还是垂直滚动
    if ([self.StatStr isEqualToString:@"0"]) {
        self.title = @"更多";
    }else
    {
        self.title = @"分类";
    }
    
    arrs = [[NSMutableArray alloc] init];

    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    self.collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, Width, Height) collectionViewLayout:flowLayout];
    self.collectionView.dataSource=self;
    self.collectionView.delegate=self;
    [self.collectionView setBackgroundColor:[UIColor clearColor]];
    
    //注册Cell，必须要有
    [self.collectionView registerClass:[MoreProductCollectionViewCell class] forCellWithReuseIdentifier:@"MoreProductCollectionViewCell"];
    [self.view addSubview:self.collectionView];
    
    [self Productlist];
    #pragma mark -----------------MJRefreh-----------------------

    self.collectionView.mj_header=[MJRefreshNormalHeader headerWithRefreshingBlock: ^ {
        //调用此块。当进入刷新状态自动
        k=1;
        [arrs removeAllObjects];
        [self Productlist];
    }];
    
    self.collectionView.mj_footer =[MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        
        [self moredata];
        // 进入刷新状态后会自动调用这个block
        
    }];
    

    // Do any additional setup after loading the view.
}

-(void)Productlist
{
    
    
        NSString *str=[NSString stringWithFormat:@"http://jiazhuang.siruoit.com/index.php?api/api-product/%@-%d",self.Cat_idStr,k];
        NSURL *url = [NSURL URLWithString:[str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];                        // UTF－8
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc]initWithRequest:request];
        // 请求数据，设置成功与失败的回调函数
        [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSString *html = operation.responseString;
            NSData *data=[html dataUsingEncoding:NSUTF8StringEncoding];
            dict = [NSMutableDictionary dictionaryWithDictionary:[NSJSONSerialization  JSONObjectWithData:data options:0 error:nil]];

            
            NSLog(@"获取到的数据为1111：%@",dict);

            if ([dict[@"data"]count]==0)
            {
                [self ifNoData];
                dict[@"data"] = arrs;
            }else
            {
             if([dict[@"data"]count ]!=0)
              {
            

            for (int b = 0; b<[dict[@"data"] count]; b++)
                 {
                [arrs addObject:dict[@"data"][b]];
                 }


            dict[@"data"] = arrs;
                    
                        
            
              }
            }
            [self.collectionView.mj_header endRefreshing];
            [self.collectionView.mj_footer endRefreshing];
            [self.collectionView reloadData];
    
        }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"发生错误！%@",error);
        }];
        // 加入队列
        NSOperationQueue *queue = [[NSOperationQueue alloc] init];
        [queue addOperation:operation];
}

//-(void)Productlist2
//{
//    
//    
//    NSString *str=[NSString stringWithFormat:@"http://jiazhuang.siruoit.com/index.php?api/api-product/%@-%d",self.Cat_idStr,k];
//    NSURL *url = [NSURL URLWithString:[str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];                        // UTF－8
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc]initWithRequest:request];
//    // 请求数据，设置成功与失败的回调函数
//    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSString *html = operation.responseString;
//        NSData *data=[html dataUsingEncoding:NSUTF8StringEncoding];
//        dict2 = [NSMutableDictionary dictionaryWithDictionary:[NSJSONSerialization  JSONObjectWithData:data options:0 error:nil]];
//        
//        
//    //一般我不用字典来存这些，都是用nsmutablearray dict[@"data"]  但是你非要这样也可以
//        
//        if ([dict2[@"data"]count ]!=0) {
//            
//            NSMutableArray *arrs = [[NSMutableArray alloc] initWithArray:dict[@"data"]];
//            
//            for (int b = 0; b<[dict2[@"data"] count]; b++) {
//                [arrs addObject:dict2[@"data"][b]];
//            }
//            
//            
//            dict[@"data"] = arrs;
//            
//            
//
//        }
//        [self.collectionView.mj_footer endRefreshing];
//
//         [self.collectionView reloadData];
//        
//    }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"发生错误！%@",error);
//    }];
//    // 加入队列
//    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
//    [queue addOperation:operation];
//}
-(void)moredata
{
    int i = (int)[dict[@"data"] count]/(20*k);
    if (i==1) {
        k++;
        [self Productlist];
    }else
    {
        [self.collectionView.mj_footer endRefreshing];
    }
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [dict[@"data"] count];
}

//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"MoreProductCollectionViewCell";
    
    
    //赋值在这里赋值
    MoreProductCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if ([dict[@"data"] count]!=0) {
        NSString *imagVStr = [NSString stringWithFormat:@"http://jiazhuang.siruoit.com/attachs/%@",dict[@"data"][indexPath.row][@"photo"]];
        [cell.imagV sd_setImageWithURL:[NSURL URLWithString:imagVStr] placeholderImage:[UIImage imageNamed:@"imagV1"]];
        cell.titlelab.text = dict[@"data"][indexPath.row][@"title"];
        NSString *priceStr = [NSString stringWithFormat:@"¥%@",dict[@"data"][indexPath.row][@"price"]];
        cell.pricelab.text = priceStr;
        NSString *market_priceStr = [NSString stringWithFormat:@"¥%@",dict[@"data"][indexPath.row][@"market_price"]];
        cell.market_pricelab.text = market_priceStr;
        cell.citylab.text = dict[@"data"][indexPath.row][@"city"];
    }

    return cell;
}



#pragma mark --UICollectionViewDelegateFlowLayout

//定义每个Item 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((Width-15)/2, 150);
}

//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}

#pragma mark --UICollectionViewDelegate

//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{

    self.hidesBottomBarWhenPushed = YES;
    NSString *productidStr = dict[@"data"][indexPath.row][@"product_id"];
    ProductDetailViewController *view = [[ProductDetailViewController alloc]init];
    view.product_idStr = productidStr;
    [self.navigationController pushViewController:view animated:YES];
    NSLog(@"row=======%ld",indexPath.row);
}

////返回这个UICollectionView是否可以被选择
//-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    return YES;
//}
//cell没个之间的行距离和列距离
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 5;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    
    return 5;
}


-(void)ifNoData
{
    [self.collectionView removeFromSuperview];
    backgroundView = [[UIView alloc]initWithFrame:CGRectMake(0, 84, Width, Height-84)];
    [self.view addSubview:backgroundView];
    backgroundView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    
    UIImageView *imagV =[[UIImageView alloc]init];
    imagV.image = [UIImage imageNamed:@"订单"];
    [backgroundView addSubview:imagV];
    [imagV mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(backgroundView.mas_left).offset((Width-80)/2);
        make.right.equalTo(backgroundView.mas_right).offset(-(Width-80)/2);
        make.top.equalTo(backgroundView.mas_top).offset((backgroundView.frame.size.height-80)/2);
        make.height.equalTo(@80);
    }];
    
    
    UILabel *lab = [[UILabel alloc]init];
    [backgroundView addSubview:lab];
    lab.text = @"没有更多的商品辣";
    lab.textAlignment = 1;
    lab.font = [UIFont systemFontOfSize:15];
    lab.backgroundColor = [UIColor clearColor];
    [lab mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(imagV.mas_left).offset(-40);
        make.right.equalTo(imagV.mas_right).offset(40);
        make.top.equalTo(imagV.mas_bottom).offset(5);
        make.height.equalTo(@15);
    }];
    
    
    
    UILabel *label = [[UILabel alloc]init];
    [backgroundView addSubview:label];
    label.text = @"去别的地方看看吧!~";
    label.textAlignment = 1;
    label.font = [UIFont systemFontOfSize:10];
    label.textColor = [UIColor lightGrayColor];
    label.backgroundColor = [UIColor clearColor];
    [label mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(imagV.mas_left).offset(-30);
        make.right.equalTo(imagV.mas_right).offset(30);
        make.top.equalTo(lab.mas_bottom).offset(5);
        make.height.equalTo(@15);
    }];
    
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
