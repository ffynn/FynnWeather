//
//	WeatherNow.m
// on 10/1/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "WeatherNow.h"

NSString *const kWeatherNowCond = @"cond";
NSString *const kWeatherNowFl = @"fl";
NSString *const kWeatherNowHum = @"hum";
NSString *const kWeatherNowPcpn = @"pcpn";
NSString *const kWeatherNowPres = @"pres";
NSString *const kWeatherNowTmp = @"tmp";
NSString *const kWeatherNowVis = @"vis";
NSString *const kWeatherNowWind = @"wind";

@interface WeatherNow ()
@end
@implementation WeatherNow




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kWeatherNowCond] isKindOfClass:[NSNull class]]){
		self.cond = [[WeatherCond alloc] initWithDictionary:dictionary[kWeatherNowCond]];
	}

	if(![dictionary[kWeatherNowFl] isKindOfClass:[NSNull class]]){
		self.fl = dictionary[kWeatherNowFl];
	}	
	if(![dictionary[kWeatherNowHum] isKindOfClass:[NSNull class]]){
		self.hum = dictionary[kWeatherNowHum];
	}	
	if(![dictionary[kWeatherNowPcpn] isKindOfClass:[NSNull class]]){
		self.pcpn = dictionary[kWeatherNowPcpn];
	}	
	if(![dictionary[kWeatherNowPres] isKindOfClass:[NSNull class]]){
		self.pres = dictionary[kWeatherNowPres];
	}	
	if(![dictionary[kWeatherNowTmp] isKindOfClass:[NSNull class]]){
		self.tmp = dictionary[kWeatherNowTmp];
	}	
	if(![dictionary[kWeatherNowVis] isKindOfClass:[NSNull class]]){
		self.vis = dictionary[kWeatherNowVis];
	}	
	if(![dictionary[kWeatherNowWind] isKindOfClass:[NSNull class]]){
		self.wind = [[WeatherWind alloc] initWithDictionary:dictionary[kWeatherNowWind]];
	}

	return self;
}
@end