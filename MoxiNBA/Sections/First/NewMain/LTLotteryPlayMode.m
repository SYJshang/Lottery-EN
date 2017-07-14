//
//  LTLotteryPlayMode.m
//  Lottery
//
//  Created by Wen YanFei on 2017/6/28.
//  Copyright © 2017年 Wen YanFei. All rights reserved.
//

#import "LTLotteryPlayMode.h"
#import "LTLotteryPlayNumMod.h"
#import "LTLotteryInfoMode.h"

@implementation LTLotteryPlayMode

+ (NSDictionary *)mj_objectClassInArray{
    return @{@"set":[LTLotteryPlayNumMod class],
             @"grounp":[LTLotteryPlayMode class]};
}

-(void)setType:(NSString *)type{
    _type = type;
    self.isGronp = ![type isEqualToString:@"play"];
}

- (void)setGrounp:(NSArray<LTLotteryPlayMode *> *)grounp{
    _grounp = grounp;
    
    for (LTLotteryPlayMode* md in grounp) {
        md.parentGrounp = self;
    }
}

- (NSArray *)playNameArr{
    NSMutableArray *mArr = [NSMutableArray array];
    [self addPlayNameArr:mArr whithModel:self];
    return mArr;
}

- (void)addPlayNameArr:(NSMutableArray*)marr whithModel:(LTLotteryPlayMode*) playModel{
    [marr insertObject:playModel.name atIndex:0];
    if (playModel.parentGrounp != nil) {
        [self addPlayNameArr:marr whithModel:playModel.parentGrounp];
    }
}

- (NSString *)fullName{
    if (!_fullName) {
        NSArray *nameArr = [self playNameArr];
        NSString* fullName = @"";
        if (nameArr.count>0&&!(self.lotteryInfo&&self.lotteryInfo.rule.count==1)) {
            for (int i = 0 ; i < nameArr.count ; i ++) {
                fullName = [fullName stringByAppendingFormat:@"%@ ",nameArr[i]];
            }
            _fullName = [fullName substringToIndex:fullName.length - 1];
        }else{
            fullName = @"";
        }
    }
    return _fullName;
}

@end
