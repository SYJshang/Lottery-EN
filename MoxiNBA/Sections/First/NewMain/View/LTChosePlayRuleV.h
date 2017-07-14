//
//  LTChosePlayRuleV.h
//  Lottery
//
//  Created by Wen YanFei on 2017/6/28.
//  Copyright © 2017年 Wen YanFei. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LTLotteryInfoMode,LTLotteryPlayMode;
@interface LTChosePlayRuleV : UIView

@property(nonatomic, strong)NSArray<LTLotteryPlayMode*> *playList;
@property(nonatomic,weak)LTLotteryInfoMode* lotteryInfo;
@property(nonatomic,weak,readonly) LTLotteryPlayMode *play;
@property(nonatomic,copy)void (^playChange)(LTChosePlayRuleV* v);
@end
