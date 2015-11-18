//
//  ZYTabBar.m
//  SInaWeiBo
//
//  Created by huahua on 11/17/15.
//  Copyright (c) 2015 张瑜. All rights reserved.
//

#import "ZYTabBar.h"

@interface ZYTabBar()

// jiahao
@property(nonatomic, weak) UIButton *plusBtn;

@end


@implementation ZYTabBar


- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setUp];
    }
    return  self;
}



- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}


- (void) setUp
{
    UIButton *plusBtn = [[UIButton alloc] init];
    [plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
    [plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlEventTouchUpInside];
    [plusBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
    [plusBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
    [self addSubview:plusBtn];
    self.plusBtn = plusBtn;
}



// 当子布局改变的时候会调用这个方法，也可以直接调用这个方法，来进行改变布局
- (void)layoutSubviews
{
   [super layoutSubviews];
    NSUInteger index = 0;
    for (UIView *child in self.subviews) {
      /** 这个地方要进行判断，为什么呢？因为tabar里面有多个多个button，分割线，还有背景图片
        我们只要对tabbarbutton来进行一些设置 , 根据类型来进行判断
      */
        if ([child isKindOfClass:[UIControl class]] && ![child isKindOfClass:[UIButton class]]) {
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
        
        self.plusBtn.size = self.plusBtn.currentBackgroundImage.size;
        self.plusBtn.centerX = self.width*0.5;
        self.plusBtn.centerY = self.height*0.5;
    }
   
    
}
@end
