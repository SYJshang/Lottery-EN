//
//  ITTieZiHeaderView.h
//  inrtest
//
//  Created by 张涛 on 2017/5/12.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ITTieZiModel.h"

@protocol ITTieZiHeaderViewSetHeightDelegate <NSObject>

@optional

- (void)setContentHeight: (CGFloat)contenHeight;

@end

@interface ITTieZiHeaderView : UIView

- (instancetype)initWithFrame:(CGRect)frame;

@property (nonatomic, weak) id<ITTieZiHeaderViewSetHeightDelegate> delegate;

@property (nonatomic, strong) ITTieZiModel *model;

@property (nonatomic, strong) NSString *imgPath;

@end
