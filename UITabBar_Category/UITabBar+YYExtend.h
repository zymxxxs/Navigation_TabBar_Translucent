//
//  UITabBar+YYExtend.h
//  Navigation
//
//  Created by zym on 15/4/16.
//  Copyright (c) 2015年 zym. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBar (YYExtend)

/**
 *  很多情况下，我们设置 tabbar.translucent为YES的时候，navigationBar的背景色看起来与设计稿不一致。
 *  最简单的方法是设置 translucent 为 NO，于是tabbar的背景色看起来与设计稿一致了，但是设计师可能会跟你吐槽这个tabbar一点也不iOS7
 *  我们希望使用tabbar还是可以透出高斯模糊后的背景并且和设计稿的颜色一致，那么可以使用以下方法。
 */

- (void)setBarTintColorForTranslucent:(UIColor *)color;

@end
