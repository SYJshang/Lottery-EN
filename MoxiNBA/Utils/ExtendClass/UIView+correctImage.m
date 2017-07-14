//
//  UIView+correctImage.m
//  CrazyAd
//
//  Created by BM on 13-8-7.
//  Copyright (c) 2013年 bluemobi. All rights reserved.
//

#import "UIView+correctImage.h"

@implementation UIView (correctImage)
- (void)correctImageNamed:(NSString*)imagename withBar:(BOOL)hasbar{
    UIImageView *imageView = [[UIImageView alloc]init];
    [imageView setImageNamed:imagename];
    CGRect rect = CGRectZero;
    rect.size = self.frame.size;

    if (self.frame.size.width>self.frame.size.height) {
        rect.size = CGSizeMake(rect.size.height, rect.size.width);
    }
    if (hasbar){
        
    }else{
        rect.size.height+=20;
    }
    [imageView setFrame:rect];
    NSLog(@"%f %f %f %f",rect.origin.x,rect.origin.y-20,rect.size.width,rect.size.height);
    [self addSubview:imageView];
    [imageView setAlpha:0.6];
}

- (void)setStartPoint:(CGPoint)p{ 
    [self setFrame:CGRectMake(p.x, p.y, self.frame.size.width, self.frame.size.height)];
}

@end
