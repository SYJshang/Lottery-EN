//
//  GlobalsConfig.h
//  Domino
//
//  Created by fred on 16/7/26.
//  Copyright © 2016年 jack.wang. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "UserEntity.h"
//#import "CityEntity.h"
#import <CoreLocation/CoreLocation.h>

#define MyToken         @"myToken"
#define WEBSITE         @"website"

@interface GlobalsConfig : NSObject

@property (nonatomic, retain)   NSString     *myToken;
//@property (nonatomic, retain)   UserEntity   *userEntity;
@property (nonatomic, strong)   CLLocation   *myCllocation;
@property (nonatomic, retain)   NSString     *myCity;
//@property (nonatomic, strong)   CityEntity   *myEntity;
@property (nonatomic, assign)   BOOL         isJump;
@property (nonatomic, retain)   NSDictionary *jumpTo;
@property (nonatomic, retain)   NSString     *code;
@property (nonatomic, retain)   NSString     *webSite;

+(GlobalsConfig *) shareInstance;
- (void)selectCity;
- (void)removeMyToken;

@end
