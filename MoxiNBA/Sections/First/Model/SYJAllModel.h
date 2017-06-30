//
//  SYJAllModel.h
//  MoxiNBA
//
//  Created by 尚勇杰 on 2017/6/27.
//  Copyright © 2017年 尚勇杰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SYJAttIDModel.h"

@interface SYJAllModel : NSObject

@property (nonatomic, strong) NSString *nextdraw_date;
@property (nonatomic, strong) NSString *lastdraw_numbers;
@property (nonatomic, strong) NSString *lastdraw_date;
@property (nonatomic, strong) NSString *jackpot;
@property (nonatomic, strong) SYJAttIDModel *name;



@end
