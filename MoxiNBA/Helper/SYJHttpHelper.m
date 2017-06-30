//
//  SYJHttpHelper.m
//  MoXiDemo
//
//  Created by 尚勇杰 on 2017/5/26.
//  Copyright © 2017年 尚勇杰. All rights reserved.
//

#import "SYJHttpHelper.h"

@implementation SYJHttpHelper

+ (void)GET:(NSString *)URLString parameters:(id)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    
    AFHTTPSessionManager *manger = [self getHttpSessionManager];
    // 设置超时时间
    [manger.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manger.requestSerializer.timeoutInterval = 10.f;
    [manger.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    
    [manger GET:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //AFN请求成功的时候调用
        //先把请求成功之后要做的事情保存到这个代码块
        if (success) {
            success(responseObject);
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            if (failure) {
                failure(error);
            }
        }
    }];
    
}




+ (void)Post:(NSString *)URLString parameters:(id)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    
    
    AFHTTPSessionManager *mgr = [self getHttpSessionManager];
    // 设置超时时间
    [mgr.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    mgr.requestSerializer.timeoutInterval = 10.f;
    [mgr.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    
    [mgr POST:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        if (success) {
            success(responseObject);
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failure) {
            
            if (error.code == -1001) {
                MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
                hud.mode = MBProgressHUDModeText;
                hud.labelColor = [UIColor whiteColor];
                hud.color = [UIColor blackColor];
                hud.labelText = NSLocalizedString(@"The request timeout！", @"HUD message title");
                [hud hide:YES afterDelay:2.0];

            }
            
            failure(error);
        }
        
    }];
    
}

+ (AFHTTPSessionManager *)getHttpSessionManager
{
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:config];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html",@"text/json",@"text/javascript",@"text/plain",@"image/jpeg",@"multipart/form-data", nil];
    AFHTTPRequestSerializer *requestSerializer =  [AFHTTPRequestSerializer serializer];
    NSDictionary *headerFieldValueDictionary = @{@"X-Requested-With":@"XMLHttpRequest"};
    
    if (headerFieldValueDictionary != nil) {
        for (NSString *httpHeaderField in headerFieldValueDictionary.allKeys) {
            NSString *value = headerFieldValueDictionary[httpHeaderField];
            [requestSerializer setValue:value forHTTPHeaderField:httpHeaderField];
        }
    }
    manager.requestSerializer = requestSerializer;
    
    return manager;
}


@end
