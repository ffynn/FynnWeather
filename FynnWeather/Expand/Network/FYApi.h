//
//  FYApi.h
//  Read
//
//  Created by FLYang on 2017/1/9.
//  Copyright © 2017年 Fynn. All rights reserved.
//

#import "FYRequest.h"

@interface FYApi : FYRequest

/**
 GET请求

 @param baseUrl             API接口地址
 @param urlString           API接口拼接参数
 @param requestDictionary   请求内容
 @param delegate            代理
 @return                    请求结果
 */
+ (instancetype)getWithBaseUrlString:(NSString *)baseUrl
                           UrlString:(NSString *)urlString
               requestDictionary:(NSDictionary *)requestDictionary
                        delegate:(id)delegate;

/**
 POST请求
 
 @param baseUrl             API接口地址
 @param urlString           API接口拼接参数
 @param requestDictionary   请求内容
 @param delegate            代理
 @return                    请求结果
 */
+ (instancetype)postWithBaseUrlString:(NSString *)baseUrl
                            UrlString:(NSString *)urlString
                requestDictionary:(NSDictionary *)requestDictionary
                         delegate:(id)delegate;

@end
