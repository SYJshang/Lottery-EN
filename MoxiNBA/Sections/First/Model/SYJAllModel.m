
//
//  SYJAllModel.m
//  MoxiNBA
//
//  Created by 尚勇杰 on 2017/6/27.
//  Copyright © 2017年 尚勇杰. All rights reserved.
//

#import "SYJAllModel.h"

@implementation SYJAllModel

+ (NSDictionary *)mj_objectClassInArray{
    return @{ @"name" : @"SYJAttIDModel"
              };
}

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    /* 返回的字典，key为模型属性名，value为转化的字典的多级key */
    return @{
             @"name" : @"@attributes"
             };
}

@end
