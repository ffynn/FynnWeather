//
//  Config.h
//  Read
//
//  Created by FLYang on 2017/1/10.
//  Copyright © 2017年 Fynn. All rights reserved.
//

#ifndef Config_h
#define Config_h

#import "UIColor+HEX.h"
#import <Masonry.h>

/**
 颜色
 */
#define MAIN_COLOR  @"#4B586E"
#define WHITE_COLOR @"#FFFFFF"

/**
 屏幕
 */
#define SCREEN_HEIGHT   [[UIScreen mainScreen] bounds].size.height
#define SCREEN_WIDTH    [[UIScreen mainScreen] bounds].size.width
#define BOUNDS_WIDTH    self.bounds.size.width
#define BOUNDS_HEIGHT   self.bounds.size.height

#define WEAKSELF __weak __typeof(self)weakSelf = self;

#endif /* Config_h */
