//
//	WeatherAstro.m
// on 10/1/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "WeatherAstro.h"

NSString *const kWeatherAstroMr = @"mr";
NSString *const kWeatherAstroMs = @"ms";
NSString *const kWeatherAstroSr = @"sr";
NSString *const kWeatherAstroSs = @"ss";

@interface WeatherAstro ()
@end
@implementation WeatherAstro




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kWeatherAstroMr] isKindOfClass:[NSNull class]]){
		self.mr = dictionary[kWeatherAstroMr];
	}	
	if(![dictionary[kWeatherAstroMs] isKindOfClass:[NSNull class]]){
		self.ms = dictionary[kWeatherAstroMs];
	}	
	if(![dictionary[kWeatherAstroSr] isKindOfClass:[NSNull class]]){
		self.sr = dictionary[kWeatherAstroSr];
	}	
	if(![dictionary[kWeatherAstroSs] isKindOfClass:[NSNull class]]){
		self.ss = dictionary[kWeatherAstroSs];
	}	
	return self;
}
@end