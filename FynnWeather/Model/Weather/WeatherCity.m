//
//	WeatherCity.m
// on 10/1/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "WeatherCity.h"

NSString *const kWeatherCityAqi = @"aqi";
NSString *const kWeatherCityCo = @"co";
NSString *const kWeatherCityNo2 = @"no2";
NSString *const kWeatherCityO3 = @"o3";
NSString *const kWeatherCityPm10 = @"pm10";
NSString *const kWeatherCityPm25 = @"pm25";
NSString *const kWeatherCityQlty = @"qlty";
NSString *const kWeatherCitySo2 = @"so2";

@interface WeatherCity ()
@end
@implementation WeatherCity




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kWeatherCityAqi] isKindOfClass:[NSNull class]]){
		self.aqi = dictionary[kWeatherCityAqi];
	}	
	if(![dictionary[kWeatherCityCo] isKindOfClass:[NSNull class]]){
		self.co = dictionary[kWeatherCityCo];
	}	
	if(![dictionary[kWeatherCityNo2] isKindOfClass:[NSNull class]]){
		self.no2 = dictionary[kWeatherCityNo2];
	}	
	if(![dictionary[kWeatherCityO3] isKindOfClass:[NSNull class]]){
		self.o3 = dictionary[kWeatherCityO3];
	}	
	if(![dictionary[kWeatherCityPm10] isKindOfClass:[NSNull class]]){
		self.pm10 = dictionary[kWeatherCityPm10];
	}	
	if(![dictionary[kWeatherCityPm25] isKindOfClass:[NSNull class]]){
		self.pm25 = dictionary[kWeatherCityPm25];
	}	
	if(![dictionary[kWeatherCityQlty] isKindOfClass:[NSNull class]]){
		self.qlty = dictionary[kWeatherCityQlty];
	}	
	if(![dictionary[kWeatherCitySo2] isKindOfClass:[NSNull class]]){
		self.so2 = dictionary[kWeatherCitySo2];
	}	
	return self;
}
@end