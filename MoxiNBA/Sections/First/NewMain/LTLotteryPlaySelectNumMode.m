//
//  LTLotteryPlaySelectNumMode.m
//  Lottery
//
//  Created by Wen YanFei on 2017/6/29.
//  Copyright © 2017年 Wen YanFei. All rights reserved.
//

#import "LTLotteryPlaySelectNumMode.h"
#import "LTLotteryPlayNumMod.h"

@implementation LTLotteryPlaySelectNumMode

- (long long)count{
    
    if (self.selectIndexs.count<self.model.minNum) {
        _count =  0;
    }else{
        _count = [self combinationFrom:self.selectIndexs.count select:self.model.minNum];
    }
    return _count;
}

- (long long)combinationFrom:(long long)from select:(long long)select{
    return  [self factorial:from] / ([self factorial:(from - select)]* [self factorial:select]);
}

- (long long)factorial:(long)num{
    if (num <= 1) {
        return 1;
    }else{
        return num*[self factorial:num - 1];
    }
}

- (void)setSelectIndexs:(NSArray<NSNumber *> *)selectIndexs{
    _selectIndexs = selectIndexs;
    if (self.chaned) {
        self.chaned();
    }
}

- (NSArray<NSString *> *)selectStr{
    if (!_selectStr) {
        
        NSMutableArray *marr = [NSMutableArray arrayWithCapacity:self.selectIndexs.count];
        
        for (NSNumber *indexObj in self.selectIndexs) {
            NSInteger index = [indexObj integerValue];
            [marr addObject:self.model.memberArr[index]];
        }
        _selectStr = [marr copy];
    }
    return _selectStr;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if(self = [super init]){
        self.selectIndexs = [aDecoder decodeObjectForKey:@"selectIndexs"];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.selectIndexs forKey:@"selectIndexs"];
}

- (id)copy{
    LTLotteryPlaySelectNumMode *model = [self.class new];
    model.model = self.model;
    model.selectIndexs = self.selectIndexs;
    return model;
}

@end
