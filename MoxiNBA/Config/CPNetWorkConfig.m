//
//  CPNetWorkConfig.m
//  inrtest
//
//  Created by 张涛 on 2017/5/8.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import "CPNetWorkConfig.h"

/***********************************************************
                         请求接口
 ***********************************************************/

NSString *const SERVER_HOST = @"https://www.h1055.com/";

NSString *const API_GETCOLLECTION_URL = @"ozsuser/getAllCollection.htmls";

NSString *const API_ISCOLLECTED_URL = @"ozsuser/isCollect.htmls";

NSString *const API_DELETECOLLECTION_URL = @"ozsuser/deleteCollection.htmls"; //取消收藏

NSString *const API_COLLECT_URL = @"ozsuser/saveCollection.htmls"; //收藏

NSString *const API_NEWSDETAIL_URL = @"api/newsDetail.htmls";

NSString *const API_GETCOMMENT_URL = @"api/discuss.htmls"; //评论

@implementation CPNetWorkConfig


@end
