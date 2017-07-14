//
//  UILabel+fontSizeUp.h
//  WenZhouABC
//
//  Created by BM on 13-8-20.
//  Copyright (c) 2013年 bluemobi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (fontSizeUp)

- (void)fontSizeUp:(float)upsize;
- (void)fontSizeDown:(float)downsize;
- (CGSize)boundingRectWithSize:(CGSize)size;
@end
