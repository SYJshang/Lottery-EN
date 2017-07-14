//
//  LTLotteryBookCellBallView.m
//  Lottery
//
//  Created by Wen YanFei on 2017/6/29.
//  Copyright © 2017年 Wen YanFei. All rights reserved.
//

#import "LTLotteryBookCellBallView.h"
#import "LTLotteryPlaySelectNumMode.h"
#import "LTBallView.h"

@implementation LTLotteryBookCellBallView

- (void)setNumber:(NSArray<LTLotteryPlaySelectNumMode *> *)number{
    _number = number;
    [self setupView];
}

- (void)setupView{
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    NSInteger row = 0;
    CGFloat offsetX = 0;
    CGFloat widthM = 10;
    CGFloat width = self.bounds.size.width - widthM * 2;
    CGFloat ballWH = 30;
    CGFloat ballMargin = 6;
    CGFloat grounpMargin = 3;
    CGFloat grounpR = 6;
    
    NSArray<NSString*> *lessStr;
    NSArray<NSString*> *useStr;
    
    CGFloat bgX = 0;
    CGFloat bgY = 0;
    CGFloat bgW = 0;
    CGFloat bgH = 55;
    CGFloat bgM = 6;
    UIView *lastBG;
    for (LTLotteryPlaySelectNumMode *mode in self.number) {
        lessStr = mode.selectStr;
        while (lessStr.count>0) {
            CGFloat lessW = width - ( offsetX > 0 ? grounpMargin : 0) - offsetX;
            NSInteger num = lessW / (ballWH + ballMargin);
            num -= (lessW - num * (ballWH + ballMargin) > ballMargin)? 0:1;
            if (num==0) {
                row ++;
                offsetX = 0;
            }else{
                CGFloat ballAMargin = ballMargin;
                bgX = widthM + offsetX + ( offsetX > 0 ? grounpMargin:0);
                bgY = row * (bgH + bgM);
                if (lessStr.count >= num) {
                    useStr = [lessStr subarrayWithRange:NSMakeRange(0, num)];
                    lessStr = lessStr.count == num? @[]: [lessStr subarrayWithRange:NSMakeRange(num, lessStr.count - num)];
                    ballAMargin = (lessW - num * ballWH) / (num + 1);
                    bgW = lessW;
                    row ++;
                    offsetX = 0;
                }else{
                    useStr = lessStr;
                    num = lessStr.count;
                    lessStr = @[];
                    bgW = num*ballWH + (num+1)*ballMargin;
                    offsetX += grounpMargin*2 + bgW;
                }
                UIView *ballsBG = [[UIView alloc]initWithFrame:CGRectMake(bgX, bgY, bgW, bgH)];
                ballsBG.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
                ballsBG.layer.cornerRadius = grounpR;
                [self addSubview:ballsBG];
                
                UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, bgW, 20)];
                title.textColor = [UIColor colorWithWhite:0.6 alpha:1];
                title.text = mode.model.title;
                title.textAlignment = NSTextAlignmentCenter;
                title.font = [UIFont systemFontOfSize:12];
                title.adjustsFontSizeToFitWidth = YES;
                [ballsBG addSubview:title];
                
                for (int i = 0; i < useStr.count; i ++) {
                    LTBallView *ball = [[LTBallView alloc]initWithFrame:CGRectMake(ballAMargin + i * (ballAMargin + ballWH), 20, ballWH, ballWH)];
                    ball.text = useStr[i];
                    ball.color = UIColorFromRGB(mode.model.bgColor);
                    [ballsBG addSubview:ball];
                }
                
                
                lastBG = ballsBG;
            }
        }
    }
    self.frame = CGRectMake(0, self.frame.origin.y, kScreenWidth, CGRectGetMaxY(lastBG.frame));
}

@end
