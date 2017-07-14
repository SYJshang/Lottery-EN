//
//  UILabel+fontSizeUp.m
//  WenZhouABC
//
//  Created by BM on 13-8-20.
//  Copyright (c) 2013年 bluemobi. All rights reserved.
//

#import "UILabel+fontSizeUp.h"

@implementation UILabel (fontSizeUp)
- (void)fontSizeUp:(float)upsize{
    UIFont *f = [UIFont fontWithName:self.font.fontName size:self.font.pointSize+upsize];
    [self setFont:f];
}

- (void)fontSizeDown:(float)downsize{
    UIFont *f = [UIFont fontWithName:self.font.fontName size:self.font.pointSize-downsize];
    [self setFont:f];
}

- (CGSize)boundingRectWithSize:(CGSize)size
{
    NSDictionary *attribute = @{NSFontAttributeName: self.font};
    
    CGSize retSize = [self.text boundingRectWithSize:size
                                             options:\
                      NSStringDrawingTruncatesLastVisibleLine |
                      NSStringDrawingUsesLineFragmentOrigin |
                      NSStringDrawingUsesFontLeading
                                          attributes:attribute
                                             context:nil].size;
    
    return retSize;
}

@end
