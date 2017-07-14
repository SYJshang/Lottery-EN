//
//  LTLotteryInfoMode.h
//  Lottery
//
//  Created by Wen YanFei on 2017/6/28.
//  Copyright © 2017年 Wen YanFei. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LTLotteryPlayMode;
@interface LTLotteryInfoMode : NSObject

@property(nonatomic, copy) NSString* shortKey;
@property(nonatomic, copy) NSString* iconName;
@property(nonatomic, copy) NSString* title;
@property(nonatomic, copy) NSString* subTitle;
@property(nonatomic, assign) NSInteger blueNumber;
@property(nonatomic, strong) NSArray<LTLotteryPlayMode*>*rule;

- (LTLotteryPlayMode *) playWithArray:(NSArray*) arr;

@end
