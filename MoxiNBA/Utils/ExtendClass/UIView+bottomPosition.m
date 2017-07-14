//
//  UIView+bottomPosition.m
//  WenZhouABC
//
//  Created by BM on 13-8-15.
//  Copyright (c) 2013年 bluemobi. All rights reserved.
//

#import "UIView+bottomPosition.h"

@implementation UIView (bottomPosition)
- (float)bottomPosition{
    return self.frame.origin.y + self.frame.size.height;
}
- (float)rightPositon{
    return self.frame.origin.x + self.frame.size.width;
}
@end
