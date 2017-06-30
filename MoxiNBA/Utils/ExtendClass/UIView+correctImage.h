//
//  UIView+correctImage.h
//  CrazyAd
//
//  Created by BM on 13-8-7.
//  Copyright (c) 2013年 bluemobi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (correctImage)
- (void)correctImageNamed:(NSString*)imagename withBar:(BOOL)hasbar;

- (void)setStartPoint:(CGPoint)p;
@end
