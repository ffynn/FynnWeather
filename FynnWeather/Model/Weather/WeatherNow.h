//
//	WeatherNow.h
// on 10/1/2017
//	Copyright © 2017. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "WeatherCond.h"
#import "WeatherWind.h"

@interface WeatherNow : NSObject

@property (nonatomic, strong) WeatherCond * cond;
@property (nonatomic, strong) NSString * fl;
@property (nonatomic, strong) NSString * hum;
@property (nonatomic, strong) NSString * pcpn;
@property (nonatomic, strong) NSString * pres;
@property (nonatomic, strong) NSString * tmp;
@property (nonatomic, strong) NSString * vis;
@property (nonatomic, strong) WeatherWind * wind;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end