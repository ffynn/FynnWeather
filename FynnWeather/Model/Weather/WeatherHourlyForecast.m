//
//	WeatherHourlyForecast.m
// on 10/1/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "WeatherHourlyForecast.h"

NSString *const kWeatherHourlyForecastCond = @"cond";
NSString *const kWeatherHourlyForecastDate = @"date";
NSString *const kWeatherHourlyForecastHum = @"hum";
NSString *const kWeatherHourlyForecastPop = @"pop";
NSString *const kWeatherHourlyForecastPres = @"pres";
NSString *const kWeatherHourlyForecastTmp = @"tmp";
NSString *const kWeatherHourlyForecastWind = @"wind";

@interface WeatherHourlyForecast ()
@end
@implementation WeatherHourlyForecast




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kWeatherHourlyForecastCond] isKindOfClass:[NSNull class]]){
		self.cond = [[WeatherCond alloc] initWithDictionary:dictionary[kWeatherHourlyForecastCond]];
	}

	if(![dictionary[kWeatherHourlyForecastDate] isKindOfClass:[NSNull class]]){
		self.date = dictionary[kWeatherHourlyForecastDate];
	}	
	if(![dictionary[kWeatherHourlyForecastHum] isKindOfClass:[NSNull class]]){
		self.hum = dictionary[kWeatherHourlyForecastHum];
	}	
	if(![dictionary[kWeatherHourlyForecastPop] isKindOfClass:[NSNull class]]){
		self.pop = dictionary[kWeatherHourlyForecastPop];
	}	
	if(![dictionary[kWeatherHourlyForecastPres] isKindOfClass:[NSNull class]]){
		self.pres = dictionary[kWeatherHourlyForecastPres];
	}	
	if(![dictionary[kWeatherHourlyForecastTmp] isKindOfClass:[NSNull class]]){
		self.tmp = dictionary[kWeatherHourlyForecastTmp];
	}	
	if(![dictionary[kWeatherHourlyForecastWind] isKindOfClass:[NSNull class]]){
		self.wind = [[WeatherWind alloc] initWithDictionary:dictionary[kWeatherHourlyForecastWind]];
	}

	return self;
}
@end