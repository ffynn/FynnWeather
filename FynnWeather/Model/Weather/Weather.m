//
//	Weather.m
// on 10/1/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "Weather.h"

NSString *const kWeatherCharge = @"charge";
NSString *const kWeatherCode = @"code";
NSString *const kWeatherMsg = @"msg";
NSString *const kWeatherResult = @"result";

@interface Weather ()
@end
@implementation Weather




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kWeatherCharge] isKindOfClass:[NSNull class]]){
		self.charge = [dictionary[kWeatherCharge] boolValue];
	}

	if(![dictionary[kWeatherCode] isKindOfClass:[NSNull class]]){
		self.code = dictionary[kWeatherCode];
	}	
	if(![dictionary[kWeatherMsg] isKindOfClass:[NSNull class]]){
		self.msg = dictionary[kWeatherMsg];
	}	
	if(![dictionary[kWeatherResult] isKindOfClass:[NSNull class]]){
		self.result = [[WeatherResult alloc] initWithDictionary:dictionary[kWeatherResult]];
	}

	return self;
}
@end