//
//  LTLotteryInfoMode.m
//  Lottery
//
//  Created by Wen YanFei on 2017/6/28.
//  Copyright © 2017年 Wen YanFei. All rights reserved.
//

#import "LTLotteryInfoMode.h"
#import "LTLotteryPlayMode.h"

@implementation LTLotteryInfoMode
//
//+ (instancetype)lotteryInfoWithShortKey:(NSString *)shortKey Title:(NSString *)title subTitle:(NSString *)subTitle iconName:(NSString *)iconName blueNumber:(NSInteger)blueNumber{
//    LTLotteryInfoMode *model = [LTLotteryInfoMode new];
//    [model updateInfoWithShortKey:shortKey Title:title subTitle:subTitle iconName:iconName blueNumber:blueNumber];
//    return model;
//}
//
//- (instancetype)updateInfoWithShortKey:(NSString *)shortKey Title:(NSString *)title subTitle:(NSString *)subTitle iconName:(NSString *)iconName blueNumber:(NSInteger)blueNumber{
//    self.shortKey = shortKey;
//    self.title = title;
//    self.subTitle = title;
//    self.iconName = title;
//    self.blueNumber = blueNumber;
//    return self;
//}

+(NSDictionary *)mj_objectClassInArray{
    return @{@"rule":[LTLotteryPlayMode class]};
}

- (void)setRule:(NSArray<LTLotteryPlayMode *> *)rule{
    _rule = rule;
    [_rule enumerateObjectsUsingBlock:^(LTLotteryPlayMode * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.lotteryInfo = self;
    }];
}

- (LTLotteryPlayMode *)playWithArray:(NSArray *)arr{
    LTLotteryPlayMode *mode;
    NSArray<LTLotteryPlayMode*>*set = self.rule;
    for (int i = 0 ; i<arr.count ; i ++) {
        for (int j = 0; j < set.count; j ++) {
            if ([set[j].name isEqual:arr[i]]) {
                mode = set[j];
                set = mode.grounp;
            }
        }
    }
    return mode;
}

@end
