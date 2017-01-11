//
//	WeatherWind.h
// on 10/1/2017
//	Copyright © 2017. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface WeatherWind : NSObject

@property (nonatomic, strong) NSString * deg;
@property (nonatomic, strong) NSString * dir;
@property (nonatomic, strong) NSString * sc;
@property (nonatomic, strong) NSString * spd;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end