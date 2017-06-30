//
//  UIButton+buttonImageNamed.m
//  CrazyAd
//
//  Created by BM on 13-8-7.
//  Copyright (c) 2013年 bluemobi. All rights reserved.
//

#import "UIButton+buttonImageNamed.h"

@implementation UIButton (buttonImageNamed)

+ (id)buttonImageNamed:(NSString*)name{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *image = [UIImage imageNamed:name];
    [button setImage:image forState:UIControlStateNormal];
    [button setFrame:CGRectMake(0,0, image.size.width,image.size.height)];
    
    return button;
}

@end
