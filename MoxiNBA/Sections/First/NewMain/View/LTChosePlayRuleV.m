//
//  LTChosePlayRuleV.m
//  Lottery
//
//  Created by Wen YanFei on 2017/6/28.
//  Copyright © 2017年 Wen YanFei. All rights reserved.
//

#import "LTChosePlayRuleV.h"
#import "LTLotteryPlayMode.h"
#import "LTLotteryInfoMode.h"

@interface LTChosePlayRuleV ()


@end


@implementation LTChosePlayRuleV

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    }
    return self;
}

- (void)setLotteryInfo:(LTLotteryInfoMode *)lotteryInfo{
    _lotteryInfo = lotteryInfo;
    
    NSMutableArray* mArr = [NSMutableArray array];
    
    [self playArrWithFromArray:lotteryInfo.rule toMArr:mArr];
    
    _playList = [mArr copy];
    
    _play = _playList[0];
    self.playChange(self);
    
    [self setupView];
}

- (void)playArrWithFromArray:(NSArray*)array toMArr:(NSMutableArray *)mArr{
    
    for ( int i =  0; i< array.count; i ++) {
        LTLotteryPlayMode *model = array[i];
        if (model.isGronp) {
            [self playArrWithFromArray:model.grounp toMArr:mArr];
        }else{
            [mArr addObject:model];
        }
    }
}

- (void)setupView{
    
    int cols = 3;
    int row, col;
    
    CGFloat margin = 8;
    CGFloat w = ( kScreenWidth - 12 - 2 * margin ) / 3;
    CGFloat h = w * 0.3;
    for (int i = 0; i < self.playList.count; i ++) {
        col = i % cols;
        row = i / cols;
        
        NSString *text = self.playList[i].fullName;
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(6 +  col * (w + margin), row * (h + margin) + margin/2, w, h)];
        btn.layer.cornerRadius = 6;
        btn.layer.borderWidth = 0.5;
        btn.layer.borderColor = App_MainColor.CGColor;
        btn.backgroundColor = [UIColor whiteColor];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:(UIControlEventTouchUpInside)];
        [btn setTitle:text forState:(UIControlStateNormal)];
        [btn setTitleColor:App_MainColor forState:UIControlStateNormal];
        [btn.titleLabel setAdjustsFontSizeToFitWidth:YES];
        btn.tag = 100+ i;
        [self addSubview:btn];
    }
}

- (void)btnClick:(UIButton*)btn{
    NSInteger index = btn.tag - 100;
    if (index >= 0) {
        _play = _playList[index];
        self.playChange(self);
    }
}

@end
