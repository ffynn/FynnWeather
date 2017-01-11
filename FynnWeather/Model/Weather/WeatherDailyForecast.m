//
//	WeatherDailyForecast.m
// on 10/1/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "WeatherDailyForecast.h"

NSString *const kWeatherDailyForecastAstro = @"astro";
NSString *const kWeatherDailyForecastCond = @"cond";
NSString *const kWeatherDailyForecastDate = @"date";
NSString *const kWeatherDailyForecastHum = @"hum";
NSString *const kWeatherDailyForecastPcpn = @"pcpn";
NSString *const kWeatherDailyForecastPop = @"pop";
NSString *const kWeatherDailyForecastPres = @"pres";
NSString *const kWeatherDailyForecastTmp = @"tmp";
NSString *const kWeatherDailyForecastUv = @"uv";
NSString *const kWeatherDailyForecastVis = @"vis";
NSString *const kWeatherDailyForecastWind = @"wind";

@interface WeatherDailyForecast ()
@end
@implementation WeatherDailyForecast




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kWeatherDailyForecastAstro] isKindOfClass:[NSNull class]]){
		self.astro = [[WeatherAstro alloc] initWithDictionary:dictionary[kWeatherDailyForecastAstro]];
	}

	if(![dictionary[kWeatherDailyForecastCond] isKindOfClass:[NSNull class]]){
		self.cond = [[WeatherCond alloc] initWithDictionary:dictionary[kWeatherDailyForecastCond]];
	}

	if(![dictionary[kWeatherDailyForecastDate] isKindOfClass:[NSNull class]]){
		self.date = dictionary[kWeatherDailyForecastDate];
	}	
	if(![dictionary[kWeatherDailyForecastHum] isKindOfClass:[NSNull class]]){
		self.hum = dictionary[kWeatherDailyForecastHum];
	}	
	if(![dictionary[kWeatherDailyForecastPcpn] isKindOfClass:[NSNull class]]){
		self.pcpn = dictionary[kWeatherDailyForecastPcpn];
	}	
	if(![dictionary[kWeatherDailyForecastPop] isKindOfClass:[NSNull class]]){
		self.pop = dictionary[kWeatherDailyForecastPop];
	}	
	if(![dictionary[kWeatherDailyForecastPres] isKindOfClass:[NSNull class]]){
		self.pres = dictionary[kWeatherDailyForecastPres];
	}	
	if(![dictionary[kWeatherDailyForecastTmp] isKindOfClass:[NSNull class]]){
		self.tmp = [[WeatherTmp alloc] initWithDictionary:dictionary[kWeatherDailyForecastTmp]];
	}

	if(![dictionary[kWeatherDailyForecastUv] isKindOfClass:[NSNull class]]){
		self.uv = dictionary[kWeatherDailyForecastUv];
	}	
	if(![dictionary[kWeatherDailyForecastVis] isKindOfClass:[NSNull class]]){
		self.vis = dictionary[kWeatherDailyForecastVis];
	}	
	if(![dictionary[kWeatherDailyForecastWind] isKindOfClass:[NSNull class]]){
		self.wind = [[WeatherWind alloc] initWithDictionary:dictionary[kWeatherDailyForecastWind]];
	}

	return self;
}
@end
