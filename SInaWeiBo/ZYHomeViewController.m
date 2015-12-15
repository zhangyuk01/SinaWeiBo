//
//  ZYHomeViewController.m
//  SInaWeiBo
//
//  Created by 张瑜 on 15/12/13.
//  Copyright (c) 2015年 张瑜. All rights reserved.
//

#import "ZYHomeViewController.h"

@interface ZYHomeViewController ()

@end

@implementation ZYHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    // 创建leftbarbuttonitem
    self.navigationItem.leftBarButtonItem = [self itemWithImage:@"navigationbar_friendsearch" action:@selector(friendSearch) highImage:@"navigationbar_friendsearch_highlighted"];
   
    // 创建右边的button
    self.navigationItem.rightBarButtonItem = [self itemWithImage:@"navigationbar_pop" action:@selector(scan) highImage:@"navigationbar_pop_highlighted"];
    
    
}

- (void) friendSearch{

}

- (void) scan{
}


// 抽取方法，创建navigationItem上面的left 和 right
- (UIBarButtonItem *) itemWithImage:(NSString *) image action:(SEL)action highImage:(NSString *)highImage{
    UIButton *btn = [[UIButton alloc] init];
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    // 给btn添加一个位置 比较特殊
    btn.size = btn.currentImage.size;
    // 给btn 添加点击事件,但是不能处理点击事件的方法都相同吧，所以可以穿进来一个方法
    [btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
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
