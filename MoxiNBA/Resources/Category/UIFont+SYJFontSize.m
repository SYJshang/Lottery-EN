
//
//  UIFont+SYJFontSize.m
//  MoXiDemo
//
//  Created by 尚勇杰 on 2017/5/26.
//  Copyright © 2017年 尚勇杰. All rights reserved.
//

#import "UIFont+SYJFontSize.h"
#import <objc/runtime.h>

@implementation UIFont (SYJFontSize)

+ (void)load{
    
    Method currentClass = class_getClassMethod(self, @selector(systemFontOfSize:))
    ;
    Method changeClass = class_getClassMethod(self, @selector(fontSizeChange:))
    ;
    
    method_exchangeImplementations(changeClass, currentClass);
    
    
}

+ (UIFont *)fontSizeChange:(CGFloat)size{
    
    return [UIFont fontSizeChange:size * KSceenW / 375];
    
}
@end
