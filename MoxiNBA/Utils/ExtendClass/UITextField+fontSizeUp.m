//
//  UITextField+fontSizeUp.m
//  WenZhouABC
//
//  Created by BM on 13-8-20.
//  Copyright (c) 2013年 bluemobi. All rights reserved.
//

#import "UITextField+fontSizeUp.h"

@implementation UITextField (fontSizeUp)
- (void)fontSizeUp:(float)upsize{
    UIFont *f = [UIFont fontWithName:self.font.fontName size:self.font.pointSize+upsize];
    [self setFont:f];
}

- (void)fontSizeDown:(float)downsize{
    UIFont *f = [UIFont fontWithName:self.font.fontName size:self.font.pointSize-downsize];
    [self setFont:f];
}
@end
