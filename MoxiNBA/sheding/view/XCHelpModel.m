//
//  XCHelpModel.m
//  彩票2
//
//  Created by 1 on 16/1/23.
//  Copyright © 2016年 1. All rights reserved.
//

#import "XCHelpModel.h"

@implementation XCHelpModel

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.title = dict[@"title"];
        self.html = dict[@"html"];
        self.ID = dict[@"id"];
    }
    return self;
}

+(instancetype)helpWithDict:(NSDictionary *)dict
{
    return  [[self alloc]initWithDict:dict];
}


@end
