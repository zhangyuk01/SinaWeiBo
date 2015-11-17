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
    self.imageView.contentMode = UIViewContentModeCenter;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}



- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat imageX = 0;
    CGFloat imageY = self.height * 0.6;
    CGFloat imageW = self.width;
    CGFloat imageH = self.height - self.height * 0.6;
    return  CGRectMake(imageX, imageY, imageW, imageH);
    

}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat titleX = 0;
    CGFloat titleY = 0;
    CGFloat titleW = self.width;
    CGFloat titleH = self.height * 0.6;
    
    return  CGRectMake(titleX, titleY, titleW, titleH);


}
@end
