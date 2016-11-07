//
//  XiaoquViewController.m
//  家装
//
//  Created by mac on 16/6/28.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "XiaoquViewController.h"
#import "XiaoquTableViewCell.h"
#import "NJRequsets.h"
#import "MJRefresh.h"
#import "XiaoquCollectionViewCell.h"
#import "XiaoquCollectionViewHeaderView.h"
@interface XiaoquViewController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property(nonatomic ,strong)UITableView *tabView;
@property(nonatomic ,strong)UIButton *rightBtn;

@property(nonatomic,strong)UIView *popview;

@property(nonatomic ,strong)UICollectionView *collection;

@property(nonatomic ,strong)UIButton *button;
@end

@implementation XiaoquViewController
{
    NSDictionary *dict1;//价格和类型
    NSDictionary *dict2;//区域
    NSMutableDictionary *dict3;//items
    
    NSMutableArray *timeArr;
    int k ;
    NSMutableArray *arrs;
    
    UIButton *finish;
    
    NSMutableArray *selecteArr0;//选中
    NSMutableArray *selecteArr1;//选中
    NSMutableArray *selecteArr2;//选中
    
    NSArray *arr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    selecteArr0 = [[NSMutableArray alloc]init];
    selecteArr1 = [[NSMutableArray alloc]init];
    selecteArr2 = [[NSMutableArray alloc]init];
    
    arr=[[NSArray alloc]initWithObjects:@"区域",@"类型",@"价格", nil];
    
    arrs = [[NSMutableArray alloc]init];
    k=1;
    timeArr = [[NSMutableArray alloc]init];
    self.title = @"小区";
    self.tabView = [[UITableView alloc]initWithFrame:CGRectMake(0, 5, Width, Height) style:UITableViewStylePlain];
    [self.view addSubview:self.tabView];
    self.tabView.delegate = self;
    self.tabView.dataSource = self;
    self.tabView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tabView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self wangluoqingqiu];
    
    #pragma mark -----------------Mjrefresh-----------------------
    self.tabView.mj_header=[MJRefreshNormalHeader headerWithRefreshingBlock: ^ {
        //调用此块。当进入刷新状态自动
        k=1;
        [arrs removeAllObjects];
        [self wangluoqingqiu];
    }];
    
    self.tabView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        
        [self moredata];
        // 进入刷新状态后会自动调用这个block
        
    }];

    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithCustomView:self.rightBtn];
    [self.navigationItem setRightBarButtonItem:rightBarButton];

#pragma mark -----------------collection-----------------------
    
    
    _popview = [[UIView alloc]initWithFrame:CGRectMake(Width, 0, Width, Height)];
    _popview.backgroundColor = [UIColor clearColor];
    [self.navigationController.view addSubview:_popview];
    
    
    
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.1];
    [self.button addTarget:self action:@selector(repopview) forControlEvents:UIControlEventTouchUpInside];
    self.button.hidden  =  YES;
    self.button.frame = CGRectMake(0, 0, Width/4, Height);
    [_popview addSubview:self.button];
    
    
    
    
    
    finish = [UIButton buttonWithType:UIButtonTypeCustom];
    finish.frame = CGRectMake(Width/8*5, Height-30, Width/8*3, 30);
    [finish setTitle:@"完成" forState:UIControlStateNormal];
    finish.titleLabel.textColor = [UIColor whiteColor];
    [finish addTarget:self action:@selector(wangluoqingqiu) forControlEvents:UIControlEventTouchUpInside];
    finish.backgroundColor = [UIColor colorWithRed:255/255.0 green:77/255.0 blue:33/255.0 alpha:1];
    [_popview addSubview:finish];
    
    
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
    [self.collection registerClass:[XiaoquCollectionViewCell class] forCellWithReuseIdentifier:@"XiaoquCollectionViewCell"];
    #pragma mark -- 注册头部视图
    [self.collection registerClass:[XiaoquCollectionViewHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    
    [_popview addSubview:self.collection];
    

    // Do any additional setup after loading the view.
}
-(void)moredata
{
    int i = (int)[dict3[@"items"] count]/(10*k);
    if (i==1) {
        k++;
        
        [self wangluoqingqiu];
    }else
    {
        [self.tabView.mj_footer endRefreshing];
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return [dict3[@"items"]count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * CellIdentifier = @"XiaoquTableviewCell";
    XiaoquTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell)
    {
    cell = [[XiaoquTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    cell.nameLab.text = dict3[@"items"][indexPath.row][@"title"];

    NSString *viewNumberStr1 = [NSString stringWithFormat:@"%@:人查看了该小区",dict3[@"items"][indexPath.row][@"views"]];
    NSMutableAttributedString *viewNumberStr2 = [[NSMutableAttributedString alloc]initWithString:viewNumberStr1];
    [viewNumberStr2 addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 3)];
    cell.ViewNumber.attributedText = viewNumberStr2;
    
    NSString *imagVStr = [NSString stringWithFormat:@"%@%@",PhotoUrl,dict3[@"items"][indexPath.row][@"thumb"]];
    [cell.imagV sd_setImageWithURL:[NSURL URLWithString:imagVStr] placeholderImage:nil];
    
    NSString *priceStr = [NSString stringWithFormat:@"均价:%@",dict3[@"items"][indexPath.row][@"price"]];
    cell.PriceLab.text =priceStr;
    
    cell.TimeLab.text = dict3[@"items"][indexPath.row][@"jf_date"];
    
    NSString *addrStr = [NSString stringWithFormat:@"地址:%@",dict3[@"items"][indexPath.row][@"addr"]];
    cell.Adress.text = addrStr;
    
    [cell.yuyueBtn addTarget:self action:@selector(yuyue:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}
-(void)yuyue:(UIButton *)button
{
    UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"招标成功" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
    
    [myAlertView show];
}
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

    
    NSString *str=[NSString stringWithFormat:@"http://jiazhuang.siruoit.com/index.php?api/api-home-%@-%@-%@-0-%d",Str1,Str2,Str3,k];

    NSURL *url = [NSURL URLWithString:[str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];                        // UTF－8
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc]initWithRequest:request];
    // 请求数据，设置成功与失败的回调函数
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSString *html = operation.responseString;
        NSData *data=[html dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *dict=[NSJSONSerialization  JSONObjectWithData:data options:0 error:nil];
//        NSLog(@"获取到的数据为1111：%@",dict);

        dict1 = [NSDictionary dictionaryWithDictionary:dict[@"data"][0]];
        dict2 =[NSDictionary dictionaryWithDictionary:dict[@"data"][1]];
        dict3 =[NSMutableDictionary dictionaryWithDictionary:dict[@"data"][2]];

//        int a =(int )[dict3[@"items"]count];
//        for (int i=0; i<a; i++) {
//            NSString *timestr = dict3[@"items"][i][@"jf_date"];
//            NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
//            [formatter setDateStyle:NSDateFormatterMediumStyle];
//            [formatter setTimeStyle:NSDateFormatterShortStyle];
//            [formatter setDateFormat:@"yyyy-MM-dd"];//@"yyyy-MM-dd-HHMMss"
//            NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timestr doubleValue]];
//            NSString *dateString = [formatter stringFromDate:date];
//            [timeArr addObject:dateString];
//        }
        if ([dict3[@"items"]count ]!=0)
        {
            
            //                NSMutableArray *arrs = [[NSMutableArray alloc] initWithArray:dict[@"items"]];
            
            for (int b = 0; b<[dict3[@"items"] count]; b++)
            {
                [arrs addObject:dict3[@"items"][b]];
            }
            
            
            dict3[@"items"] = arrs;
            
        }
        [self.tabView.mj_header endRefreshing];
        [self.tabView.mj_footer endRefreshing];
        [self.tabView reloadData];
        [self.collection reloadData];
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
-(void)shaixuan
{
    [arrs removeAllObjects];
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
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0||indexPath.section==1) {
        return CGSizeMake(70, 30);
    }else
        return CGSizeMake(100, 30);
}
#pragma mark --UICollectionViewDelegate

//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section==0) {
        [selecteArr0 removeAllObjects];
        [selecteArr0 addObject:dict2[@"area_list"][indexPath.row][@"area_id"]];
        [self.collection reloadData];
    }
    else if (indexPath.section==1)
    {
        [selecteArr1 removeAllObjects];
        [selecteArr1 addObject:dict1[@"attr_list"][0][@"values"][indexPath.row][@"attr_value_id"]];
        [self.collection reloadData];
    }
    else{

        [selecteArr2 removeAllObjects];
        [selecteArr2 addObject:dict1[@"attr_list"][1][@"values"][indexPath.row][@"attr_value_id"]];
        [self.collection reloadData];

    }
    
}



-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section==0) {
        return [dict2[@"area_list"]count ];
    }else if (section==1){
        return [dict1[@"attr_list"][0][@"values"]count];
    }else
         return [dict1[@"attr_list"][1][@"values"]count];

   
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 3;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"XiaoquCollectionViewCell";
    
    
    //赋值在这里赋值
    XiaoquCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
    if (indexPath.section==0) {
        
        cell.lab.text =dict2[@"area_list"][indexPath.row][@"area_name"];
    }else if (indexPath.section==1)
    {
        
        cell.lab.text =dict1[@"attr_list"][0][@"values"][indexPath.row][@"title"];
        
    }else if(indexPath.section==2){
        
        cell.lab.text =dict1[@"attr_list"][1][@"values"][indexPath.row][@"title"];;
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
        if([selecteArr1 containsObject:dict1[@"attr_list"][0][@"values"][indexPath.row][@"attr_value_id"]])
        {
            cell.lab.textColor = [UIColor whiteColor];
            cell.backgroundColor = [UIColor orangeColor];
            
        }
        
    }
    else {
        if([selecteArr2 containsObject:dict1[@"attr_list"][1][@"values"][indexPath.row][@"attr_value_id"]])
        {
            cell.lab.textColor = [UIColor whiteColor];
            cell.backgroundColor = [UIColor orangeColor];
            
        }
        
    }


    
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        return CGSizeMake(Width/4*3, 40);
    }
    return CGSizeMake(Width/4*3, 20);
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    
    UICollectionReusableView *reusableView =nil;
    
    if (kind ==UICollectionElementKindSectionHeader) {
        
        XiaoquCollectionViewHeaderView *headerV = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
        
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
