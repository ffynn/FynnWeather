//
//	WeatherResult.m
// on 10/1/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "WeatherResult.h"

NSString *const kWeatherResultHeWeather5 = @"HeWeather5";

@interface WeatherResult ()
@end
@implementation WeatherResult




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(dictionary[kWeatherResultHeWeather5] != nil && [dictionary[kWeatherResultHeWeather5] isKindOfClass:[NSArray class]]){
		NSArray * heWeather5Dictionaries = dictionary[kWeatherResultHeWeather5];
		NSMutableArray * heWeather5Items = [NSMutableArray array];
		for(NSDictionary * heWeather5Dictionary in heWeather5Dictionaries){
			WeatherHeWeather5 * heWeather5Item = [[WeatherHeWeather5 alloc] initWithDictionary:heWeather5Dictionary];
			[heWeather5Items addObject:heWeather5Item];
		}
		self.heWeather5 = heWeather5Items;
	}
	return self;
}
@end