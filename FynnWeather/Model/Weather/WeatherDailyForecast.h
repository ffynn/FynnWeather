//
//	WeatherDailyForecast.h
// on 10/1/2017
//	Copyright © 2017. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "WeatherAstro.h"
#import "WeatherCond.h"
#import "WeatherTmp.h"
#import "WeatherWind.h"

@interface WeatherDailyForecast : NSObject

@property (nonatomic, strong) WeatherAstro * astro;
@property (nonatomic, strong) WeatherCond * cond;
@property (nonatomic, strong) NSString * date;
@property (nonatomic, strong) NSString * hum;
@property (nonatomic, strong) NSString * pcpn;
@property (nonatomic, strong) NSString * pop;
@property (nonatomic, strong) NSString * pres;
@property (nonatomic, strong) WeatherTmp * tmp;
@property (nonatomic, strong) NSString * uv;
@property (nonatomic, strong) NSString * vis;
@property (nonatomic, strong) WeatherWind * wind;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end