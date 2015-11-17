//
//  ZYTabBar.m
//  SInaWeiBo
//
//  Created by huahua on 11/17/15.
//  Copyright (c) 2015 张瑜. All rights reserved.
//

#import "ZYTabBar.h"

@implementation ZYTabBar

// 当子布局改变的时候会调用这个方法，也可以直接调用这个方法，来进行改变布局
- (void)layoutSubviews
{
   [super layoutSubviews];
    NSUInteger index = 0;
    for (UIView *child in self.subviews) {
      /** 这个地方要进行判断，为什么呢？因为tabar里面有多个多个button，分割线，还有背景图片
        我们只要对tabbarbutton来进行一些设置 , 根据类型来进行判断
      */
        if ([child isKindOfClass:[UIControl class]]) {
            CGFloat childW = self.frame.size.width / 5;
            CGFloat childH = self.frame.size.height;
            CGFloat childX = index*childW;
            CGFloat childY = 0;
            if (index == 2) {
                index ++;
                childX = index*childW;
            }
            child.frame = CGRectMake(childX, childY, childW, childH);
            index ++;
       }
    }
}
@end
