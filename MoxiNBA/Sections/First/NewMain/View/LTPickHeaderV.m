//
//  LTPickHeaderV.m
//  Lottery
//
//  Created by Wen YanFei on 2017/6/30.
//  Copyright © 2017年 Wen YanFei. All rights reserved.
//

#import "LTPickHeaderV.h"

@implementation LTPickHeaderV

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup{
    UIImageView *imgV = [UIImageView new];
    imgV.image = [UIImage imageNamed:@"摇一摇"];
    [self addSubview:imgV];
    
    UILabel *titleV = [UILabel new];
    titleV.font = [UIFont systemFontOfSize:13];
    titleV.textColor = UIColorFromRGB(0xbfbfbf);
    titleV.text = @"摇一摇随机选号";
    [self addSubview:titleV];
    
    [titleV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.centerY.offset(0).offset(8);
    }];
    [imgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(titleV);
        make.right.equalTo(titleV.mas_left);
        make.width.equalTo(imgV.mas_height);
    }];
}

@end
