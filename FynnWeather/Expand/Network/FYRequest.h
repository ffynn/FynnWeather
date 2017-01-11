//
//  FYRequest.h
//  Read
//
//  Created by FLYang on 2017/1/9.
//  Copyright © 2017年 Fynn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>


@class FYRequest;

/**
 *  用于测试网络是否可以连接的基准URL地址
 */
static NSString *reachabeBaseURL               = @"https://baidu.com/";

/**
 *  提供给外部监听用,监测网络状态变化
 */
static NSString *NetworkingReachability        = @"_networkingReachability_";

/**
 *  外部接收通知用字符串
 */
static NSString *NetworkingStatus_WWAN         = @"_netStatus_WWAN_";
static NSString *NetworkingStatus_WIFI         = @"_netStatus_WIFI_";
static NSString *NetworkingStatus_NotReachable = @"_netStatus_NotReachable_";

typedef void(^ConstructingBodyBlock)(id<AFMultipartFormData> formData);


typedef enum : NSUInteger {
    GET_METHOD,                  // GET请求
    POST_METHOD,                 // POST请求
    
} AFNetworkingRequestMethod;


typedef enum : NSUInteger {
    
    /*------ 常用 ------*/
    HTTPRequestType = 0x11,      // 二进制格式 (不设置的话为默认格式)
    JSONRequestType,             // JSON方式
    /*-----------------*/
    
    PlistRequestType,            // 集合文件方式
    
} AFNetworkingRequestType;


typedef enum : NSUInteger {
    
    /*------ 常用 ------*/
    HTTPResponseType = 0x33,     // 二进制格式 (不设置的话为默认格式)
    JSONResponseType,            // JSON方式
    XMLType,                     // XML的方式
    ImageResponseType,           // 图片方式
    /*-----------------*/
    
    PlistResponseType,           // 集合文件方式
    CompoundResponseType,        // 组合方式
    
} AFNetworkingResponseType;


@protocol FYRequestDelegate <NSObject>

@optional
/**
 *  请求成功
 *
 *  @param request FYRequest实例对象
 *  @param result       数据
 */
- (void)requestSucess:(FYRequest *)request result:(id)result;

/**
 *  请求失败
 *
 *  @param request FYRequest实例对象
 *  @param error      错误信息
 */
- (void)requestFailed:(FYRequest *)request error:(NSError *)error;

/**
 *  用户取消请求
 *
 *  @param request Networking实例对象
 *  @param error      错误信息
 */
- (void)userCanceledFailed:(FYRequest *)request error:(NSError *)error;

@end


@interface FYRequest : NSObject

/**
 *  是否显示网络提示(左上角旋转的Indicator,默认为显示)
 *
 *  @param show 展示
 */
+ (void)showNetworkActivityIndicator:(BOOL)show;

/**
 *  开始网络监测(默认就是开启)
 */
+ (void)startMonitoring;

/**
 *  停止网络监测
 */
+ (void)stopMonitoring;

/**
 *  是否可以联网
 *
 *  @return YES为可以,NO为不行
 */
+ (BOOL)isReachable;

/**
 *  当前是否是WWAN网络
 *
 *  @return YES为是,NO为不是
 */
+ (BOOL)isReachableViaWWAN;

/**
 *  当前是否为WIFI网络
 *
 *  @return YES为是,NO为不是
 */
+ (BOOL)isReachableViaWiFi;

/**
 *  代理
 */
@property (nonatomic, weak) id <FYRequestDelegate> delegate;

/**
 *  是否正在处于请求当中(可以用这个值来判断一个请求是否处于执行状态当中)
 */
@property (nonatomic, readonly)  BOOL              isRunning;

/**
 *  标识符
 */
@property (nonatomic, strong)    NSString          *flag;

/**
 *  超时时间间隔(设置了才能生效,不设置,使用的是AFNetworking自身的超时时间间隔)
 */
@property (nonatomic, strong)    NSNumber           *timeoutInterval;

/**
 *  请求的类型
 */
@property (nonatomic)  AFNetworkingRequestType      requestType;


/**
 *  回复的类型
 */
@property (nonatomic) AFNetworkingResponseType      responseType;

/**
 *  请求的方法类型
 */
@property (nonatomic) AFNetworkingRequestMethod     RequestMethod;

/**
 *  网络请求地址
 */
@property (nonatomic, strong) NSString              *urlString;

/**
 *  作为请求数据字典
 */
@property (nonatomic, strong) NSDictionary          *requestDictionary;

/**
 *  设置请求头部信息用字典(字典均由字符串组成,字典的key为HTTPHeaderField,value为其对应的值)
 */
@property (nonatomic, strong) NSDictionary          *HTTPHeaderFieldsWithValues;

/**
 *  构造数据用block(用于UPLOAD_DATA方法)
 */
@property (nonatomic, copy)  ConstructingBodyBlock  constructingBodyBlock;

/**
 *
 *  -====== 此方法由继承的子类来重载实现 ======-
 *
 *  转换请求字典
 *
 *  @return 转换后的字典
 */
- (NSDictionary *)transformRequestDictionary;

/**
 *
 *  -====== 此方法由继承的子类来重载实现 ======-
 *
 *  对返回的结果进行转换
 *
 *  @return 转换后的结果
 */
- (id)transformRequestData:(id)data;

/**
 *  开始请求
 */
- (void)startRequest;
- (void)startRequestSuccess:(void(^)(FYRequest * request, id result))success failure:(void(^)(FYRequest * request, NSError * error))failure;

/**
 *  取消请求
 */
- (void)cancelRequest;


#pragma mark - 便利构造器方法

/**
 *  便利构造器方法
 *
 *  @param urlString         请求地址
 *  @param requestDictionary 请求参数
 *  @param delegate          代理
 *  @param timeoutInterval   超时时间
 *  @param flag              标签
 *  @param requestMethod     请求方法
 *  @param requestType       请求类型
 *  @param responseType      回复数据类型
 *
 *  @return 实例对象
 */
+ (instancetype)requestWithUrlString:(NSString *)urlString
                   requestDictionary:(NSDictionary *)requestDictionary
                            delegate:(id)delegate
                     timeoutInterval:(NSNumber *)timeoutInterval
                                flag:(NSString *)flag
                       requestMethod:(AFNetworkingRequestMethod)requestMethod
                         requestType:(AFNetworkingRequestType)requestType
                        responseType:(AFNetworkingResponseType)responseType;

#pragma mark - block的形式请求

/**
 *  AFNetworking的GET请求
 *
 *  @param URLString    请求网址
 *  @param parameters   网址参数
 *  @param timeInterval 超时时间(可以设置为nil)
 *  @param requestType  请求类型
 *  @param responseType 返回结果类型
 *  @param success      成功时调用的block
 *  @param failure      失败时调用的block
 *
 *  @return 网络操作句柄
 */
+ (NSURLSessionDataTask *)GET:(NSString *)URLString
                   parameters:(id)parameters
              timeoutInterval:(NSNumber *)timeInterval
                  requestType:(AFNetworkingRequestType)requestType
                 responseType:(AFNetworkingResponseType)responseType
                      success:(void (^)(NSURLSessionTask *operation, id responseObject))success
                      failure:(void (^)(NSURLSessionTask *operation, NSError *error))failure;


/**
 *  AFNetworking的POST请求
 *
 *  @param URLString    请求网址
 *  @param parameters   网址参数
 *  @param timeInterval 超时时间(可以设置为nil)
 *  @param requestType  请求类型
 *  @param responseType 返回结果类型
 *  @param success      成功时调用的block
 *  @param failure      失败时调用的block
 *
 *  @return 网络操作句柄
 */
+ (NSURLSessionDataTask *)POST:(NSString *)URLString
                    parameters:(id)parameters
               timeoutInterval:(NSNumber *)timeInterval
                   requestType:(AFNetworkingRequestType)requestType
                  responseType:(AFNetworkingResponseType)responseType
                       success:(void (^)(NSURLSessionTask *operation, id responseObject))success
                       failure:(void (^)(NSURLSessionTask *operation, NSError *error))failure;


@end
