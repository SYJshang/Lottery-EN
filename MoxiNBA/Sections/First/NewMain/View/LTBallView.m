//
//  LTBallView.m
//  Lottery
//
//  Created by apple on 2017/6/28.
//  Copyright © 2017年 Wen YanFei. All rights reserved.
//

#import "LTBallView.h"

@implementation LTBallView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
//    CGContextRef *context = UIGraphicsGetCurrentContext();
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:rect.size.width/2.];
    [path addClip];
    UIColor *textColor = self.color;
    if (self.unselect) {
        [[UIColor whiteColor] setFill];
        [path fill];
        
        [self.color set];
        path.lineWidth = 0.5;
        [path stroke];
    }else{
        [self.color set];
        [path fill];
        textColor = UIColor.whiteColor;
    }
    
    NSDictionary *attributes = @{NSFontAttributeName:self.font, NSForegroundColorAttributeName:textColor};
    CGSize size =[self.text sizeWithAttributes:attributes];
    [self.text drawInRect:CGRectOffset(rect, (rect.size.width - size.width)/2., (rect.size.height - size.height)/2.) withAttributes:attributes];
}

- (void)setUnselect:(BOOL )unselect{
    _unselect = unselect;
    [self setNeedsDisplay];
}

- (UIColor *)color{
    if (!_color) {
        _color = [UIColor redColor];
    }
    return _color;
}

- (NSString *)text{
    if (!_text) {
        _text = @"??";
    }
    return _text;
}

- (UIFont *)font{
    if (!_font) {
        _font = [UIFont systemFontOfSize:UIFont.systemFontSize];
    }
    return _font;
}

@end
