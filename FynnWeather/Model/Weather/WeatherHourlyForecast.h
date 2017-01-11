//
//	WeatherHourlyForecast.h
// on 10/1/2017
//	Copyright © 2017. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "WeatherCond.h"
#import "WeatherWind.h"

@interface WeatherHourlyForecast : NSObject

@property (nonatomic, strong) WeatherCond * cond;
@property (nonatomic, strong) NSString * date;
@property (nonatomic, strong) NSString * hum;
@property (nonatomic, strong) NSString * pop;
@property (nonatomic, strong) NSString * pres;
@property (nonatomic, strong) NSString * tmp;
@property (nonatomic, strong) WeatherWind * wind;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end