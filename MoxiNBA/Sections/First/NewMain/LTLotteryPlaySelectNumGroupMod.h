//
//  LTLotteryPlaySelectNumGroupMod.h
//  Lottery
//
//  Created by Wen YanFei on 2017/6/29.
//  Copyright © 2017年 Wen YanFei. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LTLotteryPlayNumMod,LTLotteryPlaySelectNumMode,LTLotteryInfoMode,LTLotteryPlayMode;
@interface LTLotteryPlaySelectNumGroupMod : NSObject<NSCoding>

@property(nonatomic,weak)LTLotteryInfoMode* lotteryInfo;

@property(nonatomic, weak)LTLotteryPlayMode* play;

@property(nonatomic, strong)NSArray<LTLotteryPlaySelectNumMode*>* selectNums;

@property(nonatomic, strong)NSDate* savedDate;

@property(nonatomic, copy)NSString* dateStr;

@property(nonatomic, assign)CGFloat cellHeight;

- (long long)getCount;

@end
