//
//  ITBasketBallModel.h
//  inrtest
//
//  Created by 张涛 on 2017/5/4.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ITBasketBallModel : NSObject

@property (nonatomic, strong)NSString *hostName;
@property (nonatomic, strong)NSString *visitName;
@property (nonatomic, strong)NSString *matchOrder;
@property (nonatomic, strong)NSString *hostGoal;
@property (nonatomic, strong)NSString *visitGoal;
@property (nonatomic, strong)NSString *statusDescNew;
@property (nonatomic, strong)NSString *matchDay;
@property (nonatomic, strong)NSString *hostLogoUrl;
@property (nonatomic, strong)NSString *visitLogoUrl;

@end
