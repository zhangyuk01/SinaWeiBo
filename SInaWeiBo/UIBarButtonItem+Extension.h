//
//  UIBarButtonItem+Extension.h
//  SInaWeiBo
//
//  Created by 张瑜 on 15/12/16.
//  Copyright (c) 2015年 张瑜. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)
// 抽取方法，创建navigationItem上面的left 和 right
+ (UIBarButtonItem *) itemWithImage:(NSString *) image target:(id)target action:(SEL)action highImage:(NSString *)highImage;

@end
