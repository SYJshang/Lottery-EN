//
//  CPLeftView.m
//  inrtest
//
//  Created by zt on 2017/6/13.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import "CPLeftView.h"

@implementation CPLeftView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.frame = frame;
        
        UIView *leftView = [[UIView alloc]initWithFrame:frame];
        leftView.backgroundColor = [UIColor whiteColor];
        leftView.layer.shadowColor = [UIColor blackColor].CGColor;
        leftView.layer.shadowOffset = CGSizeMake(1, 1);
        leftView.layer.shadowOpacity = 1;
        [self addSubview:leftView];
        
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
