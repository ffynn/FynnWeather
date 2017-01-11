//
//	WeatherAir.m
// on 10/1/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "WeatherAir.h"

NSString *const kWeatherAirBrf = @"brf";
NSString *const kWeatherAirTxt = @"txt";

@interface WeatherAir ()
@end
@implementation WeatherAir




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kWeatherAirBrf] isKindOfClass:[NSNull class]]){
		self.brf = dictionary[kWeatherAirBrf];
	}	
	if(![dictionary[kWeatherAirTxt] isKindOfClass:[NSNull class]]){
		self.txt = dictionary[kWeatherAirTxt];
	}	
	return self;
}
@end