//
//  GlobalsConfig.m
//  Domino
//
//  Created by fred on 16/7/26.
//  Copyright © 2016年 jack.wang. All rights reserved.
//

#import "GlobalsConfig.h"

static GlobalsConfig *shareinstance;

@implementation GlobalsConfig

@synthesize myToken;
//@synthesize userEntity;


+(GlobalsConfig *) shareInstance
{
    if (!shareinstance) {
        shareinstance = [[GlobalsConfig alloc] init];
    }
    
    return shareinstance;
}

#pragma mark - token

-(NSString *)myToken
{
    NSString *token=[[NSUserDefaults standardUserDefaults] objectForKey:MyToken];
    if (token) {
        return token;
    } else {
        return @"";
    }
}
-(NSString *)webSite
{
    NSString *website=[[NSUserDefaults standardUserDefaults] objectForKey:WEBSITE];
    if (website) {
        return website;
    } else {
        return @"";
    }
}

-(void)setMyToken:(NSString *)tokennn{
    
    [[NSUserDefaults standardUserDefaults] setObject:tokennn forKey:MyToken];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
-(void)setWebSite:(NSString *)website{
    
    [[NSUserDefaults standardUserDefaults] setObject:website forKey:WEBSITE];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(void)removeMyToken {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:MyToken];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)selectCity {
    // 获取当前所在的城市名
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    //根据经纬度反向地理编译出地址信息
    [geocoder reverseGeocodeLocation:self.myCllocation completionHandler:^(NSArray *array, NSError *error)
     {
         if (array.count > 0)
         {
             CLPlacemark *placemark = [array objectAtIndex:0];
             //获取城市
             NSString *city = placemark.locality;
             if (!city) {
                 //四大直辖市的城市信息无法通过locality获得，只能通过获取省份的方法来获得（如果city为空，则可知为直辖市）
                 city = placemark.administrativeArea;
             }
             NSLog(@"city = %@", city);
             NSLog(@"===>%@=======>=====>%@=======》%@",placemark.country,placemark.locality,placemark);
             self.myCity = city;
         }
         else if (error == nil && [array count] == 0)
         {
             NSLog(@"No results were returned.");
         }
         else if (error != nil)
         {
             NSLog(@"An error occurred = %@", error);
         }
     }];
}


@end
