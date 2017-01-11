//
//	WeatherSuggestion.h
// on 10/1/2017
//	Copyright © 2017. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "WeatherAir.h"
#import "WeatherAir.h"
#import "WeatherAir.h"
#import "WeatherAir.h"
#import "WeatherAir.h"
#import "WeatherAir.h"
#import "WeatherAir.h"
#import "WeatherAir.h"

@interface WeatherSuggestion : NSObject

@property (nonatomic, strong) WeatherAir * air;
@property (nonatomic, strong) WeatherAir * comf;
@property (nonatomic, strong) WeatherAir * cw;
@property (nonatomic, strong) WeatherAir * drsg;
@property (nonatomic, strong) WeatherAir * flu;
@property (nonatomic, strong) WeatherAir * sport;
@property (nonatomic, strong) WeatherAir * trav;
@property (nonatomic, strong) WeatherAir * uv;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end