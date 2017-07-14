//
//  LTLotteryBookCellBallView.h
//  Lottery
//
//  Created by Wen YanFei on 2017/6/29.
//  Copyright © 2017年 Wen YanFei. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LTLotteryPlaySelectNumMode;
@interface LTLotteryBookCellBallView : UIView

@property(nonatomic, weak)NSArray<LTLotteryPlaySelectNumMode*>* number;

@end
