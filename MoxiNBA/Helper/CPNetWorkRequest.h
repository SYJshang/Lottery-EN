//
//  CPNetWorkRequest.h
//  inrtest
//
//  Created by 张涛 on 2017/5/3.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

@interface CPNetWorkRequest : NSObject

+ (CPNetWorkRequest *)sharedClient;

- (void)getNetWorkState: (void (^)(AFNetworkReachabilityStatus state)) success isNot: (BOOL)isNot;
- (void)CurrentNetWorkState: (void (^)(AFNetworkReachabilityStatus state)) success;
@property (nonatomic, assign) int netWorkState;

- (void)get:(NSString *)url parame:(NSDictionary *)parame
    success:(void (^)(id object))success
    failure:(void (^)(NSError *err))failure;

- (void)post:(NSString *)url parame:(NSDictionary *)parame
     success:(void (^)(id object))success
     failure:(void (^)(NSError *err))failure;

//- (void)put:(NSString *)url parame:(NSDictionary *)parame
//    success:(void (^)(id object))success
//    failure:(void (^)(NSError *err))failure;

//- (void)deletes:(NSString *)url parame:(NSDictionary *)parame
//        success:(void (^)(id object))success
//        failure:(void (^)(NSError *err))failure;

//- (void)login

@end
