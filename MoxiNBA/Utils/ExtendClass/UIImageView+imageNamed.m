//
//  UIImageView+imageNamed.m
//  CrazyAd
//
//  Created by BM on 13-8-7.
//  Copyright (c) 2013年 bluemobi. All rights reserved.
//

#import "UIImageView+imageNamed.h"

@implementation UIImageView (imageNamed)
- (void)setImageNamed:(NSString *)imageName{
    UIImage *image = [UIImage imageNamed:imageName];
    [self setImage:image];
    [self setFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
}
@end
