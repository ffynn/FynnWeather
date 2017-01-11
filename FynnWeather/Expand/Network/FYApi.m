//
//  FYApi.m
//  Read
//
//  Created by FLYang on 2017/1/9.
//  Copyright © 2017年 Fynn. All rights reserved.
//

#import "FYApi.h"
#import "NetServer.h"

@implementation FYApi

+ (instancetype)getWithBaseUrlString:(NSString *)baseUrl
                           UrlString:(NSString *)urlString
                   requestDictionary:(NSDictionary *)requestDictionary
                            delegate:(id)delegate {
    
    return [FYApi requestWithUrlString:[baseUrl stringByAppendingString:urlString]
                     requestDictionary:requestDictionary
                              delegate:delegate
                       timeoutInterval:nil
                                  flag:nil
                         requestMethod:GET_METHOD
                           requestType:HTTPRequestType
                          responseType:JSONResponseType];
}

+ (instancetype)postWithBaseUrlString:(NSString *)baseUrl
                            UrlString:(NSString *)urlString
                    requestDictionary:(NSDictionary *)requestDictionary
                             delegate:(id)delegate {
    
    return [FYApi requestWithUrlString:[baseUrl stringByAppendingString:urlString]
                     requestDictionary:requestDictionary
                              delegate:delegate
                       timeoutInterval:nil
                                  flag:nil
                         requestMethod:POST_METHOD
                           requestType:HTTPRequestType
                          responseType:JSONResponseType];
}

@end
