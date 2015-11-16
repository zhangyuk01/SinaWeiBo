//
//  ZYTabbarController.m
//  SInaWeiBo
//
//  Created by 张瑜 on 15/11/16.
//  Copyright (c) 2015年 张瑜. All rights reserved.
//

#import "ZYTabbarController.h"

@interface ZYTabbarController ()

@end

@implementation ZYTabbarController

- (instancetype)init
{
    if (self = [super init]) {
        DDLogDebug(@"%d %s",__LINE__,__func__);
    }
    return self;
}



- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if(self = [super initWithNibName:nibBundleOrNil bundle:nibBundleOrNil]) {
        // 5.添加子控制器
        UIViewController *home = [self addControllerWithClass:[UIViewController class] title:@"首页" image:@"tabbar_home" selectedImage:@"tabbar_home_selected"];
        UIViewController *message = [self addControllerWithClass:[UIViewController class] title:@"消息" image:@"tabbar_message_center" selectedImage:@"tabbar_message_center_selected"];
        UIViewController *discover = [self addControllerWithClass:[UIViewController class] title:@"发现" image:@"tabbar_discover" selectedImage:@"tabbar_discover_selected"];
        UIViewController *profile = [self addControllerWithClass:[UIViewController class] title:@"我" image:@"tabbar_profile" selectedImage:@"tabbar_profile_selected"];
         self.viewControllers = @[home,message,discover,profile];
    }
    
    return self;
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


- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
