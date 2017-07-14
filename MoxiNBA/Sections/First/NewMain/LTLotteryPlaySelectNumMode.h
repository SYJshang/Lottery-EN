//
//  LTLotteryPlaySelectNumMode.h
//  Lottery
//
//  Created by Wen YanFei on 2017/6/29.
//  Copyright © 2017年 Wen YanFei. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "LTLotteryPlayNumMod.h"
@interface LTLotteryPlaySelectNumMode : NSObject<NSCoding>

@property(nonatomic,weak)LTLotteryPlayNumMod *model;
@property(nonatomic,strong)NSArray<NSNumber *> *selectIndexs;
@property(nonatomic,strong)NSArray<NSString *> *selectStr;
@property(nonatomic,assign)long long count;
@property(nonatomic,copy)void(^chaned)();

@end
