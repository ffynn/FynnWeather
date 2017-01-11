//
//	WeatherAir.h
// on 10/1/2017
//	Copyright © 2017. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface WeatherAir : NSObject

@property (nonatomic, strong) NSString * brf;
@property (nonatomic, strong) NSString * txt;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end