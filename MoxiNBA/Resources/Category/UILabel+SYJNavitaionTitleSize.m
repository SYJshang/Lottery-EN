//
//  UILabel+SYJNavitaionTitleSize.m
//  MoXiDemo
//
//  Created by 尚勇杰 on 2017/5/26.
//  Copyright © 2017年 尚勇杰. All rights reserved.
//

#import "UILabel+SYJNavitaionTitleSize.h"

@implementation UILabel (SYJNavitaionTitleSize)

+ (UILabel *)titleWithColor:(UIColor *)color title:(NSString *)title font:(CGFloat)font{
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(KSceenW / 2 - 100,0, 200, 44)];
    //    titleLabel.backgroundColor = [UIColor grayColor];
    titleLabel.font = [UIFont fontWithName:@"Georgia-Italic" size:font];
    titleLabel.textColor = color;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = title;
    
    return titleLabel;
}


@end
