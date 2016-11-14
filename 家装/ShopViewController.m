//
//  ShopViewController.m
//  家装
//
//  Created by mac on 16/5/3.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ShopViewController.h"
#import "SCSPXQViewController.h"
#import "ShopClassTableViewCell.h"
#import "ShopClassCollectionViewCell.h"
#import "ShopScrollViewTableViewCell.h"
#import "MoreProductViewController.h"
#import "MJRefresh.h"
#import "FirstProductdetail.h"
#import "ShopClassCollectionHeaderVIew.h"
#import "MoreProductViewController.h"
@interface ShopViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate, UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
//@property (nonatomic, strong)UIButton *rightBtn;//右按钮
@property (nonatomic,weak)UIView *view1;//分类
@property (nonatomic, strong)UITableView *tbView;

@end

@implementation ShopViewController
{
    UIScrollView *sc;
    UIPageControl *pc;
    UIView *headerView;
    UISegmentedControl *segmentedControl;
    
    
    

    
    NSMutableDictionary *dict;//Shoplist
    NSMutableDictionary *dict2;//productlist
    NSMutableArray *cad_idMArr;//shoplist cad_id
//    NSString *cat_idStr;
    NSMutableArray *datas;
    UIActivityIndicatorView *testActivityIndicator;//菊花
    
    
    
    UITableView *TabView;
    UICollectionView *collectionview;
    
    
    NSDictionary *allClassdic;
    NSMutableDictionary *allClassdic1;

    int k;// Tableview 点击不同的cell 刷新分类collectionview
    NSIndexPath *selectindexPath;
}
//ShopClass
-(UIView *)view1
{
    if (_view1 == nil) {
        UIView *view = [[UIView alloc]init];
        view.frame = CGRectMake(0, 64, Width, Height-64);
        view.backgroundColor = [UIColor whiteColor];
        _view1 = view;
        [self.view addSubview:_view1];
        
        //左边的TabView
        TabView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, Width/10*3, Height-64-44) style:UITableViewStylePlain];
        TabView.delegate = self;
        TabView.dataSource = self;
        TabView.showsVerticalScrollIndicator = NO;
        TabView.separatorStyle = UITableViewCellSeparatorStyleNone;
//        TabView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [_view1 addSubview:TabView];
        
        //右边的CollectionView
        UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
        collectionview=[[UICollectionView alloc] initWithFrame:CGRectMake(Width/10*3, 0, Width/10*7, Height-64-44) collectionViewLayout:flowLayout];
        collectionview.dataSource=self;
        collectionview.delegate=self;
        [collectionview setBackgroundColor:[UIColor clearColor]];
        [collectionview registerClass:[ShopClassCollectionViewCell class] forCellWithReuseIdentifier:@"ShopClassCollectionViewCell"];
        [collectionview registerClass:[ShopClassCollectionHeaderVIew class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
        [self.view1 addSubview:collectionview];

    }
    return _view1;
}






- (void)viewDidLoad {
    [super viewDidLoad];
    
    k=0;
    selectindexPath= [NSIndexPath indexPathForRow:0 inSection:0];
    self.tbView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tbView.delegate = self;
    self.tbView.dataSource = self;
    [self initTableHeaderView];
    self.tbView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.tbView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tbView];

    sc = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
    sc.delegate = self;
    UIImageView *img1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0,sc.frame.size.width , 200)];
    img1.image = [UIImage imageNamed:@"商城轮播2"];
    [sc addSubview:img1];
    
    UIImageView *img2 = [[UIImageView alloc]initWithFrame:CGRectMake(Width, 0,Width, 200)];
    img2.image = [UIImage imageNamed:@"商城轮播2"];
    [sc addSubview:img2];
    
    sc.showsHorizontalScrollIndicator = NO;
    sc.contentSize = CGSizeMake(2*sc.frame.size.width,0);
    [headerView addSubview:sc];
    sc.pagingEnabled = YES;
    pc = [[UIPageControl alloc]initWithFrame:CGRectMake(sc.frame.size.width/2-25, sc.frame.size.height-25, 50, 30)];
    pc.numberOfPages = 2;
    
    
    //计时器
    NSTimer *timer = [NSTimer timerWithTimeInterval:5 target:self selector:@selector(timer) userInfo:nil repeats:YES];
    NSRunLoop *runloop = [NSRunLoop currentRunLoop];
    [runloop addTimer:timer forMode:NSDefaultRunLoopMode];
    [headerView addSubview:pc];

    
    
    
    
    #pragma mark -----------------SegmentedController-----------------------
    NSArray *segmentedArray = [NSArray arrayWithObjects:@"商城",@"分类",nil];
    segmentedControl = [[UISegmentedControl alloc]initWithItems:segmentedArray];
    segmentedControl.frame = CGRectMake(0.0, 0.0, 120, 30.0);
    segmentedControl.selectedSegmentIndex = 0;
    segmentedControl.tintColor = [UIColor whiteColor];
//    segmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;
    [segmentedControl addTarget:self  action:@selector(indexDidChangeForSegmentedControl)
               forControlEvents:UIControlEventValueChanged];
    //方法1
    //[self.navigationController.navigationBar.topItem setTitleView:segmentedControl];
    //方法2
    [self.navigationItem setTitleView:segmentedControl];
    
    
    
    [self Shoplist];

    
    [self allClass];
    
    
    self.tbView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self Shoplist];
        
    }];
    
    
    
    //默认选中第一个
//    NSInteger selectedIndex = 0;
//    NSIndexPath *selectedIndexPath = [NSIndexPath indexPathForRow:selectedIndex inSection:0];
//    
//    [TabView selectRowAtIndexPath:selectedIndexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
    #pragma mark -----------------右边按钮-----------------------
    
    //右边按钮
//    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithCustomView:self.rightBtn];
//    
//    [self.navigationItem setRightBarButtonItem:rightBarButton];
    
    

    // Do any additional setup after loading the view.
}
#pragma mark -----------------segmented-----------------------
-(void)indexDidChangeForSegmentedControl
{
    
    switch (segmentedControl.selectedSegmentIndex) {
        case 0:
            [self.view1 removeFromSuperview];
            [self.view addSubview:self.tbView];
            break;
        case 1:
            [self view1];
            [self.tbView removeFromSuperview];
            break;
        default:
            break;
    }
}

//- (UIButton *)rightBtn
//{
//    if (_rightBtn == nil) {
//        _rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(180, 0, 60, 30)];
//        [_rightBtn setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
//        [_rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//        [_rightBtn setTitle:@"搜索" forState:UIControlStateNormal];
//    }
//    return _rightBtn;
//}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView==TabView) {
        return [allClassdic[@"data"]count];
    }
    else{

        return  [dict[@"data"] count];
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView==TabView){
        return 50;
  }else
          return 170;
}





-(void)initTableHeaderView
{
    headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,200)];
    headerView.backgroundColor = [UIColor whiteColor];
    self.tbView.tableHeaderView = headerView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView ==TabView)
    {
        static NSString * CellIdentifier = @"ShopClassTableviewCell";
        ShopClassTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (!cell)
        {
            cell = [[ShopClassTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        if (indexPath==selectindexPath) {
            cell.backgroundColor = [UIColor whiteColor];
        }else{

            cell.backgroundColor = [UIColor colorWithRed:0.970 green:0.944 blue:0.976 alpha:1.000];
        }
        cell.lab.text = allClassdic[@"data"][indexPath.row][@"title"];

        return cell;
    }
    else
    {

            static NSString *CellIndentifier = @"ShopScrollVIewTableViewCell";
            ShopScrollViewTableViewCell *Cell = [tableView dequeueReusableCellWithIdentifier:CellIndentifier];
            if (!Cell)
            {

                Cell = [[ShopScrollViewTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIndentifier];
            }
        
        Cell.selectionStyle = UITableViewCellSelectionStyleNone;//取消高亮
        Cell.Shoplistlab.text = dict[@"data"][indexPath.row][@"title"];
        Cell.backgroundColor = [UIColor whiteColor];
        Cell.selectionStyle = UITableViewCellSelectionStyleNone;//取消高亮
        Cell.scr.delegate = self;
        
        __weak typeof(self) wself = self;
        Cell.whenClick = ^(ShopScrollViewTableViewCell *cell){
          
            NSIndexPath *row = [tableView indexPathForCell:cell];
            NSLog(@"%@",dict[@"data"][row.row][@"cat_id"]);
            MoreProductViewController *vc = [[MoreProductViewController alloc] init];
            vc.hidesBottomBarWhenPushed = YES;
            vc.Cat_idStr = dict[@"data"][row.row][@"cat_id"];
            vc.StatStr = @"0";
            [wself.navigationController pushViewController:vc animated:YES];
        };
        

        if (datas.count > indexPath.row) {
            
            if ([datas[indexPath.row][@"data"] count] != 0)
            {
                
                
                
                NSString *imagV1Str1 = [NSString stringWithFormat:@"http://jiazhuang.siruoit.com/attachs/%@",datas[indexPath.row][@"data"][0][@"photo"]];
                [Cell.imgV1 sd_setImageWithURL:[NSURL URLWithString:imagV1Str1] placeholderImage:[UIImage imageNamed:@"imagV1"]];
                Cell.imgV1.userInteractionEnabled = YES;
                __weak typeof(self) self1 = self;
                Cell.imgV1Click = ^(ShopScrollViewTableViewCell *cell){
                    
                    NSIndexPath *row = [tableView indexPathForCell:cell];
                    NSLog(@"row====%ld",(long)row.row);
                    FirstProductdetail *vc = [[FirstProductdetail alloc] init];
                    vc.Cat_Str = dict[@"data"][row.row][@"cat_id"];
                    vc.Number = [NSString stringWithFormat:@"0"];
                    vc.hidesBottomBarWhenPushed = YES;
                    [self1.navigationController pushViewController:vc animated:YES];
                };
                
                
                
                
                NSString *imagV1Str2 = [NSString stringWithFormat:@"http://jiazhuang.siruoit.com/attachs/%@",datas[indexPath.row][@"data"][1][@"photo"]];
                [Cell.imgV2 sd_setImageWithURL:[NSURL URLWithString:imagV1Str2] placeholderImage:[UIImage imageNamed:@"imagV2"]];
                Cell.imgV2.userInteractionEnabled = YES;
                __weak typeof(self) self2 = self;
                Cell.imgV2Click = ^(ShopScrollViewTableViewCell *cell){
                    
                    NSIndexPath *row = [tableView indexPathForCell:cell];
                    NSLog(@"row====%ld",(long)row.row);
                    FirstProductdetail *vc = [[FirstProductdetail alloc] init];
                    vc.Cat_Str = dict[@"data"][row.row][@"cat_id"];
                    vc.Number = [NSString stringWithFormat:@"1"];
                    vc.hidesBottomBarWhenPushed = YES;
                    [self2.navigationController pushViewController:vc animated:YES];
                };
                
                
                
                NSString *imagV1Str3 = [NSString stringWithFormat:@"http://jiazhuang.siruoit.com/attachs/%@",datas[indexPath.row][@"data"][2][@"photo"]];
                [Cell.imgV3 sd_setImageWithURL:[NSURL URLWithString:imagV1Str3] placeholderImage:[UIImage imageNamed:@"imagV3"]];
                Cell.imgV3.userInteractionEnabled = YES;
                __weak typeof(self) self3 = self;
                Cell.imgV3Click = ^(ShopScrollViewTableViewCell *cell){
                    
                    NSIndexPath *row = [tableView indexPathForCell:cell];
                    NSLog(@"row====%ld",(long)row.row);
                    FirstProductdetail *vc = [[FirstProductdetail alloc] init];
                    vc.Cat_Str = dict[@"data"][row.row][@"cat_id"];
                    vc.Number = [NSString stringWithFormat:@"2"];
                    vc.hidesBottomBarWhenPushed = YES;
                    [self3.navigationController pushViewController:vc animated:YES];
                };
                
                
                
                
                NSString *imagV1Str4 = [NSString stringWithFormat:@"http://jiazhuang.siruoit.com/attachs/%@",datas[indexPath.row][@"data"][3][@"photo"]];
                [Cell.imgV4 sd_setImageWithURL:[NSURL URLWithString:imagV1Str4] placeholderImage:[UIImage imageNamed:@"imagV4"]];
                Cell.imgV4.userInteractionEnabled = YES;
                __weak typeof(self) self4 = self;
                Cell.imgV4Click = ^(ShopScrollViewTableViewCell *cell){
                    
                    NSIndexPath *row = [tableView indexPathForCell:cell];
                    NSLog(@"row====%ld",(long)row.row);
                    FirstProductdetail *vc = [[FirstProductdetail alloc] init];
                    vc.Cat_Str = dict[@"data"][row.row][@"cat_id"];
                    vc.Number = [NSString stringWithFormat:@"3"];
                    vc.hidesBottomBarWhenPushed = YES;
                    [self4.navigationController pushViewController:vc animated:YES];
                };
                
                
                
                
                
                
                Cell.lab1.text = datas[indexPath.row][@"data"][0][@"title"];
                Cell.lab2.text = datas[indexPath.row][@"data"][1][@"title"];
                Cell.lab3.text = datas[indexPath.row][@"data"][2][@"title"];
                Cell.lab4.text = datas[indexPath.row][@"data"][3][@"title"];
                
                NSString *PriceStr1 = [NSString stringWithFormat:@"¥%@",datas[indexPath.row][@"data"][0][@"price"]];
                Cell.Pricelab1.text =PriceStr1;
                
                NSString *Market_Price1 = [NSString stringWithFormat:@"¥%@",datas[indexPath.row][@"data"][0][@"market_price"]];
                Cell.market_price1.text =Market_Price1 ;
                
                
                
                NSString *PriceStr2 = [NSString stringWithFormat:@"¥%@",datas[indexPath.row][@"data"][1][@"price"]];
                Cell.Pricelab2.text =PriceStr2;
                
                NSString *Market_Price2 = [NSString stringWithFormat:@"¥%@",datas[indexPath.row][@"data"][1][@"market_price"]];
                Cell.market_price2.text =Market_Price2 ;
                
                
                
                NSString *PriceStr3 = [NSString stringWithFormat:@"¥%@",datas[indexPath.row][@"data"][2][@"price"]];
                Cell.Pricelab3.text =PriceStr3;
                
                NSString *Market_Price3 = [NSString stringWithFormat:@"¥%@",datas[indexPath.row][@"data"][2][@"market_price"]];
                Cell.market_price3.text =Market_Price3 ;
                
                
                
                NSString *PriceStr4 = [NSString stringWithFormat:@"¥%@",datas[indexPath.row][@"data"][3][@"price"]];
                Cell.Pricelab4.text =PriceStr4;
                
                NSString *Market_Price4 = [NSString stringWithFormat:@"¥%@",datas[indexPath.row][@"data"][3][@"market_price"]];
                Cell.market_price4.text =Market_Price4 ;
                
            }else{
                
                NSString *imagV1Str = @"http://jiazhuang.siruoit.com/attachs/default/product_photo.jpg_thumb.jpg";
                [Cell.imgV1 sd_setImageWithURL:[NSURL URLWithString:imagV1Str] placeholderImage:[UIImage imageNamed:@"imagV1"]];
                
                [Cell.imgV2 sd_setImageWithURL:[NSURL URLWithString:imagV1Str] placeholderImage:[UIImage imageNamed:@"imagV2"]];
                
                [Cell.imgV3 sd_setImageWithURL:[NSURL URLWithString:imagV1Str] placeholderImage:[UIImage imageNamed:@"imagV3"]];
                
                [Cell.imgV4 sd_setImageWithURL:[NSURL URLWithString:imagV1Str] placeholderImage:[UIImage imageNamed:@"imagV4"]];
                
            }
        }
        
            return Cell;
        }
    }

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (tableView==TabView) {
        k=(int)indexPath.row;
        [collectionview reloadData];
        
        

        selectindexPath = indexPath;
        [TabView reloadData];
    }
    
    
//    ShopClassTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ShopClassTableViewCell"];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)timer
{
    long page = pc.currentPage;
    if(page+1 == pc.numberOfPages)
    {
        
        pc.currentPage = 0;
        page = pc.currentPage;
    }else
    {
        page++;
    }
    [UIView animateWithDuration:0.5 animations:^{
        sc.contentOffset =CGPointMake(page*sc.frame.size.width, 0);
    }];
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //偏移超过一半滚到下一个imageView
    if ((sc.contentOffset.x+sc.frame.size.width/2)/sc.frame.size.width)
    {
        pc.currentPage = (sc.contentOffset.x+sc.frame.size.width/2)/sc.frame.size.width;
    }
}


#pragma mark -商家分类
-(void)Shoplist
{
    
    
#pragma mark -----------------菊花-----------------------
//    
//    testActivityIndicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
//    testActivityIndicator.center = CGPointMake(100.0f, 100.0f);//只能设置中心，不能设置大小
//    [testActivityIndicator setFrame:CGRectMake(100, 100, 100, 100)];
//    //不建议这样设置，因为UIActivityIndicatorView是不能改变大小只能改变位置，这样设置得到的结果是控件的中心在（100，100）上，而不是和其他控件的frame一样左上角在（100， 100）长为100，宽为100.
//    [self.view addSubview:testActivityIndicator];
//    testActivityIndicator.color = [UIColor blackColor]; // 改变圈圈的颜色为红色； iOS5引入
//    [testActivityIndicator startAnimating]; // 开始旋转
//        [testActivityIndicator stopAnimating]; // 结束旋转
//        [testActivityIndicator setHidesWhenStopped:YES]; //当旋转结束时隐藏
//    [testActivityIndicator mas_makeConstraints:^(MASConstraintMaker *make){
//        make.left.equalTo(self.view.mas_left).offset((Width-50)/2);
//        make.right.equalTo(self.view.mas_right).offset(-(Width-50)/2);
//        make.width.equalTo(@50);
//        make.top.equalTo(self.view.mas_top).offset(350);
//        
//    }];
    

    
        NSString *str=[NSString stringWithFormat:@"http://jiazhuang.siruoit.com/index.php?api/api-catelist/cat_id"];
    
        NSURL *url = [NSURL URLWithString:[str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];                        // UTF－8
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc]initWithRequest:request];
        // 请求数据，设置成功与失败的回调函数
        [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSString *html = operation.responseString;
            NSData *data=[html dataUsingEncoding:NSUTF8StringEncoding];
            dict=[NSJSONSerialization  JSONObjectWithData:data options:0 error:nil];
            
            datas = [[NSMutableArray alloc] init];
            
            NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
            
            for (int i = 0; i<[dict[@"data"] count]; i++)
            {
                NSString *STR1 = dict[@"data"][i][@"cat_id"];
                
//                [self productlist:STR1];
                NSString *str=[NSString stringWithFormat:@"http://jiazhuang.siruoit.com/index.php?api/api-product/%@-1",STR1];
                
                NSURL *url = [NSURL URLWithString:[str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];                        // UTF－8
                NSURLRequest *request = [NSURLRequest requestWithURL:url];
                AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc]initWithRequest:request];
                // 请求数据，设置成功与失败的回调函数
                [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
                    NSString *html = operation.responseString;
                    NSData *data=[html dataUsingEncoding:NSUTF8StringEncoding];
                    dict2=[NSJSONSerialization  JSONObjectWithData:data options:0 error:nil];
                    dic[dict[@"data"][i][@"title"]] = dict2;
//                    [datas addObject:dic];
                    
                    if(dic.count == [dict[@"data"] count]){//排序 按照dict 的key顺序

                        for (int n =0; n<[dict[@"data"] count]; n++){
                            
                            [datas addObject:dic[dict[@"data"][n][@"title"]]];
                            
                        }
                        
                        [self.tbView reloadData];
                        [self.tbView.mj_header endRefreshing];

                        
                    }
                    



                    
                }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                    NSLog(@"发生错误！%@",error);

                    UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"服务器数据异常" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
                    
                    [myAlertView show];

                }];
                // 加入队列
                NSOperationQueue *queue = [[NSOperationQueue alloc] init];
                [queue addOperation:operation];
                

                
            }

            
    
        }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"发生错误！%@",error);
            UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"服务器数据异常" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
            
            [myAlertView show];
            
            [testActivityIndicator stopAnimating]; // 结束旋转
            [testActivityIndicator setHidesWhenStopped:YES]; //当旋转结束时隐藏
        }];
        // 加入队列
        NSOperationQueue *queue = [[NSOperationQueue alloc] init];
        [queue addOperation:operation];
    

}


#pragma mark ----------------- 更多-----------------------


-(void)Click:(UIButton *)sender
{
    

    CGPoint point = sender.center;
    point = [self.tbView convertPoint:point fromView:sender.superview];
    NSIndexPath* indexpath = [self.tbView indexPathForRowAtPoint:point];
    NSLog(@"%ld",(long)indexpath.row);
    MoreProductViewController *view = [[MoreProductViewController alloc]init];
    view.Cat_idStr = dict[@"data"][indexpath.row][@"cat_id"];
    view.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:view animated:YES];
}




#pragma mark -----------------CollectionView-----------------------

//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [allClassdic[@"data"][k][@"items"][section][@"items"]count];
}

//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return [allClassdic[@"data"][k][@"items"]count];
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"ShopClassCollectionViewCell";
    ShopClassCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
    cell.lab.text = allClassdic[@"data"][k][@"items"][indexPath.section][@"items"][indexPath.row][@"title"];
    return cell;
}
//定义每个Item 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((Width/10*7-20)/3, 40);
}

//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    //    上左下右
    return UIEdgeInsetsMake(0, 5, 10, 5);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;//列
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    
    return 5;//行
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        return CGSizeMake(Width/10*7, 40);
    }

    return CGSizeMake(Width/10*7, 20);
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    
    UICollectionReusableView *reusableView =nil;
    
    if (kind ==UICollectionElementKindSectionHeader) {
        
        ShopClassCollectionHeaderVIew *headerV = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
        
        headerV.titleLab.text =allClassdic[@"data"][k][@"items"][indexPath.section][@"title"];
        reusableView = headerV;
    }
    
    return reusableView;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    MoreProductViewController *view = [[MoreProductViewController alloc]init];
    view.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:view animated:YES];
    view.Cat_idStr = allClassdic[@"data"][k][@"items"][indexPath.section][@"items"][indexPath.row][@"cat_id"];
    view.StatStr = @"1";
    NSLog(@"Cat_Str%@",view.Cat_idStr);

}
-(void)allClass
{

    NSString *str=[NSString stringWithFormat:@"http://jiazhuang.siruoit.com/index.php?api/api-allcate"];

    NSURL *url = [NSURL URLWithString:[str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];                        // UTF－8
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc]initWithRequest:request];
    // 请求数据，设置成功与失败的回调函数
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSString *html = operation.responseString;
        NSData *data=[html dataUsingEncoding:NSUTF8StringEncoding];
        allClassdic=[NSJSONSerialization  JSONObjectWithData:data options:0 error:nil];
//        allClassdic1 = [NSMutableDictionary dictionaryWithDictionary:allClassdic[@"data"][0][@"items"]];
        NSLog(@"获取到的数据为：%lu",[allClassdic[@"data"][k][@"items"][0][@"items"]count]);


        [TabView reloadData];

    }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"发生错误！%@",error);
    }];
    // 加入队列
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperation:operation];

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
