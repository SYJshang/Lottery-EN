//
//  kaiJiangEntity.m
//  彩票2
//
//  Created by HongShun Chen on 2017/4/15.
//  Copyright © 2017年 1. All rights reserved.
//

#import "kaiJiangEntity.h"

@implementation kaiJiangEntity

@synthesize dataline;

@synthesize numbers;

@synthesize qiShuNo;

@synthesize type;


-(id) initWithDict:(NSDictionary *) dict
{
    self=[super init];
    if (self) {
        numbers = [dict objectForKey:@"number"];
        dataline = [dict objectForKey:@"dateline"];
        qiShuNo = [dict objectForKey:@"qihao"];
        type = [dict objectForKey:@"type"];
    }
    return self;
}
@end
