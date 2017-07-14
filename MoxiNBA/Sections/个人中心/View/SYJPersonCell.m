//
//  SYJPersonCell.m
//  MoxiNBA
//
//  Created by 尚勇杰 on 2017/7/13.
//  Copyright © 2017年 尚勇杰. All rights reserved.
//

#import "SYJPersonCell.h"

@implementation SYJPersonCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.bigImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bgImg"]];
        [self.contentView addSubview:self.bigImg];
        self.bigImg.sd_layout.leftSpaceToView(self.contentView, 0).rightSpaceToView(self.contentView, 0).topSpaceToView(self.contentView, 0).bottomSpaceToView(self.contentView, 0);
        self.bigImg.alpha = 0.8;
        
        self.imgHeader = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"头像"]];
        [self.bigImg addSubview:self.imgHeader];
        self.imgHeader.sd_layout.centerXEqualToView(self.bigImg).centerYEqualToView(self.bigImg).heightIs(80).widthIs(80);
        self.imgHeader.layer.masksToBounds = YES;
        self.imgHeader.layer.cornerRadius = 40;
        self.imgHeader.layer.borderWidth = 0.5;
        self.imgHeader.layer.borderColor = Gray.CGColor;
        
        self.nameLab = [[UILabel alloc]init];
        [self.bigImg addSubview:self.nameLab];
        self.nameLab.font = [UIFont systemFontOfSize:17];
        self.nameLab.textColor = [UIColor blackColor];
        self.nameLab.textAlignment = NSTextAlignmentCenter;
        self.nameLab.sd_layout.leftSpaceToView(self.bigImg, 10).rightSpaceToView(self.bigImg, 10).topSpaceToView(self.imgHeader, 5).heightIs(20);
        
        self.sorceBtn = [[UILabel alloc]init];
        [self.bigImg addSubview:self.sorceBtn];
        self.sorceBtn.textColor = [UIColor whiteColor];
         self.sorceBtn.backgroundColor = [UIColor orangeColor];
        self.sorceBtn.textAlignment = NSTextAlignmentCenter;
        self.sorceBtn.sd_layout.rightSpaceToView(self.bigImg, -5).centerYEqualToView(self.bigImg).heightIs(40).widthIs(100);
        self.sorceBtn.layer.masksToBounds = YES;
        self.sorceBtn.layer.cornerRadius = 3;
        
    }
    
    
    return self;
    
}

@end
