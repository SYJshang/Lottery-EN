//
//  SYJHttpHelper.h
//  MoXiDemo
//
//  Created by 尚勇杰 on 2017/5/26.
//  Copyright © 2017年 尚勇杰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>


@interface SYJHttpHelper : NSObject

//为什么不要返回值：1.responseObject已经返回回来数据，就不需要返回值
//               2.网络数据有延迟，不会马上返回


/**
 *  发送get请求
 *
 *  @param URLString  请求的基本的url
 *  @param parameters 请求的参数字典
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 */
+ (void)GET:(NSString *)URLString parameters:(id)parameters
    success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

/**
 *  发送post请求
 *
 *  @param URLString  请求的基本的url
 *  @param parameters 请求的参数字典
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 */

+ (void)Post:(NSString *)URLString parameters:(id)parameters
     success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

//获取AFHTTPSessionManager
+ (AFHTTPSessionManager *)getHttpSessionManager;


@end
