//
//	WeatherCity.h
// on 10/1/2017
//	Copyright © 2017. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface WeatherCity : NSObject

@property (nonatomic, strong) NSString * aqi;
@property (nonatomic, strong) NSString * co;
@property (nonatomic, strong) NSString * no2;
@property (nonatomic, strong) NSString * o3;
@property (nonatomic, strong) NSString * pm10;
@property (nonatomic, strong) NSString * pm25;
@property (nonatomic, strong) NSString * qlty;
@property (nonatomic, strong) NSString * so2;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end