//
//  AppDelegate.m
//  家装
//
//  Created by mac on 16/5/3.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import "ShopViewController.h"
#import "ShangjiaViewController.h"
#import "SCViewController.h"
#import "MineViewController.h"
#import "CartViewController.h"
#import "ShangJiaViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate
{
    NSData* data;
    id dict;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [UIApplication sharedApplication];
//    self.login = @"我日死你的吗";
    
    [SMSSDK registerApp:@"140de0dda3b9e"
             withSecret:@"3c1cd8a449fce5d956a14ed0c4efa4f7"];
    
    
    HomeViewController *first = [[HomeViewController alloc]init];
    
    
    
    
    
    //    首页
    
    
    UINavigationController *firstnavigation = [[UINavigationController alloc]initWithRootViewController:first];
    firstnavigation.tabBarItem.image = [[UIImage imageNamed:@"shouye_no.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    firstnavigation.tabBarItem.selectedImage = [[UIImage imageNamed:@"shouye_yes.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    firstnavigation.tabBarItem.imageInsets = UIEdgeInsetsMake(8, 5, -8, -5);
    first.title = @"首页";

  
    //  商城
    
    
    ShopViewController *second = [[ShopViewController alloc]init];
    UINavigationController *secondnavigation = [[UINavigationController alloc]initWithRootViewController:second];
    second.tabBarItem.image = [[UIImage imageNamed:@"shangcheng_no"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    second.tabBarItem.selectedImage = [[UIImage imageNamed:@"shangcheng_yse"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    second.title = @"商城";
    
    //商家
    ShangJiaViewController *third = [[ShangJiaViewController alloc]init];
    
    UINavigationController *thirdnavigation = [[UINavigationController alloc]initWithRootViewController:third];
    third.tabBarItem.image = [[UIImage imageNamed:@"shangjia_no"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    third.tabBarItem.selectedImage = [[UIImage imageNamed:@"shangjia_yes"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    third.title = @"商家";

    
    
    //购物车
    
    CartViewController *four = [[CartViewController alloc]init];
    UINavigationController *fourthnavigation = [[UINavigationController alloc]initWithRootViewController:four];
    four.tabBarItem.image = [[UIImage imageNamed:@"gouwuche_no"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    four.tabBarItem.selectedImage = [[UIImage imageNamed:@"gouwuche_yes"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    four.title = @"购物车";
    

    
    MineViewController *five = [[MineViewController alloc]init];
    UINavigationController *fifthnavigation = [[UINavigationController alloc]initWithRootViewController:five];
    five.tabBarItem.image = [[UIImage imageNamed:@"wode_no"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    five.tabBarItem.selectedImage = [[UIImage imageNamed:@"wode_yes"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    five.title = @"我的";
    
    
    NSArray *array = @[firstnavigation,secondnavigation,thirdnavigation,fourthnavigation,fifthnavigation];
    UITabBarController *tabbar = [[UITabBarController alloc]init];
    

    
//    导航背景颜色
    [UINavigationBar appearance].barTintColor=[UIColor colorWithRed:32/255.0 green:151/255.0 blue:117/255.0 alpha:1];

    //导航背景字体颜色
//        [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:32/255.0 green:151/255.0 blue:117/255.0 alpha:1]];
    
    
    //@{}代表Dictionary
    
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    tabbar.viewControllers = array;
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    //    tabbar
    self.window.rootViewController = tabbar;
    tabbar.tabBar.tintColor = [UIColor blackColor];
    [self.window makeKeyAndVisible];

    
//    
//    NSString *str=[NSString stringWithFormat:@"http://jiazhuang.siruoit.com/index.php?api/api-login/0/shyclcy@126.com/123456"];
//    
//    NSURL *url = [NSURL URLWithString:[str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];                        // UTF－8
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc]initWithRequest:request];
//    // 请求数据，设置成功与失败的回调函数
//    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSString *html = operation.responseString;
//        data=[html dataUsingEncoding:NSUTF8StringEncoding];
//        dict=[NSJSONSerialization  JSONObjectWithData:data options:0 error:nil];
//        five.dic = dict[@"data"][0][@"uid"];
//        NSLog(@"获取到的数据为1111：%@",dict);
//        NSLog(@"sss:%@",dict[@"data"][0][@"uid"]);
//        
//        
//        
//    }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"发生错误！%@",error);
//    }];
//    // 加入队列
//    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
//    [queue addOperation:operation];

    
    
    //    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
    
    
    //                                                       [UIColor grayColor], UITextAttributeTextColor,
    
    
    //                                                       nil] forState:UIControlStateNormal];
    
    
    //    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
    
    
    //                                                       [UIColor blackColor], UITextAttributeTextColor,
    
    
    //                                                       nil] forState:UIControlStateSelected];
    
    
    //
    
    
    
    
    
    
    
    
    
    
    //    __block int timeout=60; //倒计时时间
    //
    //    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //
    //    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    //
    //    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    //
    //    dispatch_source_set_event_handler(_timer, ^{
    //
    //        if(timeout<=0){ //倒计时结束，关闭
    //
    //            dispatch_source_cancel(_timer);
    //
    //            dispatch_async(dispatch_get_main_queue(), ^{
    //
    //                //设置界面的按钮显示 根据自己需求设置
    //
    //                [GetVerification setTitle:@"获取验证码" forState:UIControlStateNormal];
    //
    //                GetVerification.userInteractionEnabled = YES;
    //
    //            });
    //
    //        }else{
    //
    //            //            int minutes = timeout / 60;
    //
    //            int seconds = timeout % 61;
    //
    //            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
    //
    //            dispatch_async(dispatch_get_main_queue(), ^{
    //
    //                //设置界面的按钮显示 根据自己需求设置
    //
    //                //                NSLog(@"____%@",strTime);
    //                if (PhoneNumber.text==nil) {
    //
    //                    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"请输入正确的手机号码" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
    //                    [alertView show];
    //
    //                }else{
    //
    //                [GetVerification setTitle:[NSString stringWithFormat:@"%@秒后重新发送",strTime] forState:UIControlStateNormal];
    //
    //                [GetVerification setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    //                [GetVerification setBackgroundColor:[UIColor whiteColor]];
    //                GetVerification.userInteractionEnabled = NO;
    //
    //                }
    //
    //
    //            });
    //
    //            timeout--;
    //
    //        }
    //
    //    });
    //
    //    dispatch_resume(_timer);
    //
    //
    //
    //    [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:PhoneNumber.text zone:@"86" customIdentifier:nil result:^(NSError *error) {
    //        if (!error) {
    //            
    //        }
    //        else{
    //            
    //            NSLog(@"%@",error);
    //            
    //        }
    //    }];
    //

        return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    //推送通知
//    NSString *ABC = @"我是来测试的啊";
//    [[NSNotificationCenter defaultCenter]postNotificationName:@"AppDidEnterBackground" object:ABC];
//    
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
//    NSString *abc = @"我也是来测试的啊";
//    [[NSNotificationCenter defaultCenter]postNotificationName:@"AppWillEnterForeground" object:abc];
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    
    
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
