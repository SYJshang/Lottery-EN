
//
//  SYJLotteryCollectionCell.m
//  LotterySecond
//
//  Created by 尚勇杰 on 2017/6/6.
//  Copyright © 2017年 尚勇杰. All rights reserved.
//

#import "SYJLotteryCollectionCell.h"

@implementation SYJLotteryCollectionCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor clearColor];

        
        self.img = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"图片占位or加载"]];
        [self.contentView addSubview:self.img];
        self.img.sd_layout.leftSpaceToView(self.contentView, 18).topSpaceToView(self.contentView, 18).rightSpaceToView(self.contentView, 18).bottomSpaceToView(self.contentView, 38);
        self.img.contentMode = UIViewContentModeScaleAspectFill;
        
        self.lotteryName = [[UILabel alloc]init];
        [self.contentView addSubview:self.lotteryName];
        self.lotteryName.textAlignment = NSTextAlignmentCenter;
        self.lotteryName.font = [UIFont boldSystemFontOfSize:16.0];
        self.lotteryName.textColor = [UIColor blackColor];
        self.lotteryName.sd_layout.leftSpaceToView(self.contentView, 5).rightSpaceToView(self.contentView, 5).heightIs(20).bottomSpaceToView(self.contentView,5);
        
              
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 3.0;
        self.layer.borderColor = Gray.CGColor;
        self.layer.borderWidth = 0.5;
        
    }
    
    return self;
    
}

@end
