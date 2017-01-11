//
//	WeatherTmp.m
// on 10/1/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "WeatherTmp.h"

NSString *const kWeatherTmpMax = @"max";
NSString *const kWeatherTmpMin = @"min";

@interface WeatherTmp ()
@end
@implementation WeatherTmp




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kWeatherTmpMax] isKindOfClass:[NSNull class]]){
		self.max = dictionary[kWeatherTmpMax];
	}	
	if(![dictionary[kWeatherTmpMin] isKindOfClass:[NSNull class]]){
		self.min = dictionary[kWeatherTmpMin];
	}	
	return self;
}
@end