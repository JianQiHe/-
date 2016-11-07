//
//  GroupShopDetailViewController.m
//  家装
//
//  Created by mac on 16/8/1.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "GroupShopDetailViewController.h"
#import "GroupShopDetailTableViewCell.h"
#import "NJRequsets.h"
@interface GroupShopDetailViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tabview;
@property (nonatomic,strong) UIView *headview;

@end

@implementation GroupShopDetailViewController
{
    int i ;
    NSArray *arr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"小区楼盘";
    self.view.backgroundColor = [UIColor whiteColor];
    i = [self.NumberStr intValue];

    self.tabview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, Width, Height) style:UITableViewStyleGrouped];
    self.tabview.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:self.tabview];
    self.tabview.delegate = self;
    self.tabview.dataSource = self;
    
    self.tabview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self initTableHeaderView];
    arr = [[NSArray alloc]initWithObjects:@"楼盘详情",@"设计方案",@"实景图",@"户型图",@"样板间",@"在建工地",nil];
    
    
    self.tabview.estimatedRowHeight = 44.0f;
    self.tabview.rowHeight = UITableViewAutomaticDimension;
    // Do any additional setup after loading the view.
}
-(void)initTableHeaderView
{
    self.headview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Width,165)];
//    self.headview.backgroundColor = [UIColor colorWithRed:249/255 green:249/255 blue:244/255 alpha:0.01];
    self.headview.backgroundColor = [UIColor whiteColor];
    self.tabview.tableHeaderView = self.headview;
    
    UIImageView *imagV = [[UIImageView alloc]init];
    NSString *imagVStr = [NSString stringWithFormat:@"%@%@",PhotoUrl,self.dict2[@"home_list"][i][@"thumb"]];
    [imagV sd_setImageWithURL:[NSURL URLWithString:imagVStr] placeholderImage:nil];
    [self.headview addSubview:imagV];
    [imagV mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.headview.mas_left).offset(5);
        make.top.equalTo(self.headview.mas_top).offset(5);
        make.bottom.equalTo(self.headview.mas_bottom).offset(-40);
        make.width.equalTo(@(Width/2));
    }];
    
    UILabel *namelab = [[UILabel alloc]init];
    [self.headview addSubview:namelab];
    namelab.textAlignment = NSLineBreakByTruncatingTail;
    namelab.textColor = [UIColor blackColor];
    namelab.font = [UIFont systemFontOfSize:12];
    NSString *nameStr = [NSString stringWithFormat:@"小区名称:%@",self.dict2[@"home_list"][i][@"name"]];
    namelab.text = nameStr;
    [namelab mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.headview.mas_left).offset(5);
        make.top.equalTo(imagV.mas_bottom).offset(5);
        make.height.equalTo(@15);
        make.right.equalTo(self.headview.mas_right).offset(5);
    }];

    
    
    
    //楼盘地址
    UILabel *addrlab = [[UILabel alloc]init];
    [self.headview addSubview:addrlab];
    addrlab.textAlignment = NSLineBreakByTruncatingTail;
    addrlab.textColor = [UIColor blackColor];
    addrlab.font = [UIFont systemFontOfSize:12];
    NSString *addrStr = [NSString stringWithFormat:@"楼盘地址:%@",self.dict2[@"home_list"][i][@"addr"]];
    addrlab.text = addrStr;
    [addrlab mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.headview.mas_left).offset(5);
        make.top.equalTo(namelab.mas_bottom).offset(5);
        make.height.equalTo(@15);
        make.right.equalTo(self.headview.mas_right).offset(5);
    }];
    
    
    
    
    //开发商
    UILabel *kfslab = [[UILabel alloc]init];
    [self.headview addSubview:kfslab];
    kfslab.textAlignment = NSLineBreakByTruncatingTail;
    kfslab.textColor = [UIColor blackColor];
    kfslab.font = [UIFont systemFontOfSize:11];
    NSString *kfsStr = [NSString stringWithFormat:@"开发商:%@",self.dict2[@"home_list"][i][@"kfs"]];
    kfslab.text = kfsStr;
    [kfslab mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(imagV.mas_right).offset(5);
        make.top.equalTo(imagV.mas_top);
        make.height.equalTo(@20);
        make.right.equalTo(self.headview.mas_right).offset(-5);
    }];

    //参考价
    UILabel *cankaolab1 = [[UILabel alloc]init];
    [self.headview addSubview:cankaolab1];
    cankaolab1.textColor = [UIColor blackColor];
    cankaolab1.text = @"参考价:";
    cankaolab1.font = [UIFont systemFontOfSize:11];
    [cankaolab1 mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(imagV.mas_right).offset(5);
        make.top.equalTo(kfslab.mas_bottom);
        make.width.equalTo(@40);
        make.height.equalTo(@20);
    }];
    
    
    UILabel *cankaolab = [[UILabel alloc]init];
    [self.headview addSubview:cankaolab];
    cankaolab.textAlignment = NSLineBreakByTruncatingTail;
    cankaolab.textColor = [UIColor redColor];
    cankaolab.font = [UIFont systemFontOfSize:11];
    NSString *cankaoStr = [NSString stringWithFormat:@"%@元／平方米",self.dict2[@"home_list"][i][@"price"]];
    cankaolab.text = cankaoStr;
    [cankaolab mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(cankaolab1.mas_right);
        make.top.equalTo(cankaolab1.mas_top);
        make.height.equalTo(@20);
        make.right.equalTo(self.headview.mas_right).offset(-5);
    }];
    
    
    UILabel *kptimelab = [[UILabel alloc]init];
    [self.headview addSubview:kptimelab];
    kptimelab.textAlignment = NSLineBreakByTruncatingTail;
    kptimelab.textColor = [UIColor blackColor];
    kptimelab.font = [UIFont systemFontOfSize:11];
    NSString *kptimeStr = [NSString stringWithFormat:@"开盘时间:%@",self.dict2[@"home_list"][i][@"kp_date"]];
    kptimelab.text = kptimeStr;
    [kptimelab mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(imagV.mas_right).offset(5);
        make.top.equalTo(cankaolab.mas_bottom);
        make.height.equalTo(@20);
        make.right.equalTo(self.headview.mas_right).offset(-5);
    }];
    
    
    UILabel *jftimelab = [[UILabel alloc]init];
    [self.headview addSubview:jftimelab];
    jftimelab.textAlignment = NSLineBreakByTruncatingTail;
    jftimelab.textColor = [UIColor blackColor];
    jftimelab.font = [UIFont systemFontOfSize:11];
    NSString *jftimeStr = [NSString stringWithFormat:@"竣工时间:%@",self.dict2[@"home_list"][i][@"jf_date"]];
    jftimelab.text = jftimeStr;
    [jftimelab mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(imagV.mas_right).offset(5);
        make.top.equalTo(kptimelab.mas_bottom);
        make.height.equalTo(@20);
        make.right.equalTo(self.headview.mas_right).offset(-5);
    }];
    
    
    UILabel *qqqunlab = [[UILabel alloc]init];
    [self.headview addSubview:qqqunlab];
    qqqunlab.textAlignment = NSLineBreakByTruncatingTail;
    qqqunlab.textColor = [UIColor blackColor];
    qqqunlab.font = [UIFont systemFontOfSize:11];
    NSString *qqqunStr = [NSString stringWithFormat:@"本楼盘QQ群:%@",self.dict2[@"home_list"][i][@"qq_qun"]];
    qqqunlab.text = qqqunStr;
    [qqqunlab mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(imagV.mas_right).offset(5);
        make.top.equalTo(jftimelab.mas_bottom);
        make.height.equalTo(@20);
        make.right.equalTo(self.headview.mas_right).offset(-5);
    }];
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"申请免费设计" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor colorWithRed:82/255.0 green:82/255.0 blue:82/255.0 alpha:1];
    [btn addTarget:self action:@selector(Clickbtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.headview addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(imagV.mas_right).offset(5);
        make.width.equalTo(@120);
        make.bottom.equalTo(imagV.mas_bottom);
        make.height.equalTo(@20);
    }];
    
    
    
    UILabel *linelab = [[UILabel alloc]init];
    [self.headview addSubview:linelab];
    linelab.backgroundColor = [UIColor lightGrayColor];
    [linelab mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.headview.mas_left).offset(10);
        make.right.equalTo(self.headview.mas_right).offset(-10);
        make.top.equalTo(addrlab.mas_bottom).offset(5);
        make.height.equalTo(@1);
    }];
}

-(void)Clickbtn:(UIButton *)button
{
    UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"该功能暂时无法使用" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
    
    [myAlertView show];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    return 30;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.00001;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section) {
            
        case 0:
            return [arr objectAtIndex:section];//提取标题数组的元素用来显示标题
        case 1:
            return [arr objectAtIndex:section];//提取标题数组的元素用来显示标题
        case 2:
            return [arr objectAtIndex:section];
        case 3:
            return [arr objectAtIndex:section];
        case 4:
            return [arr objectAtIndex:section];
        case 5:
            return [arr objectAtIndex:section];
        default:
            return @"Unknown";
            
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 1;
}




- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

        return UITableViewAutomaticDimension;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"GroupShopDetailTableViewCell";
    GroupShopDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell)
    {
        cell = [[GroupShopDetailTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.backgroundColor = [UIColor lightGrayColor];
    if(indexPath.section==0)
    {
    cell.lab.text = self.dict2[@"home_list"][i][@"content"];
    }else
    {
    }
    
    return cell;
}


-(void) tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
    if ([view isKindOfClass: [UITableViewHeaderFooterView class]]) {
        UITableViewHeaderFooterView* castView = (UITableViewHeaderFooterView*) view;
        UIView* content = castView.contentView;
        UIColor* color = [UIColor whiteColor]; // substitute your color here
        content.backgroundColor = color;
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
