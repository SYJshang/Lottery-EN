//
//  LTBallView.h
//  Lottery
//
//  Created by apple on 2017/6/28.
//  Copyright © 2017年 Wen YanFei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LTBallView : UIView
@property(nonatomic,strong)UIColor *color;
@property(nonatomic,copy)NSString *text;
@property(nonatomic,strong)UIFont *font;
@property(nonatomic,assign)BOOL unselect;
@end
