//
//  LTPickingBallBottomBar.h
//  Lottery
//
//  Created by Wen YanFei on 2017/6/29.
//  Copyright © 2017年 Wen YanFei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LTPickingBallBottomBar : UIView

@property(nonatomic, assign)long long count;

@property(nonatomic, copy)void (^complete)();
@property(nonatomic, copy)void (^clear)();

@end
