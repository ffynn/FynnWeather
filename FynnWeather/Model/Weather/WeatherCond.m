//
//	WeatherCond.m
// on 10/1/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "WeatherCond.h"

NSString *const kWeatherCondCodeD = @"code_d";
NSString *const kWeatherCondCodeN = @"code_n";
NSString *const kWeatherCondTxtD = @"txt_d";
NSString *const kWeatherCondTxtN = @"txt_n";
NSString *const kWeatherCondCode = @"code";
NSString *const kWeatherCondTxt = @"txt";

@interface WeatherCond ()
@end
@implementation WeatherCond




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kWeatherCondCodeD] isKindOfClass:[NSNull class]]){
		self.codeD = dictionary[kWeatherCondCodeD];
	}	
	if(![dictionary[kWeatherCondCodeN] isKindOfClass:[NSNull class]]){
		self.codeN = dictionary[kWeatherCondCodeN];
	}	
	if(![dictionary[kWeatherCondTxtD] isKindOfClass:[NSNull class]]){
		self.txtD = dictionary[kWeatherCondTxtD];
	}	
	if(![dictionary[kWeatherCondTxtN] isKindOfClass:[NSNull class]]){
		self.txtN = dictionary[kWeatherCondTxtN];
	}	
	if(![dictionary[kWeatherCondCode] isKindOfClass:[NSNull class]]){
		self.code = dictionary[kWeatherCondCode];
	}	
	if(![dictionary[kWeatherCondTxt] isKindOfClass:[NSNull class]]){
		self.txt = dictionary[kWeatherCondTxt];
	}	
	return self;
}
@end