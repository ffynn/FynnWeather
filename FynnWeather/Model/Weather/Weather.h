//
//	Weather.h
// on 10/1/2017
//	Copyright © 2017. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "WeatherResult.h"

@interface Weather : NSObject

@property (nonatomic, assign) BOOL charge;
@property (nonatomic, strong) NSString * code;
@property (nonatomic, strong) NSString * msg;
@property (nonatomic, strong) WeatherResult * result;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end