//
//  FYLocationWeather.h
//  FynnWeather
//
//  Created by FLYang on 2017/1/11.
//  Copyright © 2017年 Fynn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <SVProgressHUD/SVProgressHUD.h>
#import "FYApi.h"
#import "NetServer.h"
#import "Config.h"
#import "WeatherHeWeather5.h"

typedef void(^GetCityWeatherBlock)(WeatherHeWeather5 *model);

@interface FYLocationWeather : NSObject <
CLLocationManagerDelegate
>

@property (nonatomic, strong) UIViewController      *selfVC;
@property (nonatomic, strong) FYRequest             *weatherRequest;
@property (nonatomic, strong) CLLocationManager     *locationManager;
@property (nonatomic, strong) CLGeocoder            *geo;
@property (nonatomic, strong) GetCityWeatherBlock    getCityWeatherBlock;

+ (instancetype)sharedManager;


@end
