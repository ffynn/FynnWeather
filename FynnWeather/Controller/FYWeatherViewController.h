//
//  FYWeatherViewController.h
//  FynnWeather
//
//  Created by FLYang on 2017/1/11.
//  Copyright © 2017年 Fynn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FYWeatherView.h"
#import "FYLocationWeather.h"

@interface FYWeatherViewController : UIViewController

@property (nonatomic, strong) FYLocationWeather *locationWeather;
@property (nonatomic, strong) FYWeatherView     *weatherView;

@end
