//
//	WeatherAstro.h
// on 10/1/2017
//	Copyright © 2017. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface WeatherAstro : NSObject

@property (nonatomic, strong) NSString * mr;
@property (nonatomic, strong) NSString * ms;
@property (nonatomic, strong) NSString * sr;
@property (nonatomic, strong) NSString * ss;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end