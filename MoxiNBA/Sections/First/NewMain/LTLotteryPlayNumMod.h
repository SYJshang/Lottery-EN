//
//  LTLotteryPlayNumMod.h
//  Lottery
//
//  Created by Wen YanFei on 2017/6/28.
//  Copyright © 2017年 Wen YanFei. All rights reserved.
//  选号时每一组选号的规则

#import <UIKit/UIKit.h>

@interface LTLotteryPlayNumMod : NSObject
@property(nonatomic,copy)   NSString* title;
@property(nonatomic,strong) id member;
@property(nonatomic,strong) NSArray<NSString*>* memberArr;
@property(nonatomic,assign) NSInteger bgColor;
@property(nonatomic,assign) NSInteger minNum;


@property(nonatomic,assign) CGFloat cellHeight;
@end
