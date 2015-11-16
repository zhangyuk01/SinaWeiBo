//
//  AppDelegate.m
//  SInaWeiBo
//
//  Created by 张瑜 on 15/11/15.
//  Copyright (c) 2015年 张瑜. All rights reserved.
//

#import "AppDelegate.h"
#import "ZYTabbarController.h"

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
    ZYTabbarController *tb = [[ZYTabbarController alloc] init];
    self.window.rootViewController = tb;
    
    [self.window makeKeyAndVisible];
    return YES;
    
    
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
