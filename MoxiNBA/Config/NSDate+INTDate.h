//
//  NSDate+INTDate.h
//  inrtest
//
//  Created by 张涛 on 16/5/10.
//  Copyright © 2016年 张涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (INTDate)

- (NSDate *)stringWithDate:(NSString *)str;
- (NSTimeInterval)dateWithTimeInteVal;
- (NSString *)dateWithString;
- (NSString *)dateWithString:(NSString *)formtterString;

@end
