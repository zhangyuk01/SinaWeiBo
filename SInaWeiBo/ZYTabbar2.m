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
/**
  用户存储所有的选项卡
 */
@property(nonatomic, strong) NSMutableArray *btns;
@property(nonatomic, weak) UIButton *plusBtn;
@end




@implementation ZYTabbar2

// 懒加载
- (NSMutableArray *)btns
{
    if (!_btns) {
        _btns = [NSMutableArray array];
    }
    return _btns;
}

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
  
    btn.tag = self.btns.count;
    [self.btns addObject:btn];
    
    
    if (self.btns.count == 1) {
        [self btnOnClick:btn];
    }
   
}


- (void) btnOnClick:(ZYTabBarButton *)btn
{
    // 2. 切换控制器
    if ([self.delegate respondsToSelector:@selector(tabBar:selectedBtnFrom:to:)]) {
        [self.delegate tabBar:self selectedBtnFrom:self.currentButton.tag to:btn.tag];
    }
    // 1. 设置切换按钮的状态
    self.currentButton.selected = NO;
    btn.selected = YES;
    self.currentButton = btn;
    
    // 3.让选中的btn缩小放大还原
    [UIView animateWithDuration:0.2 animations:^{
        // 先缩小
        btn.transform = CGAffineTransformMakeScale(0.5, 0.5);
      }completion: ^(BOOL finished){
          // 再放大
          [UIView animateWithDuration:0.1 animations:^{
             btn.transform = CGAffineTransformMakeScale(1.5, 0.5);
          } completion:^(BOOL finished){
              [UIView animateWithDuration:0.1 animations:^{
                  btn.transform = CGAffineTransformIdentity;
              }];
           }];
          
      }];
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    NSUInteger index = 0;
    for (UIView *child in self.subviews) {
        if (child.tag != 998) {
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
