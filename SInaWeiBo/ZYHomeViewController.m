//
//  ZYHomeViewController.m
//  SInaWeiBo
//
//  Created by 张瑜 on 15/12/13.
//  Copyright (c) 2015年 张瑜. All rights reserved.
//

#import "ZYHomeViewController.h"
#import "ZYScanViewController.h"
#import "ZYTitleButton.h"

@interface ZYHomeViewController ()

@end

@implementation ZYHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    // 创建leftbarbuttonitem
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"navigationbar_friendsearch" target:self action:@selector(friendSearch) highImage:@"navigationbar_friendsearch_highlighted"];
   
    // 创建右边的button
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:@"navigationbar_pop" target:self action:@selector(scan) highImage:@"navigationbar_pop_highlighted"];
    
   
    // 1.设置button的标题
    ZYTitleButton *titleBtn = [[ZYTitleButton alloc] init];
    self.navigationItem.titleView = titleBtn;
    
    // 2.给button进行赋值
    [titleBtn setTitle:@"首页" forState:UIControlStateNormal];
    [titleBtn setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
    [titleBtn setImage:[UIImage imageNamed:@"navigationbar_arrow_up"] forState:UIControlStateSelected];
    
    // 3.设置图片没有显示，估计是frame的问题,调用sizetofit这个方法，解决问题
    [titleBtn sizeToFit];
    
    
    [titleBtn addTarget:self action:@selector(titleBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
}



// 实现点击切换图片
- (void) titleBtnClick:(ZYTitleButton *) titleBtn{
    
    // 1. 设置点一下切换图片
    titleBtn.selected = !titleBtn.selected;
   
    // 2.1 弹出菜单
    UIImageView *menuView = [[UIImageView alloc] init];
    UIImage *image = [UIImage imageNamed:@"popover_background"];
    menuView.image = image;
    
    // 2.2 添加菜单内容
    UITableView *tb = [[UITableView alloc] init];
    tb.size = CGSizeMake(217, 350);
    
    tb.x = 15;
    tb.y = 18;
    [menuView addSubview:tb];
    
    menuView.frame = CGRectMake(0, 64-10, CGRectGetMaxX(tb.frame)+tb.x, CGRectGetMaxY(tb.frame)+tb.y);
    [self.navigationController.view addSubview:menuView];
    menuView.centerX = [UIScreen mainScreen].bounds.size.width*0.5;
    
}

- (void) friendSearch{
    NSLog(@"search");
}

- (void) scan{
    NSLog(@"scan");
    
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName: @"ZYScanViewController" bundle:nil];
    ZYScanViewController *sc = [sb instantiateInitialViewController];
    [self presentViewController:sc animated:YES completion:nil];
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}


@end
