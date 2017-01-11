//
//	WeatherUpdate.h
// on 10/1/2017
//	Copyright © 2017. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface WeatherUpdate : NSObject

@property (nonatomic, strong) NSString * loc;
@property (nonatomic, strong) NSString * utc;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end