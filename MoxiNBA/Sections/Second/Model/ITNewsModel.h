//
//  ITNewsModel.h
//  inrtest
//
//  Created by 张涛 on 2017/5/4.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ITNewsModel : NSObject
//标题
@property (nonatomic, strong) NSString *title;
//内容
@property (nonatomic, strong) NSString *content;
//图片
@property (nonatomic, strong) NSString *imageurl;
//简述
@property (nonatomic, strong) NSString *desc;
//时间
@property (nonatomic, strong) NSString *author;
//作者
@property (nonatomic, strong) NSString *source;
//id
@property (nonatomic, strong) NSString *ID;

@property (nonatomic, assign) NSInteger commentCount;

@property (nonatomic, strong) NSString *strTime;

@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *registertime;
@property (nonatomic, strong) NSString *url;

@end
