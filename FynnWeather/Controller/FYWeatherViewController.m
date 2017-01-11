//
//  FYWeatherViewController.m
//  FynnWeather
//
//  Created by FLYang on 2017/1/11.
//  Copyright © 2017年 Fynn. All rights reserved.
//

#import "FYWeatherViewController.h"

@interface FYWeatherViewController ()

@end

@implementation FYWeatherViewController

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.view.backgroundColor = [UIColor colorWithHexString:MAIN_COLOR];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self fy_setCityWeatherInfo];
}

#pragma mark - 天气信息
- (void)fy_setCityWeatherInfo {
    __weak __typeof(self)weakSelf = self;
    self.locationWeather.getCityWeatherBlock = ^(WeatherHeWeather5 *model) {
        if (model) {
            [weakSelf setViewUI];
            [weakSelf.weatherView fy_setWeatherDataModel:model];
        }
    };
}

#pragma mark - 设置视图界面
- (void)setViewUI {
    [self.view addSubview:self.weatherView];
}

#pragma mark - init
- (FYWeatherView *)weatherView {
    if (!_weatherView) {
        _weatherView = [[FYWeatherView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _weatherView.selfVC = self;
    }
    return _weatherView;
}

- (FYLocationWeather *)locationWeather {
    if (!_locationWeather) {
        _locationWeather = [[FYLocationWeather alloc] init];
        _locationWeather.selfVC = self;
    }
    return _locationWeather;
}


@end
