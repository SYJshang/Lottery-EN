//
//  LTLotteryPickNumberCatch.h
//  Lottery
//
//  Created by Wen YanFei on 2017/6/29.
//  Copyright © 2017年 Wen YanFei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LTLotteryManager.h"

@class LTLotteryPlaySelectNumGroupMod,LTLotteryPlayMode;
@interface LTLotteryPickNumberCatch : NSObject
@property(nonatomic, strong)NSArray<LTLotteryPlaySelectNumGroupMod*>* numberList;

+ (instancetype)shardeCatch;

- (void)addNumberGrounp:(LTLotteryPlaySelectNumGroupMod*) number;
- (void)deleNumberGrounp:(LTLotteryPlaySelectNumGroupMod*) number;

- (void)save;

- (NSArray<LTLotteryManager*>*)listOfLotteryInfo:(LTLotteryInfoMode*)info;

- (NSArray<LTLotteryManager*>*)listOfLotteryPlay:(LTLotteryPlayMode*)play;

@end
