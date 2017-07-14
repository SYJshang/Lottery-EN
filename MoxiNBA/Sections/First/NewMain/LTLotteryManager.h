//
//  LTLotteryManager.h
//  Lottery
//
//  Created by Wen YanFei on 2017/6/27.
//  Copyright © 2017年 Wen YanFei. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LTLotteryInfoMode;

@interface LTLotteryManager : NSObject

+ (NSDictionary<NSString*,LTLotteryInfoMode*>*)lotteryInfo;

@end
