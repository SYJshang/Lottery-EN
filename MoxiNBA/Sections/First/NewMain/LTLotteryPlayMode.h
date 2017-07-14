//
//  LTLotteryPlayMode.h
//  Lottery
//
//  Created by Wen YanFei on 2017/6/28.
//  Copyright © 2017年 Wen YanFei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LTLotteryPlayNumMod.h"

@class LTLotteryInfoMode;
@interface LTLotteryPlayMode : NSObject

@property(nonatomic, copy) NSString* type;
@property(nonatomic, assign) BOOL isGronp;
@property(nonatomic, copy) NSString* name;
@property(nonatomic, weak) LTLotteryInfoMode* lotteryInfo;
@property(nonatomic, weak) LTLotteryPlayMode* parentGrounp;
@property(nonatomic, strong) NSArray<LTLotteryPlayMode*> *grounp;
@property(nonatomic, strong) NSArray<LTLotteryPlayNumMod*>* set;

@property(nonatomic, copy)NSString* fullName;

- (NSArray*)playNameArr;

@end
