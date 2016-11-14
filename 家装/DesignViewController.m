//
//  DesignViewController.m
//  家装
//
//  Created by mac on 16/6/25.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "DesignViewController.h"
#import "DesignTableViewCell.h"
#import "NJRequsets.h"
#import "MJRefresh.h"
#import "DesignCollectionViewCell.h"
#import "DesignCollectionHeaderView.h"
@interface DesignViewController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property(strong,nonatomic)UIButton *rightBtn;

@property(nonatomic,strong)UIView *popview;

@property(nonatomic ,strong)UICollectionView *collection;

@property(nonatomic ,strong)UIView *view1;

@property(nonatomic ,strong)UIButton *cancel;

@end

@implementation DesignViewController
{
    UITableView *tabView;
    NSDictionary *dict;
    NSDictionary *dict1;//经验，职位
    NSDictionary *dict2;//区列表
    NSDictionary *dict3;//等级
    NSMutableDictionary *dict4;//商家
    int k;
    NSMutableArray *arrs1;
    NSMutableArray *arrs2;
    
    NSMutableArray *selecteArr0;//选中
    NSMutableArray *selecteArr1;//选中
    NSMutableArray *selecteArr2;//选中
    NSMutableArray *selecteArr3;//选中
    NSArray *arr;
    UIButton *finish;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    selecteArr0 = [[NSMutableArray alloc]init];
    selecteArr1 = [[NSMutableArray alloc]init];
    selecteArr2 = [[NSMutableArray alloc]init];
    selecteArr3 = [[NSMutableArray alloc]init];
    
    
    arr  = [[NSArray alloc]initWithObjects:@"区域",@"等级",@"经验",@"职位", nil];
    k=1;
    
    arrs1 = [[NSMutableArray alloc]init];
    
    arrs2 = [[NSMutableArray alloc]init];

    self.title = @"设计师";
    self.view.backgroundColor = [UIColor whiteColor];
    tabView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, Width, Height) style:UITableViewStyleGrouped];
    [self.view addSubview:tabView];
    tabView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    tabView.separatorStyle = UITableViewCellSelectionStyleNone;
    tabView.delegate = self;
    tabView.dataSource = self;
    [self wangluoqingqiu];
    
    tabView.mj_header=  [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [arrs1 removeAllObjects];

        k=1;
        [self wangluoqingqiu];
    }];

    tabView.mj_footer =[MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        
        // 进入刷新状态后会自动调用这个block
        [self moreData];
    }];

    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithCustomView:self.rightBtn];
    [self.navigationItem setRightBarButtonItem:rightBarButton];
    
    #pragma mark -----------------collectionview-----------------------

    
    _popview = [[UIView alloc]initWithFrame:CGRectMake(Width, 0, Width, Height)];
    _popview.backgroundColor = [UIColor clearColor];
    [self.navigationController.view addSubview:_popview];
    

    
    
    self.view1 = [[UIView alloc]initWithFrame:CGRectMake(Width/4, 0, Width/4*3, Height)];
    [_popview addSubview:self.view1];
    self.view1.backgroundColor = [UIColor whiteColor];
    
    
    
    finish = [UIButton buttonWithType:UIButtonTypeCustom];
    finish.tag=0;
    finish.frame = CGRectMake(Width/8*3, Height-30, Width/8*3, 30);
    [finish setTitle:@"完成" forState:UIControlStateNormal];
    finish.titleLabel.textColor = [UIColor whiteColor];
    [finish addTarget:self action:@selector(wangluoqingqiu) forControlEvents:UIControlEventTouchUpInside];
    finish.backgroundColor = [UIColor colorWithRed:255/255.0 green:77/255.0 blue:33/255.0 alpha:1];
    [self.view1 addSubview:finish];
    
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
    
    
    
    self.collection=[[UICollectionView alloc] initWithFrame:CGRectMake(0, 20, Width/4*3, Height-20-30) collectionViewLayout:flowL];
    self.collection.dataSource=self;
    self.collection.delegate=self;
    [self.collection setBackgroundColor:[UIColor whiteColor]];
    
    //注册Cell，必须要有
    [self.collection registerClass:[DesignCollectionViewCell class] forCellWithReuseIdentifier:@"DesignCollectionViewCell"];
#pragma mark -- 注册头部视图
    [self.collection registerClass:[DesignCollectionHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    
    [self.view1 addSubview:self.collection];
    

    
    // Do any additional setup after loading the view.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [dict4[@"items"]count];
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Width, 10)];
    headerview.backgroundColor = [UIColor groupTableViewBackgroundColor];
    return headerview;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 140;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *Cellidentifier = @"DesignTableViewCell";
    DesignTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Cellidentifier];
    if (!cell) {
        cell = [[DesignTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Cellidentifier];
    }

    cell.backgroundColor = [UIColor whiteColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.namelab.text = dict4[@"items"][indexPath.section][@"uname"];

    NSString *qqStr = [NSString stringWithFormat:@"QQ: %@",dict4[@"items"][indexPath.section][@"qq"]];
    NSMutableAttributedString *qqStr1 = [[NSMutableAttributedString alloc]initWithString:qqStr];
    [qqStr1 addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, 3)];
    cell.qqlab.attributedText = qqStr1;

    NSString *photoStr = [NSString stringWithFormat:@"%@%@",PhotoUrl,dict4[@"items"][indexPath.section][@"face"]];
    [cell.imagV sd_setImageWithURL:[NSURL URLWithString:photoStr] placeholderImage:nil];
    
    NSString *schoolStr = [NSString stringWithFormat:@"毕业院校:%@",dict4[@"items"][indexPath.section][@"school"]];
    cell.School.text = schoolStr;
    
    NSString *anliStr = [NSString stringWithFormat:@"案例:%@",dict4[@"items"][indexPath.section][@"case_num"]];
    cell.anli.text = anliStr;
    
    
    NSString *mobileStr = [NSString stringWithFormat:@"手机:%@",dict4[@"items"][indexPath.section][@"mobile"]];
    cell.mobile.text = mobileStr;
    
    NSString *SJLNStr = [NSString stringWithFormat:@"设计理念:%@",dict4[@"items"][indexPath.section][@"slogan"]];
    cell.SJLN.text = SJLNStr;
    
    [cell.yuyue addTarget:self action:@selector(yuyue:) forControlEvents:UIControlEventTouchUpInside];
    
    #pragma mark -----------------分数条-----------------------

    
    NSString *designscorelabStr = [NSString stringWithFormat:@"%@.0",dict4[@"items"][indexPath.section][@"score1"]];
    cell.designscorelab.text = designscorelabStr;
    int a = [cell.designscorelab.text intValue];
    if (a>0) {
        cell.scorelab2.frame = CGRectMake(0, 0, 8*a, 7);
    }
    
    NSString *servescorelabStr = [NSString stringWithFormat:@"%@.0",dict4[@"items"][indexPath.section][@"score2"]];
    cell.servescorelab.text = servescorelabStr;
    int b = [cell.servescorelab.text intValue];
    if (b>0) {
        cell.servelab2.frame = CGRectMake(0, 0, 8*a, 7);
    }

    NSString *tiexinscorelabStr = [NSString stringWithFormat:@"%@.0",dict4[@"items"][indexPath.section][@"score3"]];
    cell.tiexinscorelab.text = tiexinscorelabStr;
    int c = [cell.tiexinscorelab.text intValue];
    if (c>0) {
        cell.tiexinlab2.frame = CGRectMake(0, 0, 8*a, 7);
    }
    
    return cell;
}

-(void)moreData
{
    int i = (int)[dict4[@"items"] count]/(10*k);
    if (i==1) {
        k++;
        [self wangluoqingqiu];
    }else
    {
        [tabView.mj_footer endRefreshing];
    }
}
-(void)yuyue:(UIButton *)button
{
     UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"预约成功" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [myAlertView show];
}

#pragma mark - 找设计师
-(void)wangluoqingqiu
{
    
    NSString *Str1 = [[NSString alloc]init];
    NSString *Str2 = [[NSString alloc]init];
    NSString *Str3 = [[NSString alloc]init];
    NSString *Str4 = [[NSString alloc]init];
    
    
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
    
    if (selecteArr3.count==0) {
        Str4 = [NSString stringWithFormat:@"0"];
    }else
    {
        Str4 =selecteArr3[0];
    }


    NSString *str=[NSString stringWithFormat:@"http://jiazhuang.siruoit.com/index.php?api/api-finddesigner-%@-%@-%@-%@-0-%d",Str1,Str2,Str3,Str4,k];

    NSURL *url = [NSURL URLWithString:[str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];                        // UTF－8
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc]initWithRequest:request];
    // 请求数据，设置成功与失败的回调函数
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSError *ERR = nil;
        
        NSString *string = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        
        
        
        string = [string stringByReplacingOccurrencesOfString:@"\r" withString:@""];
        string = [string stringByReplacingOccurrencesOfString:@"\n" withString:@""];
        string = [string stringByReplacingOccurrencesOfString:@"	主要设计专长：家居空间，室内软装，硬装空间规划设计	其他设计专长：样板房、别墅、公寓、酒店会所、KTV空间设计，家具设计，软装配饰设计	姓名：Daniel(陶海涛)	学位：硕士	毕业院校：加利福尼亚CL 留学交流一年 " withString:@":"];

        
        NSData *datas = [string dataUsingEncoding:NSUTF8StringEncoding];
        
        
        
        dict = [NSJSONSerialization  JSONObjectWithData:datas options:NSJSONReadingMutableLeaves error:&ERR];

        dict1 = [NSDictionary dictionaryWithDictionary:dict[@"data"][0]];
        dict2 =[NSDictionary dictionaryWithDictionary:dict[@"data"][1]];
        dict3 =[NSDictionary dictionaryWithDictionary:dict[@"data"][2]];
        dict4 =[NSMutableDictionary dictionaryWithDictionary:dict[@"data"][3]];
        if (finish.tag==1) {
            if ([dict4[@"items"]count ]!=0)
            {
                
                //                NSMutableArray *arrs = [[NSMutableArray alloc] initWithArray:dict[@"items"]];
                
                for (int b = 0; b<[dict4[@"items"] count]; b++)
                {
                    [arrs2 addObject:dict4[@"items"][b]];
                }
                
                
                dict4[@"items"] = arrs2;
                
                
                
            }
            else
            {
                dict4[@"items"] = arrs2;
            }

        }
        
        else
        {
        
        
        if ([dict4[@"items"]count ]!=0)
            {
            
            //                NSMutableArray *arrs = [[NSMutableArray alloc] initWithArray:dict[@"items"]];
            
            for (int b = 0; b<[dict4[@"items"] count]; b++)
               {
                [arrs1 addObject:dict4[@"items"][b]];
               }
            
            
            dict4[@"items"] = arrs1;
            
            
            
           }
        else
            {
            dict4[@"items"] = arrs1;
            }
        }

        [tabView reloadData];
        [tabView.mj_header endRefreshing];
        [tabView.mj_footer endRefreshing];
        [self.collection reloadData];
//        finish.tag=0;
    }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"发生错误！%@",error);
    }];
    // 加入队列
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperation:operation];
    [self repopview:self.cancel];

}
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
#pragma mark -----------------筛选-----------------------
-(void)shaixuan
{
    finish.tag=1;
    k=1;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [_popview addSubview:button];
    [button addTarget:self action:@selector(repopview:) forControlEvents:UIControlEventTouchUpInside];
    button.backgroundColor = [UIColor blackColor];
    button.alpha = 0.2;
    [button mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(_popview.mas_left);
        make.width.equalTo(@(Width/4));
        make.top.equalTo(_popview.mas_top);
        make.bottom.equalTo(_popview.mas_bottom);
    }];

    self.cancel = [UIButton buttonWithType:UIButtonTypeCustom];
    self.cancel.frame = CGRectMake(0, Height-30, Width/8*3, 30);
    [self.cancel setTitle:@"取消" forState:UIControlStateNormal];
    [self.cancel addTarget:self action:@selector(repopview:) forControlEvents:UIControlEventTouchUpInside];
    self.cancel.titleLabel.textColor = [UIColor colorWithRed:255/255.0 green:146/255.0 blue:104/255.0 alpha:1];
    self.cancel.backgroundColor = [UIColor colorWithRed:70/255.0 green:70/255.0 blue:70/255.0 alpha:1.0];
    [self.view1 addSubview:self.cancel];

    
    [UIView animateWithDuration:0.3 animations:^{
        
        // 设置view弹出来的位置
        
        _popview.frame = CGRectMake(0, 0, Width, Height);
        
    }];

}
-(void)repopview:(UIButton *)button
{
    [selecteArr0 removeAllObjects];
    [selecteArr1 removeAllObjects];
    [selecteArr2 removeAllObjects];
    [selecteArr3 removeAllObjects];
    
    [UIView animateWithDuration:0.2 animations:^{
        
        
        _popview.frame = CGRectMake(Width, 0, Width, Height);
        
        [button removeFromSuperview];
        
    }];
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0||indexPath.section==2) {
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
        [selecteArr1 addObject:dict3[@"group_list"][indexPath.row][@"group_id"]];
        [self.collection reloadData];
    }
    else if (indexPath.section==2)
    {
        [selecteArr2 removeAllObjects];
        [selecteArr2 addObject:dict1[@"attr_list"][0][@"values"][indexPath.row][@"attr_value_id"]];
        [self.collection reloadData];
    }
    else
    {
        [selecteArr3 removeAllObjects];
        [selecteArr3 addObject:dict1[@"attr_list"][1][@"values"][indexPath.row][@"attr_value_id"]];
        [self.collection reloadData];
    }
    
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section==0) {
        return [dict2[@"area_list"]count ];
    }else if (section==1){
        return [dict3[@"group_list"]count];
    }else if(section==2){
        return [dict1[@"attr_list"][0][@"values"]count];
    }
    return [dict1[@"attr_list"][1][@"values"]count];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return [dict[@"data"]count];
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"DesignCollectionViewCell";
    
    
    //赋值在这里赋值
    DesignCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
    if (indexPath.section==0) {
        
        cell.lab.text =dict2[@"area_list"][indexPath.row][@"area_name"];
    }else if (indexPath.section==1)
    {
        
        
        cell.lab.text =dict3[@"group_list"][indexPath.row][@"group_name"];
    }else if (indexPath.section==2)
    {
        
        cell.lab.text =dict1[@"attr_list"][0][@"values"][indexPath.row][@"title"];
    }else if (indexPath.section==3)
    {
        
        cell.lab.text =dict1[@"attr_list"][1][@"values"][indexPath.row][@"title"];
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
    else if (indexPath.section==2)
    {
        if([selecteArr2 containsObject:dict1[@"attr_list"][0][@"values"][indexPath.row][@"attr_value_id"]])
        {
            cell.lab.textColor = [UIColor whiteColor];
            cell.backgroundColor = [UIColor orangeColor];
            
        }
        
    }
    else
        if([selecteArr3 containsObject:dict1[@"attr_list"][1][@"values"][indexPath.row][@"attr_value_id"]])
        {
            cell.lab.textColor = [UIColor whiteColor];
            cell.backgroundColor = [UIColor orangeColor];
            
        }
    
    return cell;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    
    return CGSizeMake(Width/4*3, 20);
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    
    UICollectionReusableView *reusableView =nil;
    
    if (kind ==UICollectionElementKindSectionHeader) {
        
        DesignCollectionHeaderView *headerV = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
        
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
