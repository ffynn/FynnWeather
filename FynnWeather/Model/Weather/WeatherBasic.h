//
//	WeatherBasic.h
// on 10/1/2017
//	Copyright © 2017. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "WeatherUpdate.h"

@interface WeatherBasic : NSObject

@property (nonatomic, strong) NSString * city;
@property (nonatomic, strong) NSString * cnty;
@property (nonatomic, strong) NSString * idField;
@property (nonatomic, strong) NSString * lat;
@property (nonatomic, strong) NSString * lon;
@property (nonatomic, strong) WeatherUpdate * update;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end
