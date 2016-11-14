//
//  WorkerViewController.m
//  家装
//
//  Created by mac on 16/6/27.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "WorkerViewController.h"
#import "WoKerCollectionViewCell.h"
#import "NJRequsets.h"
#import "MJRefresh.h"
#import "WorkerCollectionCell.h"
#import "WorkerCollectionHeaderView.h"
@interface WorkerViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate>
@property(strong,nonatomic)UIButton *rightBtn;

@property(nonatomic,strong)UIView *popview;

@property(nonatomic ,strong)UICollectionView *collection;

@property(nonatomic ,strong)UIButton *button;
@end

@implementation WorkerViewController
{
    UICollectionView *collectionview;
    NSDictionary *dict;
    NSDictionary *dict1;//工种
    NSDictionary *dict2;//区域
    NSDictionary *dict3;//级别
    NSMutableDictionary *dict4;//items
    int k;
    NSMutableArray *arrs;

    NSMutableArray *selecteArr0;//选中
    NSMutableArray *selecteArr1;//选中
    NSMutableArray *selecteArr2;//选中
    
    NSArray *arr;
    UIButton *finish;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    arr = [[NSArray alloc]initWithObjects:@"区域",@"等级",@"公种", nil];
    
    selecteArr0 = [[NSMutableArray alloc]init];
    selecteArr1 = [[NSMutableArray alloc]init];
    selecteArr2 = [[NSMutableArray alloc]init];
    
    
    //确定是水平滚动，还是垂直滚动
    arrs = [[NSMutableArray alloc]init];
    k=1;
    if ([self.strType isEqualToString:@"案例"]) {
        self.title = @"案例";
    }else{
        self.title =@"工人";
    }
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    flowLayout.sectionInset =UIEdgeInsetsMake(10,5,10,5);
    flowLayout.minimumLineSpacing = 10.f;
    flowLayout.minimumInteritemSpacing = 5.0f;
    

   collectionview=[[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, Width, Height) collectionViewLayout:flowLayout];
    collectionview.dataSource=self;
    collectionview.delegate=self;
    [collectionview setBackgroundColor:[UIColor clearColor]];

    
    [collectionview registerClass:[WoKerCollectionViewCell class] forCellWithReuseIdentifier:@"WorkerCollectionViewCell"];
    [self.view addSubview:collectionview];
    
    [self wangluoqingqiu];
    
    
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithCustomView:self.rightBtn];
    [self.navigationItem setRightBarButtonItem:rightBarButton];

    
#pragma mark -----------------MJRefreh-----------------------
    
    collectionview.mj_header=[MJRefreshNormalHeader headerWithRefreshingBlock: ^ {
        //调用此块。当进入刷新状态自动
        k=1;
        [self wangluoqingqiu];
    }];
    
    collectionview.mj_footer =[MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        
        [self moredata];
        // 进入刷新状态后会自动调用这个block
        
    }];

    
#pragma mark -----------------collection-----------------------
    
    
    _popview = [[UIView alloc]initWithFrame:CGRectMake(Width, 0, Width, Height)];
    _popview.backgroundColor = [UIColor clearColor];
    [self.navigationController.view addSubview:_popview];
    
    
    
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.1];
    [self.button addTarget:self action:@selector(repopview) forControlEvents:UIControlEventTouchUpInside];
    self.button.frame = CGRectMake(0, 0, Width/4, Height);
    self.button.hidden = YES;
    [_popview addSubview:self.button];
    

    
    

    finish = [UIButton buttonWithType:UIButtonTypeCustom];
    finish.frame = CGRectMake(Width/8*5, Height-30, Width/8*3, 30);
    [finish setTitle:@"完成" forState:UIControlStateNormal];
    finish.titleLabel.textColor = [UIColor whiteColor];
    [finish addTarget:self action:@selector(wangluoqingqiu) forControlEvents:UIControlEventTouchUpInside];
    finish.backgroundColor = [UIColor colorWithRed:255/255.0 green:77/255.0 blue:33/255.0 alpha:1];
    [_popview addSubview:finish];
    finish.tag=0;

    
    UIButton *cancel = [UIButton buttonWithType:UIButtonTypeCustom];
    cancel.frame = CGRectMake(Width/4, Height-30, Width/8*3, 30);
    [cancel setTitle:@"取消" forState:UIControlStateNormal];
    [cancel addTarget:self action:@selector(repopview) forControlEvents:UIControlEventTouchUpInside];
    cancel.titleLabel.textColor = [UIColor colorWithRed:255/255.0 green:146/255.0 blue:104/255.0 alpha:1];
    cancel.backgroundColor = [UIColor colorWithRed:70/255.0 green:70/255.0 blue:70/255.0 alpha:1.0];
    [_popview addSubview:cancel];
    //=======================1===========================
    //创建一个块状表格布局对象
    UICollectionViewFlowLayout *flowL = [UICollectionViewFlowLayout new];
    //格子的大小 (长，高)
    //    flowL.itemSize =CGSizeMake(70,30);
    //横向最小距离
    
    //    flowL.minimumInteritemSpacing =1.f;
    //    flowL.minimumLineSpacing=60.f;//代表的是纵向的空间间隔
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
    
    
    
    self.collection=[[UICollectionView alloc] initWithFrame:CGRectMake(Width/4, 0, Width/4*3, Height-30) collectionViewLayout:flowL];
    self.collection.dataSource=self;
    self.collection.delegate=self;
    [self.collection setBackgroundColor:[UIColor whiteColor]];
    
    //注册Cell，必须要有
    [self.collection registerClass:[WorkerCollectionCell class] forCellWithReuseIdentifier:@"WorkerCollectionCell"];
#pragma mark -- 注册头部视图
    [self.collection registerClass:[WorkerCollectionHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    
    [_popview addSubview:self.collection];
    
    
    

    
    // Do any additional setup after loading the view.
}

//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (collectionview==collectionView) {
        return [dict4[@"items"]count];

    }
    if (section==0) {
        return [dict2[@"area_list"]count ];
    }else if (section==1){
        return [dict3[@"group_list"]count];
    }
    return [dict1[@"attr_list"][0][@"values"]count];


    
}
-(void)moredata
{
    int i = (int)[dict4[@"items"] count]/(20*k);
    if (i==1) {
        k++;
        [self wangluoqingqiu];
    }else
    {
        [collectionview.mj_footer endRefreshing];
    }
}

//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    if (collectionview==collectionView) {
        return 1;
    }
    return 3;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (collectionview==collectionView) {
        static NSString * CellIdentifier = @"WorkerCollectionViewCell";
        WoKerCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
        
        NSString *imagevStr = [NSString stringWithFormat:@"%@%@",PhotoUrl,dict4[@"items"][indexPath.row][@"face"]];
        [cell.imagev sd_setImageWithURL:[NSURL URLWithString:imagevStr] placeholderImage:nil];
        
        cell.nameLab.text = dict4[@"items"][indexPath.row][@"area_name"];
        cell.yuyueLab.text = @"预约数:";
        cell.NumberLab.text = dict4[@"items"][indexPath.row][@"yuyue_num"];
        [cell.yuyueBtn addTarget:self action:@selector(yuyue:) forControlEvents:UIControlEventTouchUpInside];
        return cell;

    }
    static NSString * CellIdentifier = @"WorkerCollectionCell";
    WorkerCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
    if (indexPath.section==0) {
        
        cell.lab.text =dict2[@"area_list"][indexPath.row][@"area_name"];
    }else if (indexPath.section==1)
    {
        
        
        cell.lab.text =dict3[@"group_list"][indexPath.row][@"group_name"];
    }else if (indexPath.section==2)
    {
        
        cell.lab.text =dict1[@"attr_list"][0][@"values"][indexPath.row][@"title"];
    }
    
    cell.lab.backgroundColor = [UIColor clearColor];
    cell.lab.textColor = [UIColor blackColor];
    if (indexPath.section==0) {
        if([selecteArr0 containsObject:dict2[@"area_list"][indexPath.row][@"area_id"]])
        {
            cell.lab.textColor = [UIColor whiteColor];
            cell.backgroundColor = [UIColor orangeColor];
            
        }
    }
    else if (indexPath.section==1)
    {
        if([selecteArr1 containsObject:dict3[@"group_list"][indexPath.row][@"group_id"]])
        {
            cell.lab.textColor = [UIColor whiteColor];
            cell.backgroundColor = [UIColor orangeColor];
            
        }
        
    }
    else
        if([selecteArr2 containsObject:dict1[@"attr_list"][0][@"values"][indexPath.row][@"attr_value_id"]])
        {
            cell.lab.textColor = [UIColor whiteColor];
            cell.backgroundColor = [UIColor orangeColor];
            
        }
    


    
    
    
    return cell;
}
-(void)yuyue:(UIButton *)button
{
    UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"预约成功" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
    
    [myAlertView show];
}
//定义每个Item 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (collectionview==collectionView) {
        return CGSizeMake((Width-15)/2, (Width-15)/2*1.3);
    }

        return CGSizeMake(70, 30);


}

#pragma mark- 找工人
-(void)wangluoqingqiu
{
    NSString *Str1 = [[NSString alloc]init];
    NSString *Str2 = [[NSString alloc]init];
    NSString *Str3 = [[NSString alloc]init];
    
    
    if (selecteArr0.count==0) {
        Str1 = [NSString stringWithFormat:@"0"];
    }else
    {
        Str1 =selecteArr0[0];
    }
    
    if (selecteArr1.count==0) {
        Str2 = [NSString stringWithFormat:@"0"];
    }else
    {
        Str2 =selecteArr1[0];
    }
    
    if (selecteArr2.count==0) {
        Str3 = [NSString stringWithFormat:@"0"];
    }else
    {
        Str3 =selecteArr2[0];
    }
    

        NSString *str=[NSString stringWithFormat:@"http://jiazhuang.siruoit.com/index.php?api/api-gongren-%@-%@-%@-0-1",Str1,Str2,Str3];
    
        NSURL *url = [NSURL URLWithString:[str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];                        // UTF－8
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc]initWithRequest:request];
        // 请求数据，设置成功与失败的回调函数
        [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSError *ERR = nil;
            
            NSString *string = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
            
            
            
            string = [string stringByReplacingOccurrencesOfString:@"\r" withString:@""];
            string = [string stringByReplacingOccurrencesOfString:@"\n" withString:@""];

            
            NSData *datas = [string dataUsingEncoding:NSUTF8StringEncoding];
            
            
            
            dict = [NSJSONSerialization  JSONObjectWithData:datas options:NSJSONReadingMutableLeaves error:&ERR];
            dict1 = [NSDictionary dictionaryWithDictionary:dict[@"data"][0]];
            dict2 =[NSDictionary dictionaryWithDictionary:dict[@"data"][1]];
            dict3 =[NSDictionary dictionaryWithDictionary:dict[@"data"][2]];
            dict4 =[NSMutableDictionary dictionaryWithDictionary:dict[@"data"][3]];
//            NSLog(@"dict4%@",dict4);
            if (finish.tag ==1) {
                dict4 =[NSMutableDictionary dictionaryWithDictionary:dict[@"data"][3]];
                
            }else
            {
            if ([dict4[@"items"]count ]!=0)
            {
                
                //                NSMutableArray *arrs = [[NSMutableArray alloc] initWithArray:dict[@"items"]];
                
                for (int b = 0; b<[dict4[@"items"] count]; b++)
                {
                    [arrs addObject:dict4[@"items"][b]];
                }
                
                
                dict4[@"items"] = arrs;
                
               }
            }
            [collectionview reloadData];
            [self.collection reloadData];
            [collectionview.mj_header endRefreshing];
            [collectionview.mj_footer endRefreshing];
            finish.tag =0;

        }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"发生错误！%@",error);
        }];
        // 加入队列
        NSOperationQueue *queue = [[NSOperationQueue alloc] init];
        [queue addOperation:operation];
        [self repopview];
}
#pragma mark -----------------筛选-----------------------
- (UIButton *)rightBtn
{
    if (_rightBtn == nil) {
        _rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(210, 0, 50, 20)];
        
        [_rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_rightBtn setTitle:@"筛选" forState:UIControlStateNormal];
        _rightBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        _rightBtn.backgroundColor = [UIColor clearColor];
        [_rightBtn addTarget:self action:@selector(shaixuan) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightBtn;
}
/**
 *  shuaxin
 */
-(void)shaixuan
{
    finish.tag = 1;

    [UIView animateWithDuration:0.5 animations:^{
        
        // 设置view弹出来的位置
        _popview.frame = CGRectMake(0, 0, Width, Height);
        
    }];
    
    self.button.hidden = NO;

}
-(void)repopview
{
    [selecteArr0 removeAllObjects];
    [selecteArr1 removeAllObjects];
    [selecteArr2 removeAllObjects];
    
    [UIView animateWithDuration:0.5 animations:^{
        self.button.hidden = YES;
        
        _popview.frame = CGRectMake(Width, 0, Width, Height);
        
        
    }];
}

//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.collection == collectionView) {
        if (indexPath.section==0) {
            [selecteArr0 removeAllObjects];
            [selecteArr0 addObject:dict2[@"area_list"][indexPath.row][@"area_id"]];
            [self.collection reloadData];
        }
        else if (indexPath.section==1)
        {
            [selecteArr1 removeAllObjects];
            [selecteArr1 addObject:dict3[@"group_list"][indexPath.row][@"group_id"]];
            [self.collection reloadData];
        }
        else
        {

            [selecteArr2 removeAllObjects];
            [selecteArr2 addObject:dict1[@"attr_list"][0][@"values"][indexPath.row][@"attr_value_id"]];
            [self.collection reloadData];
        }
    }
    
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (collectionview==collectionView) {
        return CGSizeMake(0, 0);
    }else{
    if (section==0) {
        return CGSizeMake(Width/4*3, 40);
    }
    return CGSizeMake(Width/4*3, 20);
    }
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if (collectionview ==collectionView) {
        
    }
    
    UICollectionReusableView *reusableView =nil;
    
    if (kind ==UICollectionElementKindSectionHeader) {
        
        WorkerCollectionHeaderView *headerV = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
        
        headerV.titleLab.text =arr[indexPath.section];
        reusableView = headerV;
    }
    
    return reusableView;
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
