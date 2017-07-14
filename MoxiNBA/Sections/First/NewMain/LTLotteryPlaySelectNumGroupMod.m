//
//  LTLotteryPlaySelectNumGroupMod.m
//  Lottery
//
//  Created by Wen YanFei on 2017/6/29.
//  Copyright © 2017年 Wen YanFei. All rights reserved.
//

#import "LTLotteryPlaySelectNumGroupMod.h"
#import "LTLotteryInfoMode.h"
#import "LTLotteryPlayMode.h"
#import "LTLotteryPlaySelectNumMode.h"
#import "LTLotteryManager.h"

@implementation LTLotteryPlaySelectNumGroupMod

- (void)encodeWithCoder:(NSCoder *)aCoder{
    
    [aCoder encodeObject:self.lotteryInfo.shortKey forKey:@"lotteryInfo.shortKey"];
    NSArray* playNameArr = [self.play playNameArr];
    [aCoder encodeObject:playNameArr forKey:@"playNameArr"];
    [aCoder encodeObject:self.selectNums forKey:@"selectNums"];
    NSTimeInterval t = [self.savedDate timeIntervalSince1970] ;
    [aCoder encodeObject:@(t) forKey:@"savedDate"];
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (self) {
        self.lotteryInfo =  LTLotteryManager.lotteryInfo[[coder decodeObjectForKey:@"lotteryInfo.shortKey"]];
        self.play = [self.lotteryInfo playWithArray:[coder decodeObjectForKey:@"playNameArr"]];
        self.selectNums = [coder decodeObjectForKey:@"selectNums"];
        
        NSTimeInterval t = [[coder decodeObjectForKey:@"savedDate"] doubleValue];
        
        if (t > 0) {
            self.savedDate = [NSDate dateWithTimeIntervalSince1970:t];
        }
        
        self.selectNums = [self.selectNums subarrayWithRange:NSMakeRange(0, self.play.set.count)];
        for (int i = 0; i < self.selectNums.count; i++) {
            self.selectNums[i].model = self.play.set[i];
        }
    }
    return self;
}

- (long long)getCount{
    long long sum = self.selectNums[0].count;
    
    for (int i = 1; i < self.selectNums.count; i ++) {
        sum *= self.selectNums[i].count;
    }
    
    return sum;
}



- (NSString *)dateStr{
    if (!_dateStr) {
        if (self.savedDate) {
            NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
            formatter.dateFormat = @"yyyy-MM-dd HH:mm";
            _dateStr = [formatter stringFromDate:self.savedDate];
        }else{
            self.dateStr = @"";
        }
    }
    return _dateStr;
}

@end
