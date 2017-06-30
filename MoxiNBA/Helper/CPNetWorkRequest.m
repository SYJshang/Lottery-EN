//
//  CPNetWorkRequest.m
//  inrtest
//
//  Created by 张涛 on 2017/5/3.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import "CPNetWorkRequest.h"
#import <objc/runtime.h>

static AFNetworkReachabilityManager *netStatus = nil;

@implementation CPNetWorkRequest

- (void)getNetWorkState:(void (^)(AFNetworkReachabilityStatus))success isNot:(BOOL)isNot{
    
    netStatus = [AFNetworkReachabilityManager sharedManager];
    [netStatus startMonitoring];
    [netStatus setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        if (success) {
            success(status);
        }
        if (status == AFNetworkReachabilityStatusNotReachable) {
            [SVProgressHUD showErrorWithStatus:@"当前未连接网络"];
        }
        
        if (isNot) {
            [[NSNotificationCenter defaultCenter] postNotificationName:@"NETWORK_STATUS_CHANGE_NOT" object:@(status)];
        }
        
        /*if (status == AFNetworkReachabilityStatusReachableViaWWAN) {
         //[self tishiWithTitle:@"提示" message:@"当前网络为WWAN" title2:@"返回"];
         }
         
         if (status == AFNetworkReachabilityStatusReachableViaWiFi) {
         //[self tishiWithTitle:@"提示" message:@"当前网络为WiFi" title2:@"返回"];
         }
         if (status == AFNetworkReachabilityStatusUnknown) {
         //[self tishiWithTitle:@"提示" message:@"当前为未知网" title2:@"返回"];
         }*/
    }];
    
}

- (void)CurrentNetWorkState:(void (^)(AFNetworkReachabilityStatus))success{
    int type = self.netWorkState;
    if (type == 0) {
        success(AFNetworkReachabilityStatusNotReachable);
    }else if (type == 1){
        success(AFNetworkReachabilityStatusReachableViaWWAN);
    }else if (type == 2){
        success(AFNetworkReachabilityStatusReachableViaWWAN);
    }else if (type == 3){
        success(AFNetworkReachabilityStatusReachableViaWWAN);
    }else if (type == 5){
        success(AFNetworkReachabilityStatusReachableViaWiFi);
    }
}

- (int)netWorkState{
    UIApplication *app = [UIApplication sharedApplication];
    NSArray *children = [[[app valueForKeyPath:@"statusBar"] valueForKeyPath:@"foregroundView"] subviews];
    int type = 0;
    for (id child in children) {
        if ([child isKindOfClass:NSClassFromString(@"UIStatusBarDataNetworkItemView")]) {
            type = [[child valueForKeyPath:@"dataNetworkType"] intValue];
        }
    }
    return type;
}

+ (CPNetWorkRequest *)sharedClient
{
    static CPNetWorkRequest *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        _sharedClient = [[CPNetWorkRequest alloc] init];
        if (!netStatus) {
            [_sharedClient getNetWorkState:nil isNot:YES];
        }
    });
    return _sharedClient;
}

- (void)get:(NSString *)url parame:(NSDictionary *)parame
    success:(void (^)(id object))success
    failure:(void (^)(NSError *err))failure{
    
//    url = [CPNetWorkRequest requestWithAddress:url];
    
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    
////    NSString *token = [CDAccount getAccoutModel].token ? [CDAccount getAccoutModel].token : @"";
//    //设置请求的参数为json格式
//    manager.requestSerializer = [AFJSONRequestSerializer serializer];
//    [manager.requestSerializer setValue:@"application/json;charset=utf-8" forHTTPHeaderField:@"Content-Type"];
//    [manager.requestSerializer setValue:@"XMLHttpRequest" forHTTPHeaderField:@"x-requested-with"];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html",@"text/plain", nil];
    //请求头
//    [manager.requestSerializer setValue:token forHTTPHeaderField:@"API-Token"];
    
    [manager GET:url parameters:parame progress:^(NSProgress * _Nonnull downloadProgress) {
        
    }
         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             
             success(responseObject);
             
         }
     
         failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull   error) {
             
             NSLog(@"%@",error);  //这里打印错误信息
             
         }];
}


- (void)post:(NSString *)url parame:(NSDictionary *)parame
     success:(void (^)(id object))success
     failure:(void (^)(NSError *err))failure{
    
//    url = [CDNetWorkConfig requestWithAddress:url];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];

    
//    NSString *token = [CDAccount getAccoutModel].token ? [CDAccount getAccoutModel].token : @"";
    
//    设置请求的参数为json格式
//    manager.requestSerializer = [AFJSONRequestSerializer serializer];
//    [manager.requestSerializer setValue:@"application/json;charset=utf-8" forHTTPHeaderField:@"Content-Type"];
//    [manager.requestSerializer setValue:@"XMLHttpRequest" forHTTPHeaderField:@"x-requested-with"];
    manager.responseSerializer.acceptableContentTypes =  [NSSet setWithObjects:@"text/html",@"application/json",@"text/javascript",@"text/json",@"text/plain",@"charset=UTF-8", nil];
    
    // 设置请求头
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
//    [manager.requestSerializer setValue:authorization forHTTPHeaderField:@"Authorization"];
    //请求头
//    [manager.requestSerializer setValue:token forHTTPHeaderField:@"API-Token"];
    
    
    [manager POST:url parameters:parame progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(error);
        
    }];
}


@end
