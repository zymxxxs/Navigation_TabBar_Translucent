//
//  UINavigationBar+Category.m
//  Navigation
//
//  Created by zym on 15/4/16.
//  Copyright (c) 2015年 zym. All rights reserved.
//

#import "UINavigationBar+YYExtend.h"
#import <objc/runtime.h>


@implementation UINavigationBar (YYExtend)

static char overlayKey;

static CGFloat const kDefaultColorLayerOpacity = 0.4f;
static CGFloat const kSpaceToCoverStatusBars = 20.0f;


-(CALayer *)overColorLayer
{
    return objc_getAssociatedObject(self, &overlayKey);
}
-(void)setOverColorLayer:(CALayer *)overColorLayer
{
    return objc_setAssociatedObject(self, &overlayKey, overColorLayer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)minOpacityForValue:(CGFloat)value
{
    return (0.4 - 0.4 * value) / (0.6 * value + 0.4);
}

- (CGFloat)convertValue:(CGFloat)value withOpacity:(CGFloat)opacity
{
    return 0.4 * value / opacity + 0.6 * value - 0.4 / opacity + 0.4;
}


-(void)setBarTintColorForTranslucent:(UIColor *)color
{
    CGFloat red, green, blue, alpha;
    [color getRed:&red green:&green blue:&blue alpha:&alpha];
    
    UIColor *calibratedColor = [UIColor colorWithRed:red green:green blue:blue alpha:0.66];
    [self setBarTintColor:calibratedColor];
    
    if (self.overColorLayer == nil) {
        self.overColorLayer = [CALayer layer];
        self.overColorLayer.opacity = kDefaultColorLayerOpacity;
        [self.layer addSublayer:self.overColorLayer];
        
        self.overColorLayer.frame = CGRectMake(0, 0 - kSpaceToCoverStatusBars, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds) + kSpaceToCoverStatusBars);
        [self.layer insertSublayer:self.overColorLayer atIndex:1];
    }
    
    CGFloat opacity = kDefaultColorLayerOpacity;
    
    CGFloat minVal = MIN(MIN(red, green), blue);
    
    if ([self convertValue:minVal withOpacity:opacity] < 0) {
        opacity = [self minOpacityForValue:minVal];
    }
    
    self.overColorLayer.opacity = opacity;
    
    red = [self convertValue:red withOpacity:opacity];
    green = [self convertValue:green withOpacity:opacity];
    blue = [self convertValue:blue withOpacity:opacity];
    
    red = MAX(MIN(1.0, red), 0);
    green = MAX(MIN(1.0, green), 0);
    blue = MAX(MIN(1.0, blue), 0);
    
    self.overColorLayer.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:alpha].CGColor;
}


@end
