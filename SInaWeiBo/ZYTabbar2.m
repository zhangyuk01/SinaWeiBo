//
//  ZYTabbar2.m
//  SInaWeiBo
//
//  Created by huahua on 11/17/15.
//  Copyright (c) 2015 张瑜. All rights reserved.
//

#import "ZYTabbar2.h"
#import "ZYTabBarButton.h"

@interface ZYTabbar2 ()
@property(nonatomic, strong) ZYTabBarButton *currentButton;
@property(nonatomic, weak) UIButton *plusBtn;
@end


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
    self.backgroundColor = [UIColor whiteColor];
    // 1. 添加4个按钮 -> 会根据每个controller的创建完成
    
    // 2. 添加菊花
    [self addPlusBtn];
}


- (void) addPlusBtn
{
    UIButton *plusBtn = [[UIButton alloc] init];
    plusBtn.tag = 998;
    [plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
    [plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlEventTouchUpInside];
    [plusBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
    [plusBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
    [self addSubview:plusBtn];
    self.plusBtn = plusBtn;
}


- (void) addItem:(UITabBarItem *)item
{
    // 创建选项卡按钮
    ZYTabBarButton *btn = [[ZYTabBarButton alloc] init];
    [btn setTitle:item.title forState:UIControlStateNormal];
    [btn  setImage:item.image forState:UIControlStateNormal];
    [btn setImage:item.selectedImage forState:UIControlStateSelected];
    [btn addTarget:self action:@selector(btnOnClick:) forControlEvents:UIControlEventTouchDown];
    [self addSubview:btn];
   
}


- (void) btnOnClick:(ZYTabBarButton *)btn
{
    // 1. 设置切换按钮的状态
    self.currentButton.selected = NO;
    btn.selected = YES;
    self.currentButton = btn;
    // 2. 切换控制器
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    NSUInteger index = 0;
    for (UIView *child in self.subviews) {
        if (child.tag != 998) {
           if ( index == 0) {
               [self btnOnClick:(ZYTabBarButton *)child];
            }
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
    self.plusBtn.size = self.plusBtn.currentBackgroundImage.size;
    self.plusBtn.centerX = self.width*0.5;
    self.plusBtn.centerY = self.height*0.5;
}


@end
