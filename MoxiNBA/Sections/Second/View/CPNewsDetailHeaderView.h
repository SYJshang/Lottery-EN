//
//  CPNewsDetailHeaderView.h
//  inrtest
//
//  Created by 张涛 on 2017/5/10.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ITNewsModel.h"

@protocol CPNewsDetailContentHeightDelegate <NSObject>

- (void)updateViewSize: (CGFloat)height;

@end


@interface CPNewsDetailHeaderView : UIView

- (instancetype)initWithFrame:(CGRect)frame;

@property (nonatomic, weak) id<CPNewsDetailContentHeightDelegate> delegate;

@property (nonatomic, strong) ITNewsModel *model;

@end
