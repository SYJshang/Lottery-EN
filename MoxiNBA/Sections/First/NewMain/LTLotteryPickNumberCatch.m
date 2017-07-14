//
//  LTLotteryPickNumberCatch.m
//  Lottery
//
//  Created by Wen YanFei on 2017/6/29.
//  Copyright © 2017年 Wen YanFei. All rights reserved.
//

#import "LTLotteryPickNumberCatch.h"
#import "LTLotteryPlaySelectNumGroupMod.h"

#define filePath [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"lotterys.plist"]

@interface LTLotteryPickNumberCatch (){
    NSMutableArray<LTLotteryPlaySelectNumGroupMod*>* _numberList;
}


@end

@implementation LTLotteryPickNumberCatch

+ (instancetype)shardeCatch{
        static LTLotteryPickNumberCatch *_sharedCatch = nil;
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            
            _sharedCatch = [[LTLotteryPickNumberCatch alloc] init];
            
        });
    
    
        return _sharedCatch;
}

- (NSArray<LTLotteryPlaySelectNumGroupMod *> *)numberList{
    if (!_numberList) {
        _numberList = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
        if (!_numberList) {
            _numberList = [NSMutableArray array];
        }else{
            for (NSInteger i = _numberList.count - 1; i >= 0; i--) {
                if (!_numberList[i].play) {
                    [_numberList removeObjectAtIndex:i];
                }
            }
        }
    }
    return _numberList;
}

- (NSArray<LTLotteryManager*>*)listOfLotteryInfo:(LTLotteryInfoMode*)info{
    NSMutableArray *mArr = [NSMutableArray array];
    for (NSInteger i = 0; i < _numberList.count; i++) {
        if(_numberList[i].lotteryInfo == info) {
            [mArr addObject:self.numberList[i]];
        }
    }
    return [mArr copy];
}

- (NSArray<LTLotteryManager*>*)listOfLotteryPlay:(LTLotteryPlayMode*)play{
    NSMutableArray *mArr = [NSMutableArray array];
    for (NSInteger i = 0; i < _numberList.count; i++) {
        if(_numberList[i].play == play) {
            [mArr addObject:self.numberList[i]];
        }
    }
    return [mArr copy];
}

- (void)addNumberGrounp:(LTLotteryPlaySelectNumGroupMod *)number{
    [((NSMutableArray*)self.numberList) addObject:number];
    [self save];
}

- (void)deleNumberGrounp:(LTLotteryPlaySelectNumGroupMod *)number{
    [((NSMutableArray*)self.numberList) removeObject:number];
    [self save];
}

- (void)save{
    [NSKeyedArchiver archiveRootObject:_numberList toFile:filePath];
}


@end
