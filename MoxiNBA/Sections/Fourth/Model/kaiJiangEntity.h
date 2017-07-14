//
//  kaiJiangEntity.h
//  彩票2
//
//  Created by HongShun Chen on 2017/4/15.
//  Copyright © 2017年 1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface kaiJiangEntity : NSObject


@property(nonatomic,strong)NSString *qiShuNo;

@property(nonatomic,strong)NSString *numbers;

@property(nonatomic,strong)NSString *dataline;

@property (nonatomic, strong) NSString *type;


-(id) initWithDict:(NSDictionary *) dict;

@end
