//
//  SYJDetailPowerModel.h
//  MoxiNBA
//
//  Created by 尚勇杰 on 2017/6/27.
//  Copyright © 2017年 尚勇杰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SYJMatchModel.h"

@interface SYJDetailPowerModel : NSObject

@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSString *gameName;
@property (nonatomic, strong) NSString *lastDrawNumbers;
@property (nonatomic, strong) NSString *location;
@property (nonatomic, strong) NSString *nextDrawDate;
@property (nonatomic, strong) NSString *nextJackpot;
@property (nonatomic, strong) NSString *updateTime;
@property (nonatomic, strong) NSArray  *payouts;


@end
