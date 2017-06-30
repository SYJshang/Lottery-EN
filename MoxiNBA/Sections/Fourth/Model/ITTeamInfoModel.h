//
//  ITTeamInfoModel.h
//  inrtest
//
//  Created by 张涛 on 2017/5/4.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ITTeamInfoModel : NSObject

//队名
@property (nonatomic, strong) NSString *team;
//排名
@property (nonatomic, assign) NSInteger rank;
//胜
@property (nonatomic, assign) NSInteger wins;
//平
@property (nonatomic, assign) NSInteger draws;
//已赛
@property (nonatomic, assign) NSInteger matchesPlayed;
//分数
@property (nonatomic, assign) NSInteger points;
//负
@property (nonatomic, assign) NSInteger losses;


@end
