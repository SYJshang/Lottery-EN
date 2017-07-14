//
//  NSDate+INTDate.m
//  inrtest
//
//  Created by 张涛 on 16/5/10.
//  Copyright © 2016年 张涛. All rights reserved.
//

#import "NSDate+INTDate.h"

@implementation NSDate (INTDate)

- (NSDate *)stringWithDate:(NSString *)str{

    NSDateFormatter *formtter = [[NSDateFormatter alloc] init];
    [formtter setDateFormat:@"yyyy/MM/dd HH:mm:ss"];
    return [formtter dateFromString:str];
}

- (NSTimeInterval)dateWithTimeInteVal{
    return [self timeIntervalSince1970];
}

- (NSString *)dateWithString{
    
    NSDateFormatter *formtter = [[NSDateFormatter alloc] init];
    [formtter setDateFormat:@"yyyy/MM/dd HH:mm:ss"];
    
    return [formtter stringFromDate:self];
}
- (NSString *)dateWithString:(NSString *)formtterString{
    
    NSDateFormatter *formtter = [[NSDateFormatter alloc] init];
    [formtter setDateFormat:formtterString];
    
    return [formtter stringFromDate:self];
}

@end
