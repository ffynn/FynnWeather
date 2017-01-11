//
//	WeatherHeWeather5.m
// on 10/1/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "WeatherHeWeather5.h"

NSString *const kWeatherHeWeather5Aqi = @"aqi";
NSString *const kWeatherHeWeather5Basic = @"basic";
NSString *const kWeatherHeWeather5DailyForecast = @"daily_forecast";
NSString *const kWeatherHeWeather5HourlyForecast = @"hourly_forecast";
NSString *const kWeatherHeWeather5Now = @"now";
NSString *const kWeatherHeWeather5Status = @"status";
NSString *const kWeatherHeWeather5Suggestion = @"suggestion";

@interface WeatherHeWeather5 ()
@end
@implementation WeatherHeWeather5




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kWeatherHeWeather5Aqi] isKindOfClass:[NSNull class]]){
		self.aqi = [[WeatherAqi alloc] initWithDictionary:dictionary[kWeatherHeWeather5Aqi]];
	}

	if(![dictionary[kWeatherHeWeather5Basic] isKindOfClass:[NSNull class]]){
		self.basic = [[WeatherBasic alloc] initWithDictionary:dictionary[kWeatherHeWeather5Basic]];
	}

	if(dictionary[kWeatherHeWeather5DailyForecast] != nil && [dictionary[kWeatherHeWeather5DailyForecast] isKindOfClass:[NSArray class]]){
		NSArray * dailyForecastDictionaries = dictionary[kWeatherHeWeather5DailyForecast];
		NSMutableArray * dailyForecastItems = [NSMutableArray array];
		for(NSDictionary * dailyForecastDictionary in dailyForecastDictionaries){
			WeatherDailyForecast * dailyForecastItem = [[WeatherDailyForecast alloc] initWithDictionary:dailyForecastDictionary];
			[dailyForecastItems addObject:dailyForecastItem];
		}
		self.dailyForecast = dailyForecastItems;
	}
	if(dictionary[kWeatherHeWeather5HourlyForecast] != nil && [dictionary[kWeatherHeWeather5HourlyForecast] isKindOfClass:[NSArray class]]){
		NSArray * hourlyForecastDictionaries = dictionary[kWeatherHeWeather5HourlyForecast];
		NSMutableArray * hourlyForecastItems = [NSMutableArray array];
		for(NSDictionary * hourlyForecastDictionary in hourlyForecastDictionaries){
			WeatherHourlyForecast * hourlyForecastItem = [[WeatherHourlyForecast alloc] initWithDictionary:hourlyForecastDictionary];
			[hourlyForecastItems addObject:hourlyForecastItem];
		}
		self.hourlyForecast = hourlyForecastItems;
	}
	if(![dictionary[kWeatherHeWeather5Now] isKindOfClass:[NSNull class]]){
		self.now = [[WeatherNow alloc] initWithDictionary:dictionary[kWeatherHeWeather5Now]];
	}

	if(![dictionary[kWeatherHeWeather5Status] isKindOfClass:[NSNull class]]){
		self.status = dictionary[kWeatherHeWeather5Status];
	}	
	if(![dictionary[kWeatherHeWeather5Suggestion] isKindOfClass:[NSNull class]]){
		self.suggestion = [[WeatherSuggestion alloc] initWithDictionary:dictionary[kWeatherHeWeather5Suggestion]];
	}

	return self;
}
@end