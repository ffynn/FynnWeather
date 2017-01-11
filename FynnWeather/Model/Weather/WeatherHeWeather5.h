//
//	WeatherHeWeather5.h
// on 10/1/2017
//	Copyright © 2017. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "WeatherAqi.h"
#import "WeatherBasic.h"
#import "WeatherDailyForecast.h"
#import "WeatherHourlyForecast.h"
#import "WeatherNow.h"
#import "WeatherSuggestion.h"

@interface WeatherHeWeather5 : NSObject

@property (nonatomic, strong) WeatherAqi * aqi;
@property (nonatomic, strong) WeatherBasic * basic;
@property (nonatomic, strong) NSArray * dailyForecast;
@property (nonatomic, strong) NSArray * hourlyForecast;
@property (nonatomic, strong) WeatherNow * now;
@property (nonatomic, strong) NSString * status;
@property (nonatomic, strong) WeatherSuggestion * suggestion;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end
