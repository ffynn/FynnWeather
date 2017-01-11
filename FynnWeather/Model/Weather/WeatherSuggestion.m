//
//	WeatherSuggestion.m
// on 10/1/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "WeatherSuggestion.h"

NSString *const kWeatherSuggestionAir = @"air";
NSString *const kWeatherSuggestionComf = @"comf";
NSString *const kWeatherSuggestionCw = @"cw";
NSString *const kWeatherSuggestionDrsg = @"drsg";
NSString *const kWeatherSuggestionFlu = @"flu";
NSString *const kWeatherSuggestionSport = @"sport";
NSString *const kWeatherSuggestionTrav = @"trav";
NSString *const kWeatherSuggestionUv = @"uv";

@interface WeatherSuggestion ()
@end
@implementation WeatherSuggestion




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kWeatherSuggestionAir] isKindOfClass:[NSNull class]]){
		self.air = [[WeatherAir alloc] initWithDictionary:dictionary[kWeatherSuggestionAir]];
	}

	if(![dictionary[kWeatherSuggestionComf] isKindOfClass:[NSNull class]]){
		self.comf = [[WeatherAir alloc] initWithDictionary:dictionary[kWeatherSuggestionComf]];
	}

	if(![dictionary[kWeatherSuggestionCw] isKindOfClass:[NSNull class]]){
		self.cw = [[WeatherAir alloc] initWithDictionary:dictionary[kWeatherSuggestionCw]];
	}

	if(![dictionary[kWeatherSuggestionDrsg] isKindOfClass:[NSNull class]]){
		self.drsg = [[WeatherAir alloc] initWithDictionary:dictionary[kWeatherSuggestionDrsg]];
	}

	if(![dictionary[kWeatherSuggestionFlu] isKindOfClass:[NSNull class]]){
		self.flu = [[WeatherAir alloc] initWithDictionary:dictionary[kWeatherSuggestionFlu]];
	}

	if(![dictionary[kWeatherSuggestionSport] isKindOfClass:[NSNull class]]){
		self.sport = [[WeatherAir alloc] initWithDictionary:dictionary[kWeatherSuggestionSport]];
	}

	if(![dictionary[kWeatherSuggestionTrav] isKindOfClass:[NSNull class]]){
		self.trav = [[WeatherAir alloc] initWithDictionary:dictionary[kWeatherSuggestionTrav]];
	}

	if(![dictionary[kWeatherSuggestionUv] isKindOfClass:[NSNull class]]){
		self.uv = [[WeatherAir alloc] initWithDictionary:dictionary[kWeatherSuggestionUv]];
	}

	return self;
}
@end