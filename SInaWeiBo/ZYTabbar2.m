//
//  ZYTabbar2.m
//  SInaWeiBo
//
//  Created by huahua on 11/17/15.
//  Copyright (c) 2015 张瑜. All rights reserved.
//

#import "ZYTabbar2.h"
#import "ZYTabBarButton.h"

@implementation ZYTabbar2


- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setUp];
    }
    return self;
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
    self.backgroundColor = [UIColor redColor];
}


- (void) addItem:(UITabBarItem *)item
{
    
    // 创建选项卡按钮
    ZYTabBarButton *btn = [[ZYTabBarButton alloc] init];
    [btn setTitle:item.title forState:UIControlStateNormal];
    [btn  setImage:item.image forState:UIControlStateNormal];
    [btn setImage:item.selectedImage forState:UIControlStateSelected];
    
    [self addSubview:btn];
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    NSUInteger index = 0;
    for (UIView *child in self.subviews) {
        
            CGFloat childW = self.frame.size.width / 5;
            CGFloat childH = self.frame.size.height;
            CGFloat childX = index*childW;
            CGFloat childY = 0;
            if (index == 2) {
                index ++;
                childX = index*childW;
            }
            index ++;
            child.frame = CGRectMake(childX, childY, childW, childH);
        
        }

}

@end
