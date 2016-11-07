//
//  ShopDetailsViewController.m
//  家装
//
//  Created by mac on 16/5/25.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ShopDetailsViewController.h"
#import "Masonry.h"
#import "ShopDetailCollectionViewCell.h"
#import "ShopDetailHeaderCollectionReusableView.h"
#import "NJRequsets.h"
#import "MJRefresh.h"
@interface ShopDetailsViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (strong,nonatomic)UICollectionView *collection;
@end

@implementation ShopDetailsViewController
{
    NSDictionary *dict1;
    UIView *backgroundView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"店铺";
//    NSLog(@"shop_id%@",self.shop_idStr);
//    NSLog(@"vcat_id%@",self.vcat_idStr);
    self.view.backgroundColor = [UIColor whiteColor];

    
    backgroundView.hidden = YES;
    //=======================1===========================
    //创建一个块状表格布局对象
    UICollectionViewFlowLayout *flowL = [UICollectionViewFlowLayout new];
    //格子的大小 (长，高)
    //    flowL.itemSize =CGSizeMake(70,30);
    //横向最小距离
    
        flowL.minimumInteritemSpacing =5.f;
        flowL.minimumLineSpacing=5.f;//代表的是纵向的空间间隔
    //设置，上／左／下／右边距 空间间隔数是多少
    
    flowL.sectionInset =UIEdgeInsetsMake(5,5,5,5);
    //如果有多个区 就可以拉动
    [flowL setScrollDirection:UICollectionViewScrollDirectionVertical];
    //可以左右拉动
    //    [flowL setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    
#pragma mark -- 头尾部大小设置
    //设置头部并给定大小
    [flowL setHeaderReferenceSize:CGSizeMake(self.collection.frame.size.width,15)];
    //设置尾部并给定大小
    //    [flowL setFooterReferenceSize:CGSizeMake(self.collection.frame.size.width,15)];
    
    
    
    self.collection=[[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, Width, Height) collectionViewLayout:flowL];
    self.collection.dataSource=self;
    self.collection.delegate=self;
    [self.collection setBackgroundColor:[UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1]];
    
    //注册Cell，必须要有
    [self.collection registerClass:[ShopDetailCollectionViewCell class] forCellWithReuseIdentifier:@"ShopDetailCollectionViewCell"];
    [self.collection registerClass:[ShopDetailHeaderCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    [self.view addSubview:self.collection];
    
    
    [self wangluoqingqiu];
#pragma mark -----------------MJRefreh-----------------------
    
    self.collection.mj_header=[MJRefreshNormalHeader headerWithRefreshingBlock: ^ {
        //调用此块。当进入刷新状态自动
        [self wangluoqingqiu];
    }];
    
    self.collection.mj_footer =[MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        
        [self wangluoqingqiu];
        // 进入刷新状态后会自动调用这个block
        
    }];
    
    // Do any additional setup after loading the view.
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((Width-15)/2, 130);
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [dict1[@"items"] count];
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"ShopDetailCollectionViewCell";
    
    
    //赋值在这里赋值
    ShopDetailCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSString *imgaVStr = [NSString stringWithFormat:@"%@%@",PhotoUrl,dict1[@"items"][indexPath.row][@"photo"]];
    [cell.imgaV sd_setImageWithURL:[NSURL URLWithString:imgaVStr] placeholderImage:nil];
    
    cell.titlelab.text = dict1[@"items"][indexPath.row][@"title"];
    
    NSString *price_labStr = [NSString stringWithFormat:@"¥%@",dict1[@"items"][indexPath.row][@"price"]];
    cell.price_lab.text = price_labStr;
    
    NSString *marketprice_labStr = [NSString stringWithFormat:@"¥%@",dict1[@"items"][indexPath.row][@"market_price"]];
    cell.marketprice_lab.text = marketprice_labStr;
    cell.backgroundColor = [UIColor whiteColor];
        return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    
    return CGSizeMake(Width, 150);
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    
    UICollectionReusableView *reusableView =nil;
    
    if (kind ==UICollectionElementKindSectionHeader) {
        
        ShopDetailHeaderCollectionReusableView *headerV = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
        
        [headerV.imgv2 sd_setImageWithURL:[NSURL URLWithString:self.shopImagvStr] placeholderImage:nil];
        
        headerV.name.text = self.shopNameStr;

        reusableView = headerV;
    }
    
    return reusableView;
}
-(void)wangluoqingqiu
{

    NSString *str=[NSString stringWithFormat:@"http://jiazhuang.siruoit.com/index.php?api/api-shopproduct-%@-%@-1",self.shop_idStr,self.vcat_idStr];

    NSURL *url = [NSURL URLWithString:[str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];                        // UTF－8
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc]initWithRequest:request];
    // 请求数据，设置成功与失败的回调函数
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSString *html = operation.responseString;
        NSData* data=[html dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *dict=[NSJSONSerialization  JSONObjectWithData:data options:0 error:nil];
        NSLog(@"获取到的数据为1111：%@",dict);

        dict1 = [[NSDictionary alloc]initWithDictionary:dict[@"data"][1] ];

        if ([dict1[@"items"]count]==0) {
            [self ifNoData];
        }

        NSLog(@"dict1%@",dict1);
        [self.collection reloadData];
        [self.collection.mj_header endRefreshing];
        [self.collection.mj_footer endRefreshing];

    }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"发生错误！%@",error);
    }];
    // 加入队列
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperation:operation];
}
-(void)ifNoData
{
    
    backgroundView = [[UIView alloc]initWithFrame:CGRectMake(0, 150, Width, Height-150)];
    [self.collection addSubview:backgroundView];
    backgroundView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    
    UIImageView *imagV =[[UIImageView alloc]init];
    imagV.image = [UIImage imageNamed:@"哭"];
    [backgroundView addSubview:imagV];
    [imagV mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(backgroundView.mas_left).offset((Width-80)/2);
        make.right.equalTo(backgroundView.mas_right).offset(-(Width-80)/2);
        make.top.equalTo(backgroundView.mas_top).offset(100);
        make.height.equalTo(@80);
    }];
    
    
    UILabel *lab = [[UILabel alloc]init];
    [backgroundView addSubview:lab];
    lab.text = @"该店铺还没有商品";
    lab.textAlignment = 1;
    lab.font = [UIFont systemFontOfSize:15];
    lab.backgroundColor = [UIColor clearColor];
    [lab mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(imagV.mas_left).offset(-50);
        make.right.equalTo(imagV.mas_right).offset(50);
        make.top.equalTo(imagV.mas_bottom).offset(5);
        make.height.equalTo(@15);
    }];
    
    
    
    UILabel *label1 = [[UILabel alloc]init];
    [backgroundView addSubview:label1];
    label1.text = @"可以先去别的地方看看";
    label1.textAlignment = 1;
    label1.font = [UIFont systemFontOfSize:10];
    label1.textColor = [UIColor lightGrayColor];
    label1.backgroundColor = [UIColor clearColor];
    [label1 mas_makeConstraints:^(MASConstraintMaker *make){
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
