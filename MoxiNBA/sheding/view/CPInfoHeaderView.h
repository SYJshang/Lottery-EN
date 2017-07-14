//
//  CPInfoHeaderView.h
//  彩票2
//
//  Created by 张涛 on 2017/4/14.
//  Copyright © 2017年 1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CPUserInfoModel.h"

@interface CPInfoHeaderView : UIView
    
- (instancetype)initWithHeader:(CGRect)frame;
- (void)layoutHeaderViewForScrollViewOffset:(CGPoint)offset;

@property (nonatomic, strong) CPUserInfoModel *model;

@end
