//
//	WeatherResult.h
// on 10/1/2017
//	Copyright © 2017. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "WeatherHeWeather5.h"

@interface WeatherResult : NSObject

@property (nonatomic, strong) NSArray * heWeather5;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end