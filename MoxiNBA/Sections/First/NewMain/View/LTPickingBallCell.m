//
//  LTPickingBallCell.m
//  Lottery
//
//  Created by Wen YanFei on 2017/6/29.
//  Copyright © 2017年 Wen YanFei. All rights reserved.
//

#import "LTPickingBallCell.h"
#import "LTLotteryPlayNumMod.h"
#import "LTBallView.h"
#import <Masonry.h>
#import "LTLotteryPlaySelectNumMode.h"

@interface LTPickingBallCell ()

@property(nonatomic, weak)UILabel* titleV;
@property(nonatomic, weak)UIView* ballBGV;
@property(nonatomic, weak)UIView* line;

@end

@implementation LTPickingBallCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setSelectionStyle:(UITableViewCellSelectionStyleNone)];
        self.backgroundColor = UIColor.clearColor;
    }
    return self;
}

- (void)setModel:(LTLotteryPlayNumMod *)model{
    if (_model == model) return;
    _model = model;
    
    self.titleV.text = model.title;
    CGFloat titlew = [model.title sizeWithAttributes:@{NSFontAttributeName:self.titleV.font}].width + 12;
    self.titleV.frame = CGRectMake(10, 6, titlew, 30);
    
    [self setupView];
}


- (UILabel *)titleV{
    if (!_titleV) {
        UILabel *titleV = [UILabel new];
        titleV.textColor = [UIColor colorWithWhite:0.1 alpha:1];
        titleV.font = [UIFont systemFontOfSize:12];
        titleV.backgroundColor = [UIColor colorWithWhite:0 alpha:0.1];
        titleV.layer.cornerRadius = 15;
        titleV.clipsToBounds = YES;
        titleV.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:titleV];
        _titleV = titleV;
        
//        [titleV mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.left.offset(6);
//            make.height.mas_equalTo(30);
//        }];
    }
    return _titleV;
}

- (UIView *)ballBGV{
    if (!_ballBGV) {
        UIView *ballBG = [UIView new];
        [self.contentView addSubview:ballBG];
        _ballBGV = ballBG;
        
//        [ballBG mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self.titleV.mas_right);
//            make.top.right.offset(0);
//            make.height.greaterThanOrEqualTo(@10);
//        }];
    }
    return _ballBGV;
}

- (UIView *)line{
    if (!_line) {
        UIView *line = [UIView new];
        line.backgroundColor = [UIColor colorWithWhite:0 alpha:0.15];
        [self.contentView addSubview:line];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(self.contentView.mas_width).offset(-20);
            make.height.mas_equalTo(0.5);
            make.centerX.equalTo(self.contentView).offset(0);
            make.bottom.mas_equalTo(0);
        }];
        _line = line;
    }
    return _line;
}

- (void)layoutSublayersOfLayer:(CALayer *)layer{
    [super layoutSublayersOfLayer:layer];
    [self setupBallFrame];
}

- (void)setupView{
    NSArray *ballContent = self.model.memberArr;
    
    
    [self.ballBGV.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    for (int i = 0; i < ballContent.count; i ++) {
        LTBallView *ball = [[LTBallView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
        ball.unselect = YES;
        ball.text = ballContent[i];
        ball.color = UIColorFromRGB(self.model.bgColor);
        [ball addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectBall:)]];
        ball.userInteractionEnabled = YES;
        [self.ballBGV addSubview:ball];
        ball.tag = 100 + i;
    }
    
    [self line];
    [self setupBallFrame];
}

- (void)setupBallFrame{
    
    CGFloat ballBGX = CGRectGetMaxX(self.titleV.frame) + 6;
    CGFloat bgW = kScreenWidth - ballBGX - 10;
    CGFloat minMargin = 6;
    CGFloat MaxMargin = 50;
    CGFloat wh = 25;
    NSInteger cols = bgW / (wh + minMargin);
    if (cols <= 0) {
        return;
    }
    CGFloat margin = (bgW - cols * wh)/ (cols - 1);
    if (margin > MaxMargin) {
        margin = MaxMargin;
    }
    NSInteger col,row = 0;
    for (int i = 0; i < self.ballBGV.subviews.count; i ++) {
        LTBallView *ball = [_ballBGV viewWithTag:100 + i];
        col = i % cols;
        row = i / cols;
        ball.frame = CGRectMake( col * (margin + wh), 6 + row * (wh + 6), wh, wh);
    }
    CGFloat ballBGVHeight = 6 + (row +1)* (wh + 6);
    self.height = ballBGVHeight;
    self.model.cellHeight = self.height;
    self.ballBGV.frame = CGRectMake(ballBGX, 0, bgW, ballBGVHeight);
}



+ (CGFloat)getHeight{
    return 200;
}

- (void)setSelectNum:(LTLotteryPlaySelectNumMode *)selectNum{
    _selectNum = selectNum;
    [self setupBallsState];
}

- (void)setupBallsState{
    for (int i = 0; i < self.ballBGV.subviews.count; i ++) {
        LTBallView *ball = [_ballBGV viewWithTag:100 + i];
        ball.unselect = YES;
    }
    
    for (int i = 0; i < self.selectNum.selectIndexs.count; i ++) {
        LTBallView *ball = [_ballBGV viewWithTag:100 + [self.selectNum.selectIndexs[i] integerValue]];
        ball.unselect = NO;
    }
}

- (void)selectBall:(UITapGestureRecognizer*)gesture{
    LTBallView *ball = gesture.view;
    ball.unselect = !ball.unselect;
    
    
    NSMutableArray *selectMArr = [NSMutableArray array];
    for (int i = 0; i < self.model.memberArr.count; i ++) {
        LTBallView *ball = [self.ballBGV viewWithTag:100+i];
        if (!ball.unselect) {
            [selectMArr addObject:@(i)];
        }
    }
    
    self.selectNum.selectIndexs = [selectMArr copy];
}


@end
