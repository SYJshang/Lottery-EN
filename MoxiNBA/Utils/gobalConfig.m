//
//  gobalConfig.m
//  Domino
//
//  Created by Jason chen on 2017/3/9.
//  Copyright © 2017年 jack.wang. All rights reserved.
//

#import "gobalConfig.h"

@implementation gobalConfig


@synthesize IsLogin;

@synthesize userName;
@synthesize phonenumber;

+(gobalConfig *) getInstance{
    static gobalConfig * __singletion;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __singletion=[[self alloc] init];
    });
    return __singletion;
    
}

-(void)clearData{
    self.userName =  nil;
}

@end
