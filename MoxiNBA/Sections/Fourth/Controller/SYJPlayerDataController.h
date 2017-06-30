//
//  SYJPlayerDataController.h
//  MoxiNBA
//
//  Created by 尚勇杰 on 2017/6/16.
//  Copyright © 2017年 尚勇杰. All rights reserved.
//

#import "SYJBaseViewController.h"
#import "SYJGameModel.h"
#import "SYJPlayerModel.h"

@interface SYJPlayerDataController : SYJBaseViewController

@property (nonatomic, strong) SYJGameModel *model;
@property (nonatomic, strong) SYJPlayerModel *playerID;

@end
