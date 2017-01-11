//
//  UIColor+HEX.h
//  Read
//
//  Created by FLYang on 2017/1/10.
//  Copyright © 2017年 Fynn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HEX)

+ (UIColor *)colorWithHexString:(NSString *)color;
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

@end
