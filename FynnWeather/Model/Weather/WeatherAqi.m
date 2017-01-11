//
//	WeatherAqi.m
// on 10/1/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "WeatherAqi.h"

NSString *const kWeatherAqiCity = @"city";

@interface WeatherAqi ()
@end
@implementation WeatherAqi




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kWeatherAqiCity] isKindOfClass:[NSNull class]]){
		self.city = [[WeatherCity alloc] initWithDictionary:dictionary[kWeatherAqiCity]];
	}

	return self;
}
@end