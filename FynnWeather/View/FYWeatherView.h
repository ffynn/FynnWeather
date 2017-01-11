//
//  FYWeatherView.h
//  FynnWeather
//
//  Created by FLYang on 2017/1/11.
//  Copyright © 2017年 Fynn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Config.h"
#import "WeatherHeWeather5.h"

@interface FYWeatherView : UIView

/**
 分享按钮
 */
@property (nonatomic, strong) UIButton      *closeBtn;

/**
 当前温度
 */
@property (nonatomic, strong) UILabel       *tmpLable;

/**
 天气情况
 */
@property (nonatomic, strong) UILabel       *condLable;

/**
 天气情况图片
 */
@property (nonatomic, strong) UIImageView   *condImage;

/**
 温馨提示
 */
@property (nonatomic, strong) UILabel       *tipLable;

/**
 最高温度
 
 */
@property (nonatomic, strong) UILabel       *maxLable;

/**
 最低温度
 */
@property (nonatomic, strong) UILabel       *minLable;

/**
 最低温度
 */
@property (nonatomic, strong) UIImageView   *tmpIcon;

/**
 顶部指数视图
 */
@property (nonatomic, strong) UIView        *topView;

/**
 底部指数视图
 */
@property (nonatomic, strong) UIView        *botView;

/**
 指数视图
 */
@property (nonatomic, strong) UIView        *indexView;

/**
 控制器
 */
@property (nonatomic, strong) UIViewController *selfVC;


- (void)fy_setWeatherDataModel:(WeatherHeWeather5 *)model;

@end
