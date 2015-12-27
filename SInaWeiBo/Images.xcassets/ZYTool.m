//
//  ZYTool.m
//  SInaWeiBo
//
//  Created by 张瑜 on 15/12/16.
//  Copyright (c) 2015年 张瑜. All rights reserved.
//

#import "ZYTool.h"

@implementation ZYTool


// 抽取方法，创建navigationItem上面的left 和 right
+ (UIBarButtonItem *) itemWithImage:(NSString *) image target:(id)target action:(SEL)action highImage:(NSString *)highImage{
    UIButton *btn = [[UIButton alloc] init];
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    // 给btn添加一个位置 比较特殊
    btn.size = btn.currentImage.size;
    // 给btn 添加点击事件,但是不能处理点击事件的方法都相同吧，所以可以穿进来一个方法
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}
@end
