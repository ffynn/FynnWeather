//
//	WeatherWind.m
// on 10/1/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "WeatherWind.h"

NSString *const kWeatherWindDeg = @"deg";
NSString *const kWeatherWindDir = @"dir";
NSString *const kWeatherWindSc = @"sc";
NSString *const kWeatherWindSpd = @"spd";

@interface WeatherWind ()
@end
@implementation WeatherWind




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kWeatherWindDeg] isKindOfClass:[NSNull class]]){
		self.deg = dictionary[kWeatherWindDeg];
	}	
	if(![dictionary[kWeatherWindDir] isKindOfClass:[NSNull class]]){
		self.dir = dictionary[kWeatherWindDir];
	}	
	if(![dictionary[kWeatherWindSc] isKindOfClass:[NSNull class]]){
		self.sc = dictionary[kWeatherWindSc];
	}	
	if(![dictionary[kWeatherWindSpd] isKindOfClass:[NSNull class]]){
		self.spd = dictionary[kWeatherWindSpd];
	}	
	return self;
}
@end