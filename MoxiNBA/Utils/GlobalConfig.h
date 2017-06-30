//
//  GlobalConfig.h
//  WenZhouABC
//
//  Created by BM on 13-8-21.
//  Copyright (c) 2013年 bluemobi. All rights reserved.
//


//BaseURL
//#define  K_APP_BASE_URL  @"http://10.1.80.228:8080"
//测试
#define  K_APP_BASE_URL  @"http://www.h1055.com"

//
#define K_APP_FIRST_URL @"http://10.1.80.228:8080"

//视频分享网址
#define K_VIDEO_SHARE_BASE_PATH @"http://www.hangdali.com/videoDetail.html?videoId="

//APP协议和条款网址
#define K_APP_CLAUSE_URL  @"http://www.hangdali.com/terms.html"

//APP版本检测地址
#define K_APP_UPDATE_URL    @"http://itunes.apple.com/lookup?id=946847442"
//@"http://itunes.apple.com/lookup?id=864804937"

//APP下载地址
#define K_APPSTORE_DOWNLOAD_URL @"https://itunes.apple.com/us/app/da-li-jin-gang/id946847442?l=zh&ls=1&mt=8"
//@"https://itunes.apple.com/cn/app/auto-video/id864804937?mt=8#"

//新浪微博appkey，url
#define K_SINA_Appkey @"3815807140"
#define K_SINA_kAppSecret @"836f0d7d43e9db50a0772d0bae6a4e52"
#define K_SINA_RedirectURL @"https://api.weibo.com/oauth2/default.html"

//QQID
#define K_QQ_APPID @"1104749176"
//#define K_QQ_APPID @"222222"


#define K_WeiXin_APPID @"wx223a47e9828e9b67"
//#define K_WeiXin_PartnerId @"1392876902"


#define K_AliPay_APPID @"2016051001382348"
#define K_AliPay_SellerId @"2088021151985066"


////短信验证码
//#define K_SMS_APPKey @"50c4d5030030"
//#define K_SMS_APPSecret @"05494c9b6c41b0d9c9de11bb32fcf7ec"


//圆形用户头像的边缘宽度
#define K_UserHeadImg_BorderWidth   1.0f

//圆形用户头像的边缘颜色
#define K_UserHeadImg_BorderColor   [[UIColor colorWithRed:161/255.0 green:160/255.0 blue:160/255.0 alpha:1.0] CGColor]


//视频cell的分割线，深颜色单线条颜色
#define K_Video_Cell_Single_Line_Color  [UIColor blackColor]

//视频cell的分割线，宽线条颜色
#define K_Video_Cell_Base_line_color [UIColor blackColor]


//RECT

#define K_FRAME_BASE_WIDTH      [[UIScreen mainScreen]bounds].size.width
#define K_FRAME_BASE_HEIGHT     [[UIScreen mainScreen]bounds].size.height
#define K_FRAME_HEAD_HEIGHT     64
#define K_FRAME_NAVIGATION_BAR_HEIGHT   44
#define K_FRAME_VIEW_ORIGIN_Y   64
#define K_FRAME_TABBAR_ITEM_WIDTH   K_FRAME_BASE_WIDTH/4
#define K_FRAME_TABBAR_HEIGHT   49
#define K_FRAME_TABBAR_BACKGROUND_HEIGHT    50
#define K_FRAME_EDGE_DISTANCE   10
#define K_FRAME_CONTENT_HEIGHT  K_FRAME_BASE_HEIGHT-K_FRAME_NAVIGATION_BAR_HEIGHT-K_FRAME_TABBAR_BACKGROUND_HEIGHT-K_FRAME_HEAD_HEIGHT


#define K_RECT_FRAME(R) R.frame


#define K_RECT_MAXX(R) CGRectGetMaxX(K_RECT_FRAME(R))
#define K_RECT_MAXY(R) CGRectGetMaxY(K_RECT_FRAME(R))

//COLOR
#define K_COLOR_DAMINO_BLUE     [UIColor colorWithRed:0/255.0 green:106/255.0 blue:166.0/255.0 alpha:1.0]
#define K_COLOR_DAMINO_RED     [UIColor colorWithRed:208/255.0 green:17/255.0 blue:43.0/255.0 alpha:1.0]

#define K_NAVBAR_COLOR RGBA(255, 125, 67, 1)
//TAG
#define K_TAG_TABBAR 900000
#define K_TAG_TABBAR_BORDER 900001



