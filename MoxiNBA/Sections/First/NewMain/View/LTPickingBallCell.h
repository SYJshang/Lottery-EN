//
//  LTPickingBallCell.h
//  Lottery
//
//  Created by Wen YanFei on 2017/6/29.
//  Copyright © 2017年 Wen YanFei. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LTLotteryPlayNumMod, LTLotteryPlaySelectNumMode;
@interface LTPickingBallCell : UITableViewCell

@property(nonatomic, weak)LTLotteryPlayNumMod *model;
@property(nonatomic, strong)LTLotteryPlaySelectNumMode *selectNum;
@property(nonatomic, assign)CGFloat height;

@end
