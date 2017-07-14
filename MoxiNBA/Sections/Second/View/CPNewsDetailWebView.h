//
//  CPNewsDetailWebView.h
//  inrtest
//
//  Created by 张涛 on 2017/5/10.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import <WebKit/WebKit.h>

@interface CPNewsDetailWebView : WKWebView

@property (nonatomic, strong) NSString *html;
@property (nonatomic, copy) NSString *body;

@end
