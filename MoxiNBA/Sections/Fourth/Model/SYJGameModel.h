//
//  SYJGameModel.h
//  MoxiNBA
//
//  Created by 尚勇杰 on 2017/6/15.
//  Copyright © 2017年 尚勇杰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SYJScoreModel.h"

@interface SYJGameModel : NSObject

@property (nonatomic , assign) NSString             * gameId;
@property (nonatomic , strong) SYJScoreModel              * homeTeam;
@property (nonatomic , assign) BOOL              finished;
@property (nonatomic , copy) NSString              * seasonPhase;
@property (nonatomic , copy) NSString              * gameDay;
@property (nonatomic , copy) NSString              * year;
@property (nonatomic , copy) NSString              * startTime;
@property (nonatomic , strong) SYJScoreModel              * awayTeam;

@end
