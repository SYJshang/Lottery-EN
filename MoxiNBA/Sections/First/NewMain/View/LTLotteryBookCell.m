//
//  LTLotteryBookCell.m
//  Lottery
//
//  Created by Wen YanFei on 2017/6/29.
//  Copyright © 2017年 Wen YanFei. All rights reserved.
//

#import "LTLotteryBookCell.h"
#import "LTLotteryBookCellBallView.h"
#import "LTLotteryPlaySelectNumGroupMod.h"
#import "LTLotteryInfoMode.h"
#import "LTLotteryPlayMode.h"

@interface LTLotteryBookCell ()

@property(nonatomic, weak)UILabel *lbTitle;
@property(nonatomic, weak)UILabel *lbTypeName;
@property(nonatomic, weak)UILabel *lbTime;
@property(nonatomic, weak)UILabel *lbCountAndMoney;
@property(nonatomic, weak)LTLotteryBookCellBallView *ballsV;

@end

@implementation LTLotteryBookCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupView];
    }
    return self;
}

- (void)setupView{
    [self setSelectionStyle:(UITableViewCellSelectionStyleNone)];
    UILabel* lbTitle = [UILabel new];
    lbTitle.textColor = [UIColor colorWithWhite:0.1 alpha:1];
    lbTitle.font = [UIFont systemFontOfSize:16];
    [self.contentView addSubview:lbTitle];
    _lbTitle = lbTitle;
    
    UILabel* lbTypeName = [UILabel new];
    lbTypeName.textColor = [UIColor colorWithWhite:0.3 alpha:1];
    lbTypeName.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:lbTypeName];
    _lbTypeName = lbTypeName;
    
    UILabel* lbTime = [UILabel new];
    lbTime.textColor = [UIColor colorWithWhite:0.4 alpha:1];
    lbTime.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:lbTime];
    _lbTime = lbTime;
    
    UILabel* lbCountAndMoney = [UILabel new];
    lbCountAndMoney.textColor = [UIColor colorWithWhite:0.4 alpha:1];
    lbCountAndMoney.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:lbCountAndMoney];
    _lbCountAndMoney = lbCountAndMoney;
    
    LTLotteryBookCellBallView* ballsV = [[LTLotteryBookCellBallView alloc]initWithFrame:CGRectMake(0, 30, kScreenWidth, 50)];
    [self.contentView addSubview:ballsV];
    _ballsV = ballsV;
    

    [lbTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(6);
    }];
    [lbTypeName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lbTitle.mas_right).offset(3);
        make.bottom.equalTo(lbTitle);
    }];
    [lbCountAndMoney mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-10);
        make.bottom.equalTo(lbTitle);
    }];
    
    [lbTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ballsV.mas_bottom).offset(6);
        make.right.offset(-10);
    }];
    
    UIView *line = [UIView new];
    line.backgroundColor = [UIColor colorWithWhite:0 alpha:0.15];
    [self.contentView addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.contentView.mas_width);
        make.height.mas_equalTo(0.5);
        make.centerX.equalTo(self.contentView).offset(0);
        make.bottom.mas_equalTo(0);
    }];
}


- (void)setModel:(LTLotteryPlaySelectNumGroupMod *)model{
    _model = model;
    self.lbTitle.text = model.lotteryInfo.title;
    self.lbTypeName.text = model.play.fullName;
    long long count = model.getCount;
    self.lbCountAndMoney.text = [NSString stringWithFormat:@"共%lld注",count];
    self.lbTime.text = model.dateStr;
    self.ballsV.number = model.selectNums;
    
    model.cellHeight = CGRectGetMaxY(self.ballsV.frame) + 32;
}


@end
