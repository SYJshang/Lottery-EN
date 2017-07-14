//
//  LTLotteryPlayNumMod.m
//  Lottery
//
//  Created by Wen YanFei on 2017/6/28.
//  Copyright © 2017年 Wen YanFei. All rights reserved.
//

#import "LTLotteryPlayNumMod.h"

@implementation LTLotteryPlayNumMod

- (void)setMember:(id)member{
    if ([member isKindOfClass:[NSDictionary class]]) {
        NSInteger start = [member[@"start"] integerValue];
        NSInteger end = [member[@"end"] integerValue];
        BOOL keepZero = end > 9;
        NSMutableArray *mArr = [NSMutableArray arrayWithCapacity:end - start];
        for (NSInteger i = start; i<=end; i++){
            [mArr addObject:[NSString stringWithFormat:(keepZero?@"%.2zd":@"%zd"),i]];
        }
        _memberArr = [mArr copy];
    }else{
        _memberArr = member;
    }
}

- (void)setMinNum:(NSInteger)minNum{
    _minNum = minNum;
}

@end
