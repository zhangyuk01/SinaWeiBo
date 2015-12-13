//
//  ZYTabBarButton.m
//  SInaWeiBo
//
//  Created by huahua on 11/17/15.
//  Copyright (c) 2015 张瑜. All rights reserved.
//

#import "ZYTabBarButton.h"

@implementation ZYTabBarButton

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
    // 设置图片居中
    self.imageView.contentMode = UIViewContentModeCenter;
    // 设置标题居中
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    // 设置文字字体大小
    self.titleLabel.font = [UIFont systemFontOfSize:13];
    // 设置按钮标题颜色
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
    
}



- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat imageX = 0;
    CGFloat imageY = contentRect.size.height * 0.6;
    CGFloat imageW = contentRect.size.width;
    CGFloat imageH = contentRect.size.height - contentRect.size.height * 0.6;
    return  CGRectMake(imageX, imageY, imageW, imageH);
    

}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat titleX = 0;
    CGFloat titleY = 0;
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = contentRect.size.height * 0.6;
    
    return  CGRectMake(titleX, titleY, titleW, titleH);


}


- (void)setHighlighted:(BOOL)highlighted
{


}
@end
