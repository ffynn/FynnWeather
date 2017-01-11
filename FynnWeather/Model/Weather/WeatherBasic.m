//
//	WeatherBasic.m
// on 10/1/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "WeatherBasic.h"

NSString *const kWeatherBasicCity = @"city";
NSString *const kWeatherBasicCnty = @"cnty";
NSString *const kWeatherBasicIdField = @"id";
NSString *const kWeatherBasicLat = @"lat";
NSString *const kWeatherBasicLon = @"lon";
NSString *const kWeatherBasicUpdate = @"update";

@interface WeatherBasic ()
@end
@implementation WeatherBasic




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kWeatherBasicCity] isKindOfClass:[NSNull class]]){
		self.city = dictionary[kWeatherBasicCity];
	}	
	if(![dictionary[kWeatherBasicCnty] isKindOfClass:[NSNull class]]){
		self.cnty = dictionary[kWeatherBasicCnty];
	}	
	if(![dictionary[kWeatherBasicIdField] isKindOfClass:[NSNull class]]){
		self.idField = dictionary[kWeatherBasicIdField];
	}	
	if(![dictionary[kWeatherBasicLat] isKindOfClass:[NSNull class]]){
		self.lat = dictionary[kWeatherBasicLat];
	}	
	if(![dictionary[kWeatherBasicLon] isKindOfClass:[NSNull class]]){
		self.lon = dictionary[kWeatherBasicLon];
	}	
	if(![dictionary[kWeatherBasicUpdate] isKindOfClass:[NSNull class]]){
		self.update = [[WeatherUpdate alloc] initWithDictionary:dictionary[kWeatherBasicUpdate]];
	}

	return self;
}
@end