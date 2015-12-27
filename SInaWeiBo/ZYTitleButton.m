//
//  ZYTitleButton.m
//  SInaWeiBo
//
//  Created by 张瑜 on 15/12/27.
//  Copyright (c) 2015年 张瑜. All rights reserved.
//

#import "ZYTitleButton.h"

@implementation ZYTitleButton


// 自定义创建的控件都会有这两个方法
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUp];
    }
    return self;
}


- (id)initWithCoder:(NSCoder *)aDecoder
{
    if(self = [super initWithCoder:aDecoder]){
        [self setUp];
    }
    return self;
}
         
        
- (void) setUp{
    // 进行一次性的初始化
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    // 只要是button就会有图片和文字的frame方法,通过重新写这些方法，可以换位置
    self.imageView.contentMode = UIViewContentModeCenter;
    self.titleLabel.textAlignment= NSTextAlignmentCenter;
             
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.titleLabel.x = self.imageView.x;
    self.imageView.x = CGRectGetMaxX(self.titleLabel.frame) + 5;
}



@end
