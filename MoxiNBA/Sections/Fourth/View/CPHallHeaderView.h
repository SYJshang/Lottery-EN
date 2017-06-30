//
//  CPHallHeaderView.h
//  彩票2
//
//  Created by 张涛 on 2017/4/14.
//  Copyright © 2017年 1. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CPHallHeaderViewDelegate <NSObject>

@optional
- (void)didButtonItemClick:(UIButton *)button;

- (void)didSelectItem: (NSInteger)index;

@end

@interface CPHallHeaderView : UIView

@property (nonatomic, copy) NSArray *imageURLStringsGroup;
@property (nonatomic, weak) id<CPHallHeaderViewDelegate> delegate;

@end
