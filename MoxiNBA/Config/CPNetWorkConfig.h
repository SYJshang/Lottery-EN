//
//  CPNetWorkConfig.h
//  inrtest
//
//  Created by 张涛 on 2017/5/8.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CPNetWorkConfig : NSObject

/***********************************************************
                             请求接口
 ***********************************************************/

extern NSString *const SERVERT_HOST; //服务器请求地址

extern NSString *const API_GETCOLLECTION_URL; //获取收藏列表

extern NSString *const API_NEWSDETAIL_URL; //新闻详情

extern NSString *const API_ISCOLLECTED_URL; //是否收藏

extern NSString *const API_DELETECOLLECTION_URL; //取消收藏

extern NSString *const API_COLLECT_URL; //收藏

extern NSString *const API_GETCOMMENT_URL; //获取评论

//extern NSString *const API_

@end
