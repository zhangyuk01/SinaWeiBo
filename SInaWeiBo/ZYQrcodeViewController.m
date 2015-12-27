//
//  ZYQrcodeViewController.m
//  SInaWeiBo
//
//  Created by 张瑜 on 15/12/20.
//  Copyright (c) 2015年 张瑜. All rights reserved.
//

#import "ZYQrcodeViewController.h"

@interface ZYQrcodeViewController ()

@end

@implementation ZYQrcodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.tabBarItem.image = [UIImage imageNamed:@"qrcode_tabbar_icon_qrcode"];
    self.navigationController.tabBarItem.selectedImage = [UIImage imageNamed:@"qrcode_tabbar_icon_qrcode_highlighted"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
