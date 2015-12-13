//
//  ZYTabbar2.h
//  SInaWeiBo
//
//  Created by huahua on 11/17/15.
//  Copyright (c) 2015 张瑜. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZYTabbar2;
@protocol ZYTabbarDelegate <NSObject>
- (void) tabBar:(ZYTabbar2 *)tabBar selectedBtnFrom:(NSInteger)from to:(NSInteger)to;
@end

@interface ZYTabbar2 : UIView
- (void) addItem: (UITabBarItem *) item;
@property(nonatomic, weak) id<ZYTabbarDelegate>  delegate;
@end
