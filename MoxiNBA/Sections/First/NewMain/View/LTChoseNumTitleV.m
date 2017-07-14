//
//  LTChoseNumTitleV.m
//  Lottery
//
//  Created by Wen YanFei on 2017/6/29.
//  Copyright © 2017年 Wen YanFei. All rights reserved.
//

#import "LTChoseNumTitleV.h"
#import <Masonry.h>

@interface LTChoseNumTitleV ()

@property(nonatomic, weak) CALayer *arr;
@property(nonatomic, weak) UIView *arrV;

@end

@implementation LTChoseNumTitleV

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIView *arrV = [UIView new];
        [self addSubview:arrV];
        _arrV = arrV;
        [self arr];
        [arrV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.height.equalTo(self.mas_height).multipliedBy(0.5);
            make.centerY.offset(5);
            make.left.equalTo(self.titleLabel.mas_right).offset(0);
        }];
        [self.titleLabel setAdjustsFontSizeToFitWidth:YES];
    }
    return self;
}

- (void)setSelected:(BOOL)selected{
    [super setSelected:selected];
    if (selected) {
        self.arr.transform = CATransform3DMakeRotation(-M_PI, 0, 0, 1);
    }else{
        self.arr.transform = CATransform3DIdentity;
    }
}

- (void)layoutSublayersOfLayer:(CALayer *)layer{
    [super layoutSublayersOfLayer:layer];
    _arr.position = CGPointMake(_arrV.bounds.size.width/2, _arrV.bounds.size.height/2);
}

- (CALayer *)arr{
    if (!_arr) {
        CAShapeLayer *sLayer = [CAShapeLayer new];
        sLayer.anchorPoint = CGPointMake(0.5, 0.5);
        sLayer.bounds = CGRectMake(0, 0, 6, 6);
        [self.arrV.layer addSublayer:sLayer];
        sLayer.position = _arrV.center;
        self.arr = sLayer;
        
        UIBezierPath *bPath = [UIBezierPath bezierPath];
        [bPath moveToPoint:CGPointZero];
        [bPath addLineToPoint:CGPointMake(6, 0)];
        [bPath addLineToPoint:CGPointMake(3, 6)];
        [bPath closePath];
        
        sLayer.path = bPath.CGPath;
        [sLayer setFillColor:[UIColor grayColor].CGColor];
    }
    return _arr;
}
@end
