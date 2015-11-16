//
//  AppDelegate.m
//  SInaWeiBo
//
//  Created by 张瑜 on 15/11/15.
//  Copyright (c) 2015年 张瑜. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // 1.初始化自定义log,从官方文档中寻找
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    [[DDTTYLogger sharedInstance] setColorsEnabled:YES];
    /** 2.测试自定义log
    DDLogError(@"%s",__func__);
    DDLogWarn(@"%s",__func__);
    DDLogInfo(@"%s",__func__);
    DDLogVerbose(@"%s",__func__);
        3.自定义颜色
    [[DDTTYLogger sharedInstance]  setForegroundColor:[UIColor greenColor] backgroundColor:[UIColor purpleColor] forFlag:DDLogFlagInfo];
    
     */
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor redColor];
    
    // 4.创建根控制器
    UITabBarController *tb = [[UITabBarController alloc] init];
    self.window.rootViewController = tb;
    
    
    // 5.添加子控制器
    UIViewController *home = [self addControllerWithClass:[UIViewController class] title:@"首页" image:@"tabbar_home" selectedImage:@"tabbar_home_selected"];
    UIViewController *message = [self addControllerWithClass:[UIViewController class] title:@"消息" image:@"tabbar_message_center" selectedImage:@"tabbar_message_center_selected"];
    UIViewController *discover = [self addControllerWithClass:[UIViewController class] title:@"发现" image:@"tabbar_discover" selectedImage:@"tabbar_discover_selected"];
    UIViewController *profile = [self addControllerWithClass:[UIViewController class] title:@"我" image:@"tabbar_profile" selectedImage:@"tabbar_profile_selected"];
     tb.viewControllers = @[home,message,discover,profile];
     [self.window makeKeyAndVisible];
     return YES;
    
    
}

// 写一个添加字控制器的方法
- (UIViewController *) addControllerWithClass:(Class)class  title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    UIViewController *vc = [[class alloc] init];
    return [self addControllerWithController:vc title:title image:image selectedImage:selectedImage];
}


// 添加控制器中调用了这个方法
- (UIViewController *) addControllerWithController:(UIViewController *) vc title:(NSString *) title image:(NSString *) image selectedImage:(NSString *) selectedImage
{
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
   
    // 对被选中的图片进行代码编辑
    UIImage *newimage = [UIImage imageNamed:selectedImage];
    newimage = [newimage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.selectedImage = newimage;
    
   
    //
    [vc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor orangeColor]} forState:UIControlStateSelected];
    
    
    
    
    vc.view.backgroundColor = [UIColor greenColor];
    return vc;
}




- (void)applicationWillResignActive:(UIApplication *)application {
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {
}

@end
