//
//	WeatherTmp.h
// on 10/1/2017
//	Copyright © 2017. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface WeatherTmp : NSObject

@property (nonatomic, strong) NSString * max;
@property (nonatomic, strong) NSString * min;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end