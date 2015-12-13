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
    
    //  初始化导航条，创建左边和右边的按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"navigationbar_friendsearch"] style:UIBarButtonItemStylePlain target:nil action:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}


@end
