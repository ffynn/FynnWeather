//
//  FYRequest.m
//  Read
//
//  Created by FLYang on 2017/1/9.
//  Copyright © 2017年 Fynn. All rights reserved.
//

#import "FYRequest.h"
#import "NetServer.h"
#import <AFNetworking/AFNetworkActivityIndicatorManager.h>

typedef enum : NSUInteger {
    
    DEALLOC_CANCEL,  // dealloc取消
    USER_CANCEL,     // 用户取消
    
} ECancelType;

/**
 *  网络状态的监测 + 是否可以发送通知消息
 */
static AFHTTPSessionManager          *_managerReachability = nil;
static BOOL                           _canSendMessage      = YES;

@interface FYRequest()

#pragma mark - Private Instance
@property (nonatomic, strong) AFHTTPSessionManager        *manager;
@property (nonatomic, strong) NSURLSessionDataTask        *httpOperation;
@property (nonatomic)         ECancelType                 cancelType;

@property (nonatomic)         BOOL                        isRunning;

#pragma mark -  Private Method

/**
 *  默认设置
 */
- (void)defaultConfig;

/**
 *  根据序列化枚举值返回对应的请求策略
 *
 *  @param serializerType 序列化枚举值
 *
 *  @return 序列化策略
 */
+ (AFHTTPRequestSerializer *)requestSerializerWith:(AFNetworkingRequestType)serializerType;

/**
 *  根据序列化枚举值返回对应的回复策略
 *
 *  @param serializerType 序列化枚举值
 *
 *  @return 序列化策略
 */
+ (AFHTTPResponseSerializer *)responseSerializerWith:(AFNetworkingResponseType)serializerType;

/**
 *  初始化网络状态监测
 */
+ (void)networkReachability;

@end


@implementation FYRequest

+ (void)initialize {
    if (self == [FYRequest class]) {
        // 显示网络指示器
        [self showNetworkActivityIndicator:YES];
        
        // 初始化网络监测
        [self networkReachability];
        
        // 开启网络监测
        [self startMonitoring];
    }
}


// 初始化网络监测
+ (void)networkReachability {
    NSURL *baseURL  = [NSURL URLWithString:reachabeBaseURL];
    _managerReachability = [[AFHTTPSessionManager alloc] initWithBaseURL:baseURL];
    
    NSOperationQueue *operationQueue = _managerReachability.operationQueue;
    [_managerReachability.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status){
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWWAN:
                [operationQueue setSuspended:NO];
                
                // 发送系统通知
                if (_canSendMessage == YES) {
                    [[NSNotificationCenter defaultCenter] postNotificationName:NetworkingReachability
                                                                        object:nil
                                                                      userInfo:@{@"networkReachable": NetworkingStatus_WWAN}];
                }
                break;
                
            case AFNetworkReachabilityStatusReachableViaWiFi:
                [operationQueue setSuspended:NO];
                
                if (_canSendMessage == YES) {
                    [[NSNotificationCenter defaultCenter] postNotificationName:NetworkingReachability
                                                                        object:nil
                                                                      userInfo:@{@"networkReachable": NetworkingStatus_WIFI}];
                }
                break;
            case AFNetworkReachabilityStatusNotReachable:
            default:
                [operationQueue setSuspended:YES];
                
                if (_canSendMessage == YES) {
                    [[NSNotificationCenter defaultCenter] postNotificationName:NetworkingReachability
                                                                        object:nil
                                                                      userInfo:@{@"networkReachable": NetworkingStatus_NotReachable}];
                }
                break;
        }
    }];
}

+ (void)startMonitoring {
    _canSendMessage = YES;
    [_managerReachability.reachabilityManager startMonitoring];
}

+ (void)stopMonitoring {
    _canSendMessage = NO;
    [_managerReachability.reachabilityManager stopMonitoring];
}

+ (BOOL)isReachable {
    return _managerReachability.reachabilityManager.isReachable;
}

+ (BOOL)isReachableViaWWAN {
    return _managerReachability.reachabilityManager.isReachableViaWWAN;
}

+ (BOOL)isReachableViaWiFi {
    return _managerReachability.reachabilityManager.isReachableViaWiFi;
}

/**
 *  初始化方法
 *
 *  @return 实例对象
 */
- (instancetype)init {
    self = [super init];
    if (self) {
        // 默认设置
        [self defaultConfig];
    }
    return self;
}

- (void)defaultConfig {
    self.manager   = [AFHTTPSessionManager manager];
    self.isRunning = NO;
}

+ (void)showNetworkActivityIndicator:(BOOL)show {
    [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:show];
}

- (void)startRequest
{
    if (self.urlString.length <= 0) {
        return;
    }
    
    // 进入请求状态
    _isRunning = YES;
    
    // 设置请求类型
    if (self.requestType) {
        self.manager.requestSerializer = [FYRequest requestSerializerWith:self.requestType];
    } else {
        self.manager.requestSerializer = [FYRequest requestSerializerWith:HTTPRequestType];
    }
    
    // 设置请求头部信息
    if (self.HTTPHeaderFieldsWithValues) {
        NSArray *allKeys = self.HTTPHeaderFieldsWithValues.allKeys;
        
        for (NSString *headerField in allKeys) {
            
            NSString *value = [self.HTTPHeaderFieldsWithValues valueForKey:headerField];
            [self.manager.requestSerializer setValue:value forHTTPHeaderField:headerField];
        }
    }
    
    // 设置回复类型
    if (self.responseType) {
        self.manager.responseSerializer = [FYRequest responseSerializerWith:self.responseType];
        self.manager.responseSerializer.acceptableContentTypes = \
        [self.manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    } else {
        self.manager.responseSerializer = [FYRequest responseSerializerWith:HTTPResponseType];
        self.manager.responseSerializer.acceptableContentTypes = \
        [self.manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    }
    
    // 设置超时时间
    if (self.timeoutInterval && self.timeoutInterval.floatValue > 0) {
        [self.manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
        self.manager.requestSerializer.timeoutInterval = self.timeoutInterval.floatValue;
        [self.manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    }
    
    // 开始执行请求
    if (self.RequestMethod == GET_METHOD) {
        
        __weak FYRequest *weakSelf = self;
        
        NSLog(@"--Parameters: %@", [weakSelf transformRequestDictionary]);
        
        self.httpOperation = [self.manager GET:self.urlString
                                    parameters:[weakSelf transformRequestDictionary]
                                      progress:^(NSProgress * _Nonnull downloadProgress) {
                              
                                       }
                                       success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                           
                                           weakSelf.isRunning = NO;
                                           
                                           if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(requestSucess:result:)]) {
                                               [weakSelf.delegate requestSucess:weakSelf result:[weakSelf transformRequestData:responseObject]];
                                           }
                                           
                                       }
                                       failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                           
                                           weakSelf.isRunning = NO;
                                           
                                           if (self.cancelType == USER_CANCEL) {
                                               if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(userCanceledFailed:error:)]) {
                                                   [weakSelf.delegate userCanceledFailed:weakSelf error:error];
                                                   weakSelf.cancelType = DEALLOC_CANCEL;
                                               }
                                           } else {
                                               if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(requestFailed:error:)]) {
                                                   [weakSelf.delegate requestFailed:weakSelf error:error];
                                               }
                                           }
                                           
                                       }];
        
    } else if (self.RequestMethod == POST_METHOD) {
        
        __weak FYRequest *weakSelf = self;
        
        self.httpOperation = [self.manager POST:self.urlString
                                     parameters:[weakSelf transformRequestDictionary]
                                       progress:^(NSProgress * _Nonnull uploadProgress) {
                              
                                        }
                                        success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                            
                                            weakSelf.isRunning = NO;
                                            
                                            if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(requestSucess:result:)]) {
                                                [_delegate requestSucess:weakSelf result:[weakSelf transformRequestData:responseObject]];
                                            }
                                        }
                                        failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                            
                                            weakSelf.isRunning = NO;
                                            
                                            if (self.cancelType == USER_CANCEL) {
                                                if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(userCanceledFailed:error:)]) {
                                                    [weakSelf.delegate userCanceledFailed:weakSelf error:error];
                                                    weakSelf.cancelType = DEALLOC_CANCEL;
                                                }
                                            } else {
                                                if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(requestFailed:error:)]) {
                                                    [weakSelf.delegate requestFailed:weakSelf error:error];
                                                }
                                            }
                                            
                                        }];
        
    } else {
            
            __weak FYRequest *weakSelf = self;
            
            self.httpOperation = [self.manager POST:self.urlString
                                         parameters:[weakSelf transformRequestDictionary]
                          constructingBodyWithBlock:nil progress:^(NSProgress * _Nonnull uploadProgress) {
                              
                          }
                                            success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                                
                                                weakSelf.isRunning = NO;
                                                
                                                if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(requestSucess:result:)]) {
                                                    [weakSelf.delegate requestSucess:weakSelf result:[weakSelf transformRequestData:responseObject]];
                                                }
                                                
                                            }
                                            failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                                
                                                weakSelf.isRunning = NO;
                                                
                                                if (self.cancelType == USER_CANCEL) {
                                                    if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(userCanceledFailed:error:)]) {
                                                        [weakSelf.delegate userCanceledFailed:weakSelf error:error];
                                                        weakSelf.cancelType = DEALLOC_CANCEL;
                                                    }
                                                } else {
                                                    if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(requestFailed:error:)]) {
                                                        [weakSelf.delegate requestFailed:weakSelf error:error];
                                                    }
                                                }
                                                
                                            }];
    }
}

- (void)startRequestSuccess:(void (^)(FYRequest *, id))success failure:(void (^)(FYRequest *, NSError *))failure {
    if (self.urlString.length <= 0) {
        return;
    }
    
    // 进入请求状态
    _isRunning = YES;
    
    // 设置请求类型
    if (self.requestType) {
        self.manager.requestSerializer = [FYRequest requestSerializerWith:self.requestType];
    } else {
        self.manager.requestSerializer = [FYRequest requestSerializerWith:HTTPRequestType];
    }
    
    // 设置请求头部信息
    if (self.HTTPHeaderFieldsWithValues) {
        NSArray *allKeys = self.HTTPHeaderFieldsWithValues.allKeys;
        
        for (NSString *headerField in allKeys) {
            
            NSString *value = [self.HTTPHeaderFieldsWithValues valueForKey:headerField];
            [self.manager.requestSerializer setValue:value forHTTPHeaderField:headerField];
        }
    }
    
    // 设置回复类型
    if (self.responseType) {
        self.manager.responseSerializer = [FYRequest responseSerializerWith:self.responseType];
        self.manager.responseSerializer.acceptableContentTypes = \
        [self.manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    } else {
        self.manager.responseSerializer = [FYRequest responseSerializerWith:HTTPResponseType];
        self.manager.responseSerializer.acceptableContentTypes = \
        [self.manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    }
    
    // 设置超时时间
    if (self.timeoutInterval && self.timeoutInterval.floatValue > 0) {
        [self.manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
        self.manager.requestSerializer.timeoutInterval = self.timeoutInterval.floatValue;
        [self.manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    }
    
    // 开始执行请求
    if (self.RequestMethod == GET_METHOD) {
        
        __weak FYRequest *weakSelf = self;
        
        NSLog(@"--Parameters: %@", [weakSelf transformRequestDictionary]);
        
        self.httpOperation = [self.manager GET:self.urlString
                                    parameters:[weakSelf transformRequestDictionary]
                                      progress:^(NSProgress * _Nonnull downloadProgress) {
                              
                                       }
                                       success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                           
                                           weakSelf.isRunning = NO;
                                           
                                           success(weakSelf, responseObject);
                                           
                                       }
                                       failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                           
                                           weakSelf.isRunning = NO;
                                           
                                           if (self.cancelType == USER_CANCEL) {
                                               if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(userCanceledFailed:error:)]) {
                                                   [weakSelf.delegate userCanceledFailed:weakSelf error:error];
                                                   weakSelf.cancelType = DEALLOC_CANCEL;
                                               }
                                           } else {
                                               failure(weakSelf, error);
                                           }
                                           
                                       }];
        
    } else if (self.RequestMethod == POST_METHOD) {
        
        __weak FYRequest *weakSelf = self;
        
        self.httpOperation = [self.manager POST:self.urlString
                                     parameters:[weakSelf transformRequestDictionary]
                                       progress:^(NSProgress * _Nonnull uploadProgress) {
                              
                                       }
                                        success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                            
                                            weakSelf.isRunning = NO;
                                            
                                            success(weakSelf, responseObject);
                                            
                                        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                            
                                            weakSelf.isRunning = NO;
                                            
                                            if (self.cancelType == USER_CANCEL) {
                                                if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(userCanceledFailed:error:)]) {
                                                    [weakSelf.delegate userCanceledFailed:weakSelf error:error];
                                                    weakSelf.cancelType = DEALLOC_CANCEL;
                                                }
                                            } else {
                                                failure(weakSelf, error);
                                            }
                                            
                                        }];
        
    } else {
            
            __weak FYRequest *weakSelf = self;
            
            self.httpOperation = [self.manager POST:self.urlString
                                         parameters:[weakSelf transformRequestDictionary]
                          constructingBodyWithBlock:nil
                                           progress:^(NSProgress * _Nonnull uploadProgress) {
                                  
                                            }
                                            success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                                
                                                weakSelf.isRunning = NO;
                                                
                                                success(weakSelf, responseObject);
                                                
                                            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                                
                                                weakSelf.isRunning = NO;
                                                
                                                if (self.cancelType == USER_CANCEL) {
                                                    if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(userCanceledFailed:error:)]) {
                                                        [weakSelf.delegate userCanceledFailed:weakSelf error:error];
                                                        weakSelf.cancelType = DEALLOC_CANCEL;
                                                    }
                                                } else {
                                                    failure(weakSelf, error);
                                                }
                                                
                                            }];
        }
}

- (void)cancelRequest {
    self.cancelType = USER_CANCEL;
    [self.httpOperation cancel];
}

- (void)dealloc {
    self.cancelType = DEALLOC_CANCEL;
    [self.httpOperation cancel];
}

+ (AFHTTPRequestSerializer *)requestSerializerWith:(AFNetworkingRequestType)serializerType {
    if (serializerType == JSONRequestType) {
        return [AFJSONRequestSerializer serializer];
    } else if (serializerType == HTTPRequestType) {
        return [AFHTTPRequestSerializer serializer];
    } else if (serializerType == PlistRequestType) {
        return [AFPropertyListRequestSerializer serializer];
    } else {
        return nil;
    }
}

+ (AFHTTPResponseSerializer *)responseSerializerWith:(AFNetworkingResponseType)serializerType {
    if (serializerType == JSONResponseType) {
        return [AFJSONResponseSerializer serializer];
    } else if (serializerType == HTTPResponseType) {
        return [AFHTTPResponseSerializer serializer];
    } else if (serializerType == PlistResponseType) {
        return [AFPropertyListResponseSerializer serializer];
    } else if (serializerType == ImageResponseType) {
        return [AFImageResponseSerializer serializer];
    } else if (serializerType == CompoundResponseType) {
        return [AFCompoundResponseSerializer serializer];
    } else if (serializerType == XMLType) {
        return [AFXMLParserResponseSerializer serializer];
    } else {
        return nil;
    }
}

- (NSDictionary *)transformRequestDictionary {
    return self.requestDictionary;
}

- (id)transformRequestData:(id)data {
    return data;
}

+ (instancetype)requestWithUrlString:(NSString *)urlString
                   requestDictionary:(NSDictionary *)requestDictionary
                            delegate:(id)delegate
                     timeoutInterval:(NSNumber *)timeoutInterval
                                flag:(NSString *)flag
                       requestMethod:(AFNetworkingRequestMethod)requestMethod
                         requestType:(AFNetworkingRequestType)requestType
                        responseType:(AFNetworkingResponseType)responseType {
    FYRequest *request        = [[[self class] alloc] init];
    request.urlString         = urlString;
    request.requestDictionary = requestDictionary;
    request.delegate          = delegate;
    request.timeoutInterval   = timeoutInterval;
    request.flag              = flag;
    request.RequestMethod     = requestMethod;
    request.requestType       = requestType;
    request.responseType      = responseType;
    
    return request;
}

+ (NSURLSessionDataTask *)GET:(NSString *)URLString
                   parameters:(id)parameters
              timeoutInterval:(NSNumber *)timeInterval
                  requestType:(AFNetworkingRequestType)requestType
                 responseType:(AFNetworkingResponseType)responseType
                      success:(void (^)(NSURLSessionTask *, id))success
                      failure:(void (^)(NSURLSessionTask *, NSError *))failure {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    // 设置请求类型
    manager.requestSerializer = [FYRequest requestSerializerWith:requestType];
    
    // 设置回复类型
    manager.responseSerializer = [FYRequest responseSerializerWith:responseType];
    
    // 设置回复内容信息
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes  setByAddingObject:@"text/html"];
    
    // 设置超时时间
    if (timeInterval) {
        [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
        manager.requestSerializer.timeoutInterval = timeInterval.floatValue;
        [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    }
    
    NSURLSessionDataTask *httpOperation = [manager GET:URLString
                                            parameters:parameters
                                              progress:^(NSProgress * _Nonnull downloadProgress) {
                                                  
                                                  
                                              } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                                  
                                                  if (success) {
                                                      success(task, responseObject);
                                                  }
                                                  
                                              } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                                  
                                                  if (failure) {
                                                      failure(task, error);
                                                  }
                                                  
                                              }];
    return httpOperation;
}

+ (NSURLSessionDataTask *)POST:(NSString *)URLString
                    parameters:(id)parameters
               timeoutInterval:(NSNumber *)timeInterval
                   requestType:(AFNetworkingRequestType)requestType
                  responseType:(AFNetworkingResponseType)responseType
                       success:(void (^)(NSURLSessionTask *, id))success
                       failure:(void (^)(NSURLSessionTask *, NSError *))failure {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.requestSerializer = [FYRequest requestSerializerWith:requestType];
    
    manager.responseSerializer = [FYRequest responseSerializerWith:responseType];
    
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    
    // 设置超时时间
    if (timeInterval) {
        [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
        manager.requestSerializer.timeoutInterval = timeInterval.floatValue;
        [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    }
    
    NSURLSessionDataTask *httpOperation = [manager POST:URLString
                                             parameters:parameters
                                               progress:^(NSProgress * _Nonnull uploadProgress) {
                                                   
                                                   
                                               } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                                   
                                                   if (success) {
                                                       success(task, responseObject);
                                                   }
                                                   
                                               } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                                   
                                                   if (failure) {
                                                       failure(task, error);
                                                   }
                                                   
                                               }];
    return httpOperation;
}


@end
