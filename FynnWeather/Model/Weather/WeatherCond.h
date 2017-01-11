//
//	WeatherCond.h
// on 10/1/2017
//	Copyright © 2017. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface WeatherCond : NSObject

@property (nonatomic, strong) NSString * codeD;
@property (nonatomic, strong) NSString * codeN;
@property (nonatomic, strong) NSString * txtD;
@property (nonatomic, strong) NSString * txtN;
@property (nonatomic, strong) NSString * code;
@property (nonatomic, strong) NSString * txt;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end
