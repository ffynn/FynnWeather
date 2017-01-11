//
//	WeatherUpdate.m
// on 10/1/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "WeatherUpdate.h"

NSString *const kWeatherUpdateLoc = @"loc";
NSString *const kWeatherUpdateUtc = @"utc";

@interface WeatherUpdate ()
@end
@implementation WeatherUpdate




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kWeatherUpdateLoc] isKindOfClass:[NSNull class]]){
		self.loc = dictionary[kWeatherUpdateLoc];
	}	
	if(![dictionary[kWeatherUpdateUtc] isKindOfClass:[NSNull class]]){
		self.utc = dictionary[kWeatherUpdateUtc];
	}	
	return self;
}
@end