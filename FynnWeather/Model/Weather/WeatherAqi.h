//
//	WeatherAqi.h
// on 10/1/2017
//	Copyright © 2017. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "WeatherCity.h"

@interface WeatherAqi : NSObject

@property (nonatomic, strong) WeatherCity * city;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end