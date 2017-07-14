//
//  UIViewController+SYJViewContoller.m
//  MoXiDemo
//
//  Created by 尚勇杰 on 2017/5/26.
//  Copyright © 2017年 尚勇杰. All rights reserved.
//

#import "UIViewController+SYJViewContoller.h"
#import <objc/runtime.h>

@implementation UIViewController (SYJViewContoller)

+ (void)load{
    
    Method currentClass = class_getInstanceMethod(self, @selector(viewWillAppear:))
    ;
    Method changeClass = class_getInstanceMethod(self, @selector(syjViewWillAppear:))
    ;
    
    method_exchangeImplementations(changeClass, currentClass);
    
    
}

- (void)syjViewWillAppear:(CGFloat)size{

    NSString *className = NSStringFromClass([self class]);
    
    SYJLog(@"当前控制器的名称:%@",className);
    
}


@end
