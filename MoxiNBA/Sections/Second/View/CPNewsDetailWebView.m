//
//  CPNewsDetailWebView.m
//  inrtest
//
//  Created by 张涛 on 2017/5/10.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import "CPNewsDetailWebView.h"

@implementation CPNewsDetailWebView

- (instancetype)init{
    self = [super init];
    if (self) {
        self.scrollView.contentSize = CGSizeMake(0, 0);
    }
    return self;
}

- (void)setHtml: (NSString *)html{
    _html = html;
    NSString *body = [NSString stringWithFormat:[self htmlTep], _html];
    self.body = body;
    [self loadHTMLString:body baseURL:nil];
}

- (NSString *)htmlTep{
    return @"<!DOCTYPE html>\
    <html>\
    <head>\
    <meta charset='UTF-8'>\
    <meta content='telephone=no' name='format-detection' />\
    <meta name = 'viewport' content ='initial-scale=1.0,maximum-scale=1,user-scalable=no'>\
    <title></title>\
    <style>*{margin:0;padding:0;list-style:none;font-size: 17px; color: #494949; line-height: 1.5; }img{max-width:100%% !important;height:auto !important;display:block;}.content{padding:0 18px;}body,p,h3,h2,h1,span{font-family:'STHeitiSC-Light','PingFangSC-Regular',helvetica,'Microsoft YaHei' !important;}iframe,video,embed,.tenvideo_player{width:100%% !important;height:220px !important;}</style>\
    </head>\
    <body><div class='content'>%@</div>\
    <script type='text/javascript'>\
    window.onload = function(){\
    var links = document.getElementsByTagName('a');\
    for(var i = 0; i < links.length; i++ ){\
    links[i].href = 'caida_open_url://'+links[i].href;\
    }\
    }\
    </script>\
    </body>\
    </html>";
}

@end
