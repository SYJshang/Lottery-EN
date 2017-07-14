//
//  XCHelpModel.h
//  彩票2
//
//  Created by 1 on 16/1/23.
//  Copyright © 2016年 1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XCHelpModel : NSObject

@property (nonatomic , strong)NSString *title;

@property (nonatomic , strong)NSString *html;

@property (nonatomic , strong)NSString *ID;


+ (instancetype)helpWithDict:(NSDictionary *)dict;

- (instancetype)initWithDict:(NSDictionary *)dict;

@end
