//
//  FYLocationWeather.m
//  FynnWeather
//
//  Created by FLYang on 2017/1/11.
//  Copyright © 2017年 Fynn. All rights reserved.
//

#import "FYLocationWeather.h"
#import "NSString+JSON.h"
#import <UIView+TYAlertView.h>

@implementation FYLocationWeather

- (instancetype)init {
    self = [super init];
    if (self) {
        [SVProgressHUD show];
        [self fy_getLocationPermissions];
    }
    return self;
}

+ (instancetype)sharedManager {
    static FYLocationWeather *_sharedManager = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedManager = [[self alloc] init];
    });
    
    return _sharedManager;
}

#pragma mark - 获取地理位置授权
- (void)fy_getLocationPermissions {
    if ([CLLocationManager locationServicesEnabled] == NO) {
        [self fy_showMessageAlertView:@"没有打开GPS"];
    } else {
        [self.locationManager startUpdatingLocation];
    }
}

#pragma mark 获取位置
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    CLLocation *nowLocation = locations.lastObject;
    if (nowLocation) {
        [self fy_getLocationInfo:nowLocation];
    }
}

#pragma mark 获取位置错误
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    if ([error code] == kCLErrorDenied) {
        [self fy_showMessageAlertView:@"你已拒绝访问当前位置"];
    } else if ([error code] == kCLErrorLocationUnknown) {
        [self fy_showMessageAlertView:@"无法定位位置"];
    }
}

#pragma mark 获取地点信息
- (void)fy_getLocationInfo:(CLLocation *)location {
    [self.geo reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        
        if (placemarks.count > 0) {
            CLPlacemark *placemark = [placemarks objectAtIndex:0];
            NSString *city = placemark.locality;
            if (!city) {
                city = placemark.administrativeArea;
            }
            
            if (city.length) {
                [self fy_networkWeatherData:city];
            }
            
            [self.locationManager stopUpdatingLocation];
            
        } else if (error && placemarks.count == 0) {
            [self fy_showMessageAlertView:@"没有获取到城市"];
        }
    }];
}

- (void)fy_networkWeatherData:(NSString *)city {
    self.weatherRequest = [FYApi getWithBaseUrlString:JD_API_URL
                                            UrlString:WEATHER_API
                                    requestDictionary:@{ @"city":city, @"appkey":JD_APIKEY}
                                             delegate:nil];
    [self.weatherRequest startRequestSuccess:^(FYRequest *request, id result) {
//        NSLog(@"--- 天气JSON：%@", [NSString jsonStringWithObject:result]);
        NSDictionary *dataDict = result[@"result"][@"HeWeather5"][0];
        WeatherHeWeather5 *weatherModel = [[WeatherHeWeather5 alloc] initWithDictionary:dataDict];
        self.getCityWeatherBlock(weatherModel);
        [SVProgressHUD popActivity];
        
    } failure:^(FYRequest *request, NSError *error) {
        [self fy_showMessageAlertView:[error localizedDescription]];
    }];
}

#pragma mark - 错误提示弹窗
- (void)fy_showMessageAlertView:(NSString *)message {
    [SVProgressHUD popActivity];
    TYAlertView *alertView = [TYAlertView alertViewWithTitle:nil message:message];
    alertView.layer.cornerRadius = 10;
    alertView.buttonDefaultBgColor = [UIColor colorWithHexString:MAIN_COLOR];
    [alertView addAction:[TYAlertAction actionWithTitle:@"关闭" style:(TYAlertActionStyleDefault) handler:^(TYAlertAction *action) {
        [self.selfVC dismissViewControllerAnimated:YES completion:nil];
    }]];
    [alertView showInWindowWithBackgoundTapDismissEnable:YES];
    [self.locationManager stopUpdatingLocation];
}

#pragma mark - 初始化
- (CLLocationManager *)locationManager {
    if (!_locationManager) {
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.delegate = self;
        _locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers;
        _locationManager.distanceFilter = kCLDistanceFilterNone;
        [_locationManager requestWhenInUseAuthorization];
    }
    return _locationManager;
}

- (CLGeocoder *)geo {
    if (!_geo) {
        _geo = [[CLGeocoder alloc] init];
    }
    return _geo;
}

@end
