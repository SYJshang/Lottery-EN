//
//  SYJLotSelectCell.m
//  MoxiNBA
//
//  Created by 尚勇杰 on 2017/7/11.
//  Copyright © 2017年 尚勇杰. All rights reserved.
//

#import "SYJLotSelectCell.h"

@implementation SYJLotSelectCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.img = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"图片占位or加载"]];
        [self.contentView addSubview:self.img];
        self.img.sd_layout.leftSpaceToView(self.contentView, 15).topSpaceToView(self.contentView, 15).rightSpaceToView(self.contentView, 15).heightIs((kWidth / 3) - 50);
        self.img.contentMode = UIViewContentModeScaleAspectFill;
        
        self.lotteryName = [[UILabel alloc]init];
        [self.contentView addSubview:self.lotteryName];
        self.lotteryName.textAlignment = NSTextAlignmentCenter;
        self.lotteryName.font = [UIFont systemFontOfSize:15];
        self.lotteryName.textColor = [UIColor blackColor];
        self.lotteryName.sd_layout.leftSpaceToView(self.contentView, 5).rightSpaceToView(self.contentView, 5).heightIs(20).topSpaceToView(self.img, - 6);
        
        self.isNoLottery = [[UILabel alloc]init];
        [self.contentView addSubview:self.isNoLottery];
        self.isNoLottery.textAlignment = NSTextAlignmentCenter;
        self.isNoLottery.font = [UIFont boldSystemFontOfSize:8];
        self.isNoLottery.textColor = [UIColor lightGrayColor];
//        self.isNoLottery.backgroundColor = [UIColor redColor];
        self.isNoLottery.numberOfLines = 2;
        self.isNoLottery.sd_layout.leftSpaceToView(self.contentView,5).topSpaceToView(self.lotteryName,0).heightIs(20).rightSpaceToView(self.contentView, 5);
        
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 0.5;
        self.layer.borderColor = Gray.CGColor;
        self.layer.borderWidth = 0.5;
        
    }
    
    return self;
    
}

@end
