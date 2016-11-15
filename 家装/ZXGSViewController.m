//
//  ZXGSViewController.m
//  家装
//
//  Created by mac on 16/5/10.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ZXGSViewController.h"
#import "Masonry.h"
#import "ZXGSTableViewCell.h"
#import "NJRequsets.h"
#import "MJRefresh.h"
#import "SerachZXGSViewController.h"
#import "ChoiceCollectionViewCell.h"
#import "HeaderView.h"
#import "DecorationViewController.h"

@interface ZXGSViewController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong)UIButton *rightBtn;//右按钮

@property(nonatomic,strong)UIView *popview;

@property(nonatomic ,strong)UICollectionView *collection;
@end

@implementation ZXGSViewController
{
    
    NSDictionary *dict1;//服务和规模
    NSDictionary *dict2;//区列表
    NSDictionary *dict3;//等级列表
    NSMutableDictionary *dict4;//商家
    UITableView *tabView;
    int k;
    NSMutableArray *arrs;
    
    NSArray *arr;
    NSMutableArray *selecteArr0;//选中
    NSMutableArray *selecteArr1;//选中
    NSMutableArray *selecteArr2;//选中
    NSMutableArray *selecteArr3;//选中

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"装修公司";
    selecteArr0 = [[NSMutableArray alloc]init];
    selecteArr1 = [[NSMutableArray alloc]init];
    selecteArr2 = [[NSMutableArray alloc]init];
    selecteArr3 = [[NSMutableArray alloc]init];

    arr  = [[NSArray alloc]initWithObjects:@"区域",@"等级",@"服务",@"规模", nil];
    k=1;
    arrs = [[NSMutableArray alloc]init];
    
    self.view.backgroundColor = [UIColor redColor];
    tabView = [[UITableView alloc]initWithFrame:CGRectMake(0, 25, Width, Height-25) style:UITableViewStylePlain];
    [self.view addSubview:tabView];
    tabView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    tabView.delegate = self;
    tabView.dataSource =self;
    tabView.separatorStyle = NO;
    
    
    
    #pragma mark -----------------右边🔍-----------------------
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithCustomView:self.rightBtn];
    [self.navigationItem setRightBarButtonItem:rightBarButton];
    
    


    
    
    
    UIView *backgroundview = [[UIView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 25)];
    backgroundview.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:backgroundview];
    
    
    UIButton *btndiqu = [UIButton buttonWithType:UIButtonTypeCustom];
    btndiqu.frame = CGRectMake(5,0,60, 25);
    [btndiqu setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [btndiqu setTitle:@"上海" forState:UIControlStateNormal];
    btndiqu.titleLabel.font = [UIFont systemFontOfSize:13];
    btndiqu.titleLabel.textAlignment = 1;
    [backgroundview addSubview:btndiqu];
    
    
    
    
    UIButton *btnshuaxin = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnshuaxin setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [btnshuaxin setTitle:@"筛选" forState:UIControlStateNormal];
    [btnshuaxin addTarget:self action:@selector(shaixuan) forControlEvents:UIControlEventTouchUpInside];
    btnshuaxin.titleLabel.font = [UIFont systemFontOfSize:13];
    btnshuaxin.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;[backgroundview addSubview:btnshuaxin];
    btnshuaxin.backgroundColor = [UIColor clearColor];
    [btnshuaxin mas_makeConstraints:^(MASConstraintMaker *make){
        
        make.centerY.mas_equalTo(backgroundview.mas_centerY);
        make.right.equalTo(backgroundview).with.offset(-15);
        make.width.mas_equalTo(@60);
        make.height.mas_equalTo(@25);
    }];
    
    
    
    
    [self wangluoqingqiu];

    
#pragma mark -----------------MJRefreh-----------------------
    
    tabView.mj_header=[MJRefreshNormalHeader headerWithRefreshingBlock: ^ {
        //调用此块。当进入刷新状态自动
        k=1;
        [self wangluoqingqiu];
    }];
    
    tabView.mj_footer =[MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        
        [self moredata];
        // 进入刷新状态后会自动调用这个block
        
    }];

    
    
    
    
    
    
    
    
    
    
    
    
    
    // Do any additional setup after loading the view.
}
-(void)moredata
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

- (UIButton *)rightBtn
{
    if (_rightBtn == nil) {
        _rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(180, 0, 20, 20)];
        
        [_rightBtn setBackgroundImage:[UIImage imageNamed:@"sousuo"] forState:UIControlStateNormal];
        [_rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//        [_rightBtn setTitle:@"搜索" forState:UIControlStateNormal];
        [_rightBtn addTarget:self action:@selector(search) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightBtn;
}


-(void)search
{
    
    SerachZXGSViewController *view = [[SerachZXGSViewController alloc]init];
    [self.navigationController pushViewController:view animated:YES];
//    NSLog(@"%@",searchBar.text);
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [dict4[@"items"] count];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 130;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *docDict = [dict4[@"items"] objectAtIndex:indexPath.row];
    NSLog(@"^%@",docDict);
    DecorationViewController *controller = [[DecorationViewController alloc] initWithNibName:@"DecorationViewController" bundle:nil];
    controller.navigationItem.title =@"详情";
    controller.dicSource = docDict;
    [self.navigationController pushViewController:controller animated:YES];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIndentifier = @"ZXGSTableViewCell";
    ZXGSTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (cell == nil) {
        cell = [[ZXGSTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSString *imgStr = [NSString stringWithFormat:@"%@%@",PhotoUrl,dict4[@"items"][indexPath.row][@"thumb"]];
    [cell.img sd_setImageWithURL:[NSURL URLWithString:imgStr] placeholderImage:nil];
    cell.labOne.text = dict4[@"items"][indexPath.row][@"name"];
    NSString *phoneStr = [NSString stringWithFormat:@"联系电话 : %@",dict4[@"items"][indexPath.row][@"phone"]];
    cell.labTwo.text = phoneStr;
    
    NSString *addrStr = [NSString stringWithFormat:@"地址 : %@",dict4[@"items"][indexPath.row][@"addr"]];
    cell.labThree.text = addrStr;
    
//    NSString *contentStr = @"简介：hello world";
//    NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:contentStr];
//    //设置：在0-3个单位长度内的内容显示成红色
//    [str addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 3)];
//    label.attributedText = str
    
    NSString *anliStr = [NSString stringWithFormat:@"案例: %@",dict4[@"items"][indexPath.row][@"case_num"]];
    NSMutableAttributedString *casestr = [[NSMutableAttributedString alloc]initWithString:anliStr];
        //设置：在0-3个单位长度内的内容显示成红色
    [casestr addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(0, 3)];
    cell.lab1.attributedText = casestr;
    
    
    
    NSString *site_numStr1 = [NSString stringWithFormat:@" 在建工地: %@",dict4[@"items"][indexPath.row][@"site_num"]];
    NSMutableAttributedString *site_numStr = [[NSMutableAttributedString alloc]initWithString:site_numStr1];
    //设置：在0-3个单位长度内的内容显示成红色
    [site_numStr addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(0, 6)];
    cell.lab2.attributedText = site_numStr;
    
    
    
    NSString *tenders_numStr1 = [NSString stringWithFormat:@" 签单数: %@",dict4[@"items"][indexPath.row][@"site_num"]];
    NSMutableAttributedString *tenders_numStr = [[NSMutableAttributedString alloc]initWithString:tenders_numStr1];
    //设置：在0-3个单位长度内的内容显示成红色
    [tenders_numStr addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(0, 5)];
    cell.lab3.attributedText = tenders_numStr;
    
    
    
    NSString *yuyue_numStr1 = [NSString stringWithFormat:@" 预约人数: %@",dict4[@"items"][indexPath.row][@"yuyue_num"]];
    NSMutableAttributedString *yuyue_numStr = [[NSMutableAttributedString alloc]initWithString:yuyue_numStr1];
    //设置：在0-3个单位长度内的内容显示成红色
    [yuyue_numStr addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(0, 6)];
    cell.lab4.attributedText = yuyue_numStr;
    
    cell.suzilab.text = dict4[@"items"][indexPath.row][@"score"];
    
    cell.yuyuelab.userInteractionEnabled = YES;
    UITapGestureRecognizer *labelTapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(labelTouchUpInside:)];
    
    [cell.yuyuelab addGestureRecognizer:labelTapGestureRecognizer];
    
    cell.lijilab.userInteractionEnabled = YES;
    UITapGestureRecognizer *lijilabelTapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(lijilabelTouchUpInside:)];
    
    [cell.lijilab addGestureRecognizer:lijilabelTapGestureRecognizer];
    
    return cell;
}

-(void) labelTouchUpInside:(UITapGestureRecognizer *)recognizer{
    
//    UILabel *label=(UILabel*)recognizer.view;
//    
//    NSLog(@"%@被点击了",label.text);
    UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"招标成功" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
    
    [myAlertView show];
}
-(void)lijilabelTouchUpInside:(UITapGestureRecognizer *)recognizer{
    

    UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"预约成功" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
    
    [myAlertView show];
}


-(void)wangluoqingqiu
{
        NSString *str=[NSString stringWithFormat:@"http://jiazhuang.siruoit.com/index.php?api/api-gs-0-0-0-0-0-%d",k];
    
        NSURL *url = [NSURL URLWithString:[str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];                        // UTF－8
    
    NSLog(@"url: %@", url);
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc]initWithRequest:request];
        // 请求数据，设置成功与失败的回调函数
        [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSString *html = operation.responseString;
            NSData *data=[html dataUsingEncoding:NSUTF8StringEncoding];
            NSDictionary *dict=[NSJSONSerialization  JSONObjectWithData:data options:0 error:nil];
            
            NSLog(@"返回的数据：%@", dict);
    
            dict1 = [NSDictionary dictionaryWithDictionary:dict[@"data"][0]];
            dict2 =[NSDictionary dictionaryWithDictionary:dict[@"data"][1]];
            dict3 =[NSDictionary dictionaryWithDictionary:dict[@"data"][2]];
            dict4 =[NSMutableDictionary dictionaryWithDictionary:dict[@"data"][3]];

//            NSLog(@"dict1%@",dict1);
            if ([dict4[@"items"]count ]!=0) {
                
//                NSMutableArray *arrs = [[NSMutableArray alloc] initWithArray:dict[@"items"]];
                
                for (int b = 0; b<[dict4[@"items"] count]; b++) {
                    [arrs addObject:dict4[@"items"][b]];
                }
                
                
                dict4[@"items"] = arrs;
                
                
                
            }else
            {
                dict4[@"items"] = arrs;
            }

            
            
            
            [tabView reloadData];
            [self.collection reloadData];
            [tabView.mj_header endRefreshing];
            [tabView.mj_footer endRefreshing];
        }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"发生错误！%@",error);
            UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"错误" message:@"服务器数据异常" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
            
            [myAlertView show];
        }];
        // 加入队列
        NSOperationQueue *queue = [[NSOperationQueue alloc] init];
        [queue addOperation:operation];
}
#pragma mark -----------------筛选-----------------------
-(void)shaixuan
{
    
    _popview = [[UIView alloc]initWithFrame:CGRectMake(Width, 0, Width, Height)];
    _popview.backgroundColor = [UIColor clearColor];
    [self.navigationController.view addSubview:_popview];
    
    
    
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
    
    
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(Width/4, 0, Width/4*3, Height)];
    [_popview addSubview:view1];
    view1.backgroundColor = [UIColor whiteColor];
    
    
    UIButton *cancel = [UIButton buttonWithType:UIButtonTypeCustom];
    cancel.frame = CGRectMake(0, Height-30, Width/8*3, 30);
    [cancel setTitle:@"取消" forState:UIControlStateNormal];
    [cancel addTarget:self action:@selector(repopview:) forControlEvents:UIControlEventTouchUpInside];
    cancel.titleLabel.textColor = [UIColor colorWithRed:255/255.0 green:146/255.0 blue:104/255.0 alpha:1];
    cancel.backgroundColor = [UIColor colorWithRed:70/255.0 green:70/255.0 blue:70/255.0 alpha:1.0];
    [view1 addSubview:cancel];
    
    UIButton *finish = [UIButton buttonWithType:UIButtonTypeCustom];
    finish.frame = CGRectMake(Width/8*3, Height-30, Width/8*3, 30);
    [finish setTitle:@"完成" forState:UIControlStateNormal];
    finish.titleLabel.textColor = [UIColor whiteColor];
    [finish addTarget:self action:@selector(finish:) forControlEvents:UIControlEventTouchUpInside];
    finish.backgroundColor = [UIColor colorWithRed:255/255.0 green:77/255.0 blue:33/255.0 alpha:1];
    [view1 addSubview:finish];
    
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
    [self.collection registerClass:[ChoiceCollectionViewCell class] forCellWithReuseIdentifier:@"ChoiceCollectionViewCell"];
#pragma mark -- 注册头部视图

    [self.collection registerClass:[HeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];

    [view1 addSubview:self.collection];
    

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
    return 4;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"ChoiceCollectionViewCell";
    
    
    //赋值在这里赋值
    ChoiceCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
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

        HeaderView *headerV = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
        
        headerV.titleLab.text =arr[indexPath.section];
        reusableView = headerV;
    }
    
    return reusableView;
}

-(void)finish:(UIButton *)btn
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
    
    NSString *str=[NSString stringWithFormat:@"http://jiazhuang.siruoit.com/index.php?api/api-gs-%@-%@-%@-%@-0-1",Str1,Str2,Str3,Str4];


    NSURL *url = [NSURL URLWithString:[str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];                        // UTF－8
    
    NSLog(@"url: %@", url);
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc]initWithRequest:request];
    // 请求数据，设置成功与失败的回调函数
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSString *html = operation.responseString;
        NSData *data=[html dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *dict=[NSJSONSerialization  JSONObjectWithData:data options:0 error:nil];
        
        NSLog(@"返回的数据：%@", dict);
        
//        dict1 = [NSDictionary dictionaryWithDictionary:dict[@"data"][0]];
//        dict2 =[NSDictionary dictionaryWithDictionary:dict[@"data"][1]];
//        dict3 =[NSDictionary dictionaryWithDictionary:dict[@"data"][2]];
        dict4 =[NSMutableDictionary dictionaryWithDictionary:dict[@"data"][3]];
        
//        NSLog(@"dict1%@",dict1);
//        if ([dict4[@"items"]count ]!=0) {
//            
            //                NSMutableArray *arrs = [[NSMutableArray alloc] initWithArray:dict[@"items"]];
//            
//            for (int b = 0; b<[dict4[@"items"] count]; b++) {
//                [arrs addObject:dict4[@"items"][b]];
//            }
//            
//            
//            dict4[@"items"] = arrs;
//            
//            
//            
//        }else
//        {
//            dict4[@"items"] = arrs;
//        }
        
        
        
        
        [tabView reloadData];
//        [self.collection reloadData];
//        [tabView.mj_header endRefreshing];
//        [tabView.mj_footer endRefreshing];
    }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"发生错误！%@",error);
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"错误" message:@"服务器数据异常" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        
        [myAlertView show];
    }];
    // 加入队列
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperation:operation];
    
    
    
    [self repopview:btn];

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
