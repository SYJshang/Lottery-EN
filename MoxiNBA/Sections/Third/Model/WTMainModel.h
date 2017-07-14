//
//  WTWeatherModel.h
//  inrtest
//
//  Created by zt on 2017/5/31.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WTMainModel : NSObject

@property (nonatomic, assign) CGFloat temp;

@property (nonatomic, assign) CGFloat temp_min;

@property (nonatomic, assign) CGFloat temp_max;

@property (nonatomic, assign) CGFloat pressure;

@property (nonatomic, strong) NSString *sea_level;

@property (nonatomic, strong) NSString *grnd_level;

@property (nonatomic, strong) NSString *humidity;

@property (nonatomic, strong) NSString *temp_kf;

@end
