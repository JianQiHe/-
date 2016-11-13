//
//  ProductDetailViewController.m
//  家装
//
//  Created by mac on 16/7/13.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ProductDetailViewController.h"
#import "MBProgressHUD+NJ.h"
@interface ProductDetailViewController ()<UIScrollViewDelegate>

@end

@implementation ProductDetailViewController
{
    UIScrollView *scrollView;
    UIView *alphaView;
    UIScrollView *scrollview;
    UIPageControl *pagecontrol;
    NSDictionary *dict;
    UIView *_bgView;
    UILabel *_numberLab;
    
    
    
    UILabel *titlelab;
    UILabel *pricelab;
    UILabel *market_pricelab;
    UILabel *adress;
    UILabel *catelab;
    UIImageView *logoimagV;
    UILabel *shopname;
    UILabel *phonelab;
    UILabel *shopaddress;
    UILabel *shopinfo;

    NSString *STR;
}
-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}
-(void)viewWillDisappear:(BOOL)animated{
    
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self ProductDetail];
    NSLog(@"product_idStr%@",self.product_idStr);
    self.view.backgroundColor = [UIColor redColor];
    
    scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, -64, Width, Height+24)];
    scrollView.delegate = self;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:scrollView];
    
    scrollview = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, Width, 350)];
    scrollview.delegate = self;
    scrollview.showsHorizontalScrollIndicator = NO;
    scrollview.backgroundColor = [UIColor lightGrayColor];
    [scrollView addSubview:scrollview];

    
    
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = [UIColor whiteColor];
    [scrollView addSubview:view];
     [view mas_makeConstraints:^(MASConstraintMaker *make){
         make.left.equalTo(scrollview.mas_left);
         make.right.equalTo(scrollview.mas_right);
         make.top.equalTo(scrollview.mas_bottom);
         make.height.equalTo(@110);
    }];
    
    
    //星星
    UIImageView *collectimagV = [[UIImageView alloc]init];
    collectimagV.image = [UIImage imageNamed:@"xingxing_no"];
    [view addSubview:collectimagV];
     [collectimagV mas_makeConstraints:^(MASConstraintMaker *make){
         make.right.equalTo(view.mas_right).offset(-5);
         make.top.equalTo(scrollview.mas_bottom).offset(5);
         make.width.equalTo(@40);
         make.height.equalTo(@40);
    }];
    
    
    //分割线
    UILabel *linelab = [[UILabel alloc]init];
    linelab.backgroundColor = [UIColor darkGrayColor];
    [view addSubview:linelab];
    [linelab mas_makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(collectimagV.mas_left).offset(-10);
        make.top.equalTo(collectimagV.mas_top).offset(5);
        make.bottom.equalTo(collectimagV.mas_bottom).offset(-5);
        make.width.equalTo(@0.5);
        
    }];
    

    
    //标题
    titlelab = [[UILabel alloc]init];
    [view addSubview:titlelab];
    titlelab.numberOfLines = 2;
    titlelab.lineBreakMode = NSLineBreakByTruncatingTail;
    titlelab.textColor = [UIColor blackColor];
    titlelab.font = [UIFont systemFontOfSize:13];
    [titlelab mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(view.mas_left).offset(5);
        make.bottom.equalTo(collectimagV.mas_bottom);
        make.right.equalTo(collectimagV.mas_left).offset(-20);
        make.height.equalTo(@40);
    }];

    
    
    pricelab = [[UILabel alloc]init];
    [view addSubview:pricelab];
    pricelab.lineBreakMode = NSLineBreakByWordWrapping;
    pricelab.textColor = [UIColor redColor];
    pricelab.font = [UIFont systemFontOfSize:18];
    [pricelab mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(titlelab.mas_left);
        make.top.equalTo(titlelab.mas_bottom);
        make.height.equalTo(@25);
    }];
    

    market_pricelab = [[UILabel alloc]init];
    [view addSubview:market_pricelab];
    market_pricelab.lineBreakMode = NSLineBreakByWordWrapping;
    market_pricelab.textColor = [UIColor lightGrayColor];
    market_pricelab.font = [UIFont systemFontOfSize:12];
    [market_pricelab mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(pricelab.mas_left);
        make.top.equalTo(pricelab.mas_bottom);
        make.height.equalTo(@15);
    }];
    
    
    
    UILabel *linelab2 = [[UILabel alloc]init];
    linelab2.backgroundColor = [UIColor darkGrayColor];
    [view addSubview:linelab2];
    [linelab2 mas_makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(market_pricelab.mas_right);
        make.top.equalTo(market_pricelab.mas_centerY);
        make.height.equalTo(@0.5);
        make.left.equalTo(market_pricelab.mas_left);
        
    }];
    
    
    
    adress = [[UILabel alloc]init];
    [view addSubview:adress];
    adress.lineBreakMode = NSLineBreakByWordWrapping;
    adress.textColor = [UIColor lightGrayColor];
    adress.font = [UIFont systemFontOfSize:12];
    [adress mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(market_pricelab.mas_left);
        make.top.equalTo(market_pricelab.mas_bottom).offset(5);
        make.height.equalTo(@15);
    }];
    
    
    
    catelab = [[UILabel alloc]init];
    [view addSubview:catelab];
    catelab.lineBreakMode = NSLineBreakByWordWrapping;
    catelab.textColor = [UIColor lightGrayColor];
    catelab.font = [UIFont systemFontOfSize:12];
    [catelab mas_makeConstraints:^(MASConstraintMaker *make){
        make.centerX.equalTo(view.mas_centerX);
        make.bottom.equalTo(adress.mas_bottom);
        make.height.equalTo(@15);
    }];
    


//第二个view
    
    
    UIView *view2 = [[UIView alloc]init];
    view2.backgroundColor = [UIColor whiteColor];
    [scrollView addSubview:view2];
    [view2 mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(scrollview.mas_left);
        make.right.equalTo(scrollview.mas_right);
        make.height.equalTo(@65);
        make.top.equalTo(view.mas_bottom).offset(10);
    }];
    
    
    
    
    logoimagV = [[UIImageView alloc]init];
    [view2 addSubview:logoimagV];
    [logoimagV mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(view2.mas_left).offset(10);
        make.top.equalTo(view2.mas_top).offset(10);
        make.width.equalTo(@40);
        make.height.equalTo(@40);
    }];
    
    
    shopname = [[UILabel alloc]init];
    [view2 addSubview:shopname];
    shopname.lineBreakMode = NSLineBreakByWordWrapping;
    shopname.textColor = [UIColor lightGrayColor];
    shopname.font = [UIFont systemFontOfSize:12];
    [shopname mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(logoimagV.mas_right).offset(5);
        make.top.equalTo(logoimagV.mas_top);
        make.height.equalTo(@15);
    }];

    phonelab = [[UILabel alloc]init];
    [view2 addSubview:phonelab];
    phonelab.lineBreakMode = NSLineBreakByWordWrapping;
    phonelab.textColor = [UIColor lightGrayColor];
    phonelab.font = [UIFont systemFontOfSize:10];
    [phonelab mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(shopname.mas_left);
        make.top.equalTo(shopname.mas_bottom);
        make.height.equalTo(@15);
    }];


    shopaddress = [[UILabel alloc]init];
    [view2 addSubview:shopaddress];
    shopaddress.lineBreakMode = NSLineBreakByWordWrapping;
    shopaddress.textColor = [UIColor lightGrayColor];
    shopaddress.font = [UIFont systemFontOfSize:10];
    [shopaddress mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(logoimagV.mas_left);
        make.top.equalTo(logoimagV.mas_bottom);
        make.height.equalTo(@15);
    }];

    
    shopinfo = [[UILabel alloc]init];
    [scrollView addSubview:shopinfo];
    shopinfo.numberOfLines = 0;
//    shopinfo.lineBreakMode = NSLineBreakByTruncatingTail;
    shopinfo.textColor = [UIColor lightGrayColor];
    shopinfo.font = [UIFont systemFontOfSize:10];
//    [shopinfo mas_makeConstraints:^(MASConstraintMaker *make){
//        make.left.equalTo(scrollview.mas_left).offset(5);
//        make.right.equalTo(scrollview.mas_right).offset(-5);
//        make.top.equalTo(view2.mas_bottom).offset(5);
////        make.height.equalTo(@50);
//    }];
    #pragma mark -----------------优惠购买及商品资讯-----------------------
    UIButton *telBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [telBtn setTitle:@"联系卖家" forState:UIControlStateNormal];
    telBtn.backgroundColor = [UIColor whiteColor];
    [telBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:telBtn];
    [telBtn addTarget:self action:@selector(telBtnAtNow) forControlEvents:UIControlEventTouchUpInside];
    [telBtn mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right).offset(-Width*2/3);
        make.height.equalTo(@44);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
    
    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [addBtn setTitle:@"加入购物车" forState:UIControlStateNormal];
    addBtn.backgroundColor = [UIColor colorWithRed:253/255.0 green:198/255.0 blue:101/255.0 alpha:1];
    [addBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:addBtn];
    [addBtn addTarget:self action:@selector(AddShopCar) forControlEvents:UIControlEventTouchUpInside];
    [addBtn mas_makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(self.view.mas_right).offset(-Width/3);
        make.left.equalTo(telBtn.mas_right);
        make.height.equalTo(@44);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
    


    UIButton *buyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [buyBtn setTitle:@"立即购买" forState:UIControlStateNormal];
    buyBtn.backgroundColor = [UIColor orangeColor];
    [buyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:buyBtn];
    [buyBtn addTarget:self action:@selector(BuyAtNow) forControlEvents:UIControlEventTouchUpInside];
    [buyBtn mas_makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(self.view.mas_right);
        make.left.equalTo(addBtn.mas_right);
        make.height.equalTo(@44);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
    
    
   

}
- (void)telBtnAtNow{

}

-(void)CreatView
{
    
    NSString *imgStr = [NSString stringWithFormat:@"http://jiazhuang.siruoit.com/attachs/%@",dict[@"data"][0][@"photo"]];
    UIImageView *imgV =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, Width, 350)];
    imgV.backgroundColor = [UIColor blueColor];
    [imgV sd_setImageWithURL:[NSURL URLWithString:imgStr] placeholderImage:[UIImage imageNamed:@"photo"]];
//    scrollview.contentSize = CGSizeMake([dict[@"data"][0][@"photo"] count]-1*Width, 0);
    [scrollview addSubview:imgV];
    
    titlelab.text = dict[@"data"][0][@"name"];
    NSString *priceStr =[NSString stringWithFormat:@"¥%@",dict[@"data"][0][@"price"]];
    pricelab.text =  priceStr;
    
    NSString *market_priceStr = [NSString stringWithFormat:@"价格:¥%@",dict[@"data"][0][@"market_price"]];
    market_pricelab.text = market_priceStr;

    NSString *adressStr = [NSString stringWithFormat:@"%@:%@",dict[@"data"][0][@"city"],dict[@"data"][0][@"area"]];
    adress.text = adressStr;
    
    NSString *cateStr = [NSString stringWithFormat:@"分类:%@",dict[@"data"][0][@"cate"]];
    catelab.text = cateStr;
    
    
    //店铺信息
    
    NSString *logoimagVStr = [NSString stringWithFormat:@"http://jiazhuang.siruoit.com/attachs/%@",dict[@"data"][0][@"shop"][0][@"logo"]];
    [logoimagV sd_setImageWithURL:[NSURL URLWithString:logoimagVStr] placeholderImage:[UIImage imageNamed:@"logoimagV"]];
    
    shopname.text = dict[@"data"][0][@"shop"][0][@"name"];
    
    NSString *phoneStr = [NSString stringWithFormat:@"座机:%@",dict[@"data"][0][@"shop"][0][@"phone"]];
    phonelab.text = phoneStr;
    
    NSString *shopaddressStr = [NSString stringWithFormat:@"地址:%@",dict[@"data"][0][@"shop"][0][@"addr"]];
    shopaddress.text =shopaddressStr;
    
    NSString *shopinfoStr = [NSString stringWithFormat:@"店铺信息:%@",dict[@"data"][0][@"shop"][0][@"info"]];
    shopinfo.text = shopinfoStr;
    
    CGRect rectToFit = [shopinfoStr boundingRectWithSize:CGSizeMake(240.0f, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:12.0f]} context:nil];

    shopinfo.frame = CGRectMake(5, 520, Width-10, rectToFit.size.height);
    
    scrollView.contentSize =CGSizeMake(0, 520+rectToFit.size.height+20);

}
-(void)ProductDetail
{
    NSString *str=[NSString stringWithFormat:@"http://jiazhuang.siruoit.com/index.php?api/api-detail/%@",self.product_idStr];
    
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
        


        dict = [NSJSONSerialization  JSONObjectWithData:datas options:NSJSONReadingMutableContainers error:&ERR];
        NSLog(@"获取到的数据为：%@",dict);


        [self CreatView];
    }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"发生错误！%@",error);
    }];
    // 加入队列
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperation:operation];
}

-(void)BuyAtNow
{
//    [MBProgressHUD showError:@"未登录!"];
}
-(void)AddShopCar
{
//    [MBProgressHUD showError:@"未登录!"];
    [self createCommodityView];
    
    

}
//商品详情
- (void)createCommodityView{
    
    _bgView = [[UIView alloc] initWithFrame:CGRectMake(0, Height/2, Width, Height/2)];
    _bgView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_bgView];
    
    UIButton *deletBtn = [[UIButton alloc] initWithFrame:CGRectMake(Width - 30 ,0, 30, 30)];
    deletBtn.backgroundColor = [UIColor orangeColor];
    [deletBtn setTitle:@"X" forState:UIControlStateNormal];
    [deletBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [deletBtn addTarget:self action:@selector(deletBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [_bgView addSubview:deletBtn];
    
    
    UIButton *confirmBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, _bgView.frame.size.height - 40, Width, 40)];
    confirmBtn.backgroundColor = [UIColor orangeColor];
    [confirmBtn setTitle:@"确认" forState:UIControlStateNormal];
    [confirmBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [confirmBtn addTarget:self action:@selector(confirmBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [_bgView addSubview:confirmBtn];
    
    UIImageView *imageV = [[UIImageView alloc]initWithFrame:CGRectMake(20, 20, (Width - 40)/3, (Width - 40)/3)];
    NSString *imgStr = [NSString stringWithFormat:@"http://jiazhuang.siruoit.com/attachs/%@",dict[@"data"][0][@"photo"]];
    [imageV sd_setImageWithURL:[NSURL URLWithString:imgStr] placeholderImage:[UIImage imageNamed:@"photo"]];
    [_bgView addSubview:imageV];
    
    UILabel *titleLab = [[UILabel alloc]initWithFrame:CGRectMake(20 +CGRectGetMaxX(imageV.frame), 30, Width - (20+CGRectGetMaxX(imageV.frame)), (Width - 40)/3)];
    titleLab.backgroundColor = [UIColor whiteColor];
    titleLab.text = [NSString stringWithFormat:@"%@",dict[@"data"][0][@"name"]];
    titleLab.numberOfLines = 0;
    titleLab.lineBreakMode = NSLineBreakByWordWrapping;
    [_bgView addSubview:titleLab];
    
    UILabel *priceLab = [[UILabel alloc]initWithFrame:CGRectMake(30, 10+CGRectGetMaxY(imageV.frame), 200, 25)];
    priceLab.backgroundColor = [UIColor whiteColor];
    priceLab.text = [NSString stringWithFormat:@"单价:%@",dict[@"data"][0][@"price"]];
    [_bgView addSubview:priceLab];
    
    UILabel *numLab = [[UILabel alloc]initWithFrame:CGRectMake(30, 10+CGRectGetMaxY(priceLab.frame), 70, 25)];
    numLab.backgroundColor = [UIColor whiteColor];
    numLab.text = @"购买数量 ";
    [_bgView addSubview:numLab];
    
    UIButton *addBtn = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(numLab.frame)+5, 10+CGRectGetMaxY(priceLab.frame) - 3 , 30, 30)];
    
    [addBtn setImage:[UIImage imageNamed:@"cart_addBtn_nomal"] forState:UIControlStateNormal];
    [addBtn setImage:[UIImage imageNamed:@"cart_addBtn_highlight"] forState:UIControlStateHighlighted];
    [addBtn addTarget:self action:@selector(addNum) forControlEvents:UIControlEventTouchUpInside];
    [_bgView addSubview:addBtn];
    
    _numberLab = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(addBtn.frame) , 10+CGRectGetMaxY(priceLab.frame)- 3, 50, 30)];
    _numberLab.backgroundColor = [UIColor whiteColor];
    _numberLab.textAlignment = NSTextAlignmentCenter;
    _numberLab.text = @"1";
    [_bgView addSubview:_numberLab];
    
    UIButton *minusBtn = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_numberLab.frame), 10+CGRectGetMaxY(priceLab.frame) - 3 , 30, 30)];
    
    [minusBtn setImage:[UIImage imageNamed:@"cart_cutBtn_nomal"] forState:UIControlStateNormal];
    [minusBtn setImage:[UIImage imageNamed:@"cart_cutBtn_highlight"] forState:UIControlStateHighlighted];
    [minusBtn addTarget:self action:@selector(minusNum) forControlEvents:UIControlEventTouchUpInside];
    [_bgView addSubview:minusBtn];
    
    
    
    
}

- (void)confirmBtnAction:(UIButton *)sender{
    
}

- (void)deletBtnAction:(UIButton *)sender{
    [_bgView removeFromSuperview];
    
}

- (void)addNum{
    
    NSInteger count = [_numberLab.text integerValue];
    count++;
    NSString *numStr = [NSString stringWithFormat:@"%ld",(long)count];
    _numberLab.text = numStr;
    
    
}

- (void)minusNum{
    
    NSInteger count = [_numberLab.text integerValue];
    count--;
    NSString *numStr = [NSString stringWithFormat:@"%ld",(long)count];
    if (count<1) {
        _numberLab.text = @"1";
    }else{
        _numberLab.text = numStr;
    }
    
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
