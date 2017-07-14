//
//  LTPickingBallBottomBar.m
//  Lottery
//
//  Created by Wen YanFei on 2017/6/29.
//  Copyright © 2017年 Wen YanFei. All rights reserved.
//

#import "LTPickingBallBottomBar.h"
#import <Masonry.h>

@interface LTPickingBallBottomBar ()
@property(nonatomic, weak)UILabel *lbCount;
@property(nonatomic, weak)UILabel *lbMoney;
@end

@implementation LTPickingBallBottomBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
        self.count = 0;
    }
    return self;
}

- (void)setupView{
    self.backgroundColor = [UIColor brownColor];
    
    UIButton *delectBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, 4.5, 40, 40)];
    [delectBtn setImage:[UIImage imageNamed:@"delete"] forState:UIControlStateNormal];
    [delectBtn addTarget:self action:@selector(clickClear) forControlEvents:(UIControlEventTouchUpInside)];
    [delectBtn setTitle:@"清空" forState:UIControlStateNormal];
    delectBtn.titleLabel.font = [UIFont systemFontOfSize:13.0];
    [self addSubview:delectBtn];
    delectBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;//使图片和文字水平居中显示
    [delectBtn setTitleEdgeInsets:UIEdgeInsetsMake(delectBtn.imageView.frame.size.height + 12 ,-delectBtn.imageView.frame.size.width - 10, 0.0,0.0)];//文字距离上边框的距离增加imageView的高度，距离左边框减少imageView的宽度，距离下边框和右边框距离不变
    [delectBtn setImageEdgeInsets:UIEdgeInsetsMake(-8.0, 0.0,0.0, -delectBtn.titleLabel.bounds.size.width)];//图片距离右边框距离减少图片的宽度，其它不边
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(delectBtn.frame), 3, 0.5, 43)];
    line.backgroundColor = [UIColor colorWithWhite:1 alpha:0.1];
    [self addSubview:line];
    
    UILabel* lbCount = [UILabel new];
    lbCount.textColor = UIColor.whiteColor;
    lbCount.font = [UIFont systemFontOfSize:18];
    [self addSubview:lbCount];
    _lbCount = lbCount;
    
    UILabel* lbMoney = [UILabel new];
    lbMoney.textColor = UIColor.yellowColor;
    lbMoney.font = [UIFont systemFontOfSize:18];
    [self addSubview:lbMoney];
    _lbMoney = lbMoney;
    
    [lbCount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(line.mas_right).offset(6);
        make.top.equalTo(self.mas_top);
        make.bottom.equalTo(self.mas_bottom);
    }];
    [lbMoney mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lbCount.mas_right).offset(6);
        make.top.equalTo(self.mas_top);
        make.bottom.equalTo(self.mas_bottom);
    }];
    
    UIButton *completeBtn = [[UIButton alloc] initWithFrame:CGRectMake(KSceenW - 50, 4.5, 40, 40)];
    [completeBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    [completeBtn setImage:[UIImage imageNamed:@"投注"] forState:UIControlStateNormal];
    [completeBtn addTarget:self action:@selector(clickComplete) forControlEvents:(UIControlEventTouchUpInside)];
    completeBtn.titleLabel.font = [UIFont systemFontOfSize:13.0];
    [completeBtn setTitle:@"去投注" forState:(UIControlStateNormal)];
    [self addSubview:completeBtn];
    completeBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;//使图片和文字水平居中显示
    [completeBtn setTitleEdgeInsets:UIEdgeInsetsMake(completeBtn.imageView.frame.size.height + 12 ,-completeBtn.imageView.frame.size.width, 0.0,0.0)];//文字距离上边框的距离增加imageView的高度，距离左边框减少imageView的宽度，距离下边框和右边框距离不变
    [completeBtn setImageEdgeInsets:UIEdgeInsetsMake(-8.0, 0.0,0.0, -completeBtn.titleLabel.bounds.size.width)];//图片距离右边框距离减少图片的宽度，其它不边
}
- (void)clickComplete{
    if (self.complete) {
        self.complete();
    }
}

- (void)clickClear{
    if (self.clear) {
        self.clear();
    }
}

- (void)setCount:(long long)count{
    _count = count;
    _lbCount.text = [NSString stringWithFormat:@"%lld注",count];
    _lbMoney.text = [NSString stringWithFormat:@"参考价格%lld元",count * 2];
}

@end
