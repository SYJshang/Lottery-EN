//
//  Config.h
//  inrtest
//
//  Created by 张涛 on 16/4/18.
//  Copyright © 2016年 张涛. All rights reserved.
//

#ifndef Config_h
#define Config_h

/**颜色*/
#define Color(r,g,b,a)[UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
/**字体大小*/
#define fontSize(fontSize) [UIFont systemFontOfSize:(fontSize)]

// 设备物理尺寸
#define screen_width [UIScreen mainScreen].bounds.size.width
#define screen_height [UIScreen mainScreen].bounds.size.height
// 相对iphone6S 屏幕比
#define KWidth_ScaleW [UIScreen mainScreen].bounds.size.width/414.0f
#define KWidth_ScaleH [UIScreen mainScreen].bounds.size.height/736.0f

//iphone 型号
#define UI_IS_IPAD              ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
#define UI_IS_IPHONE            ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
#define UI_IS_IPHONE4           (UI_IS_IPHONE && [[UIScreen mainScreen] bounds].size.height < 568.0)
#define UI_IS_IPHONE5           (UI_IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 568.0)
#define UI_IS_IPHONE6           (UI_IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 667.0)
#define UI_IS_IPHONE6PLUS       (UI_IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 736.0 || [[UIScreen mainScreen] bounds].size.width == 414.0)

#define SCREEN_SIZE [ UIScreen mainScreen ].bounds.size
#define scaleWithSize(s) ((s) * (SCREEN_SIZE.width / 375))

#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )

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



//BaseURL
//#define ZZBaseURL   [NSString stringWithFormat:@"http://121.199.41.158:%@/api/matrix.ashx",[[ZZConfig getInstance] clientNo]]
//http://192.168.1.200:90/api/matrix.ashx
//192.168.1.200:

#define ZZBaseURL [NSString stringWithFormat:@"http://%@:%@/api/matrix.ashx", [[NSUserDefaults standardUserDefaults]objectForKey:@"IPAddress"],[[NSUserDefaults standardUserDefaults]objectForKey:@"PortNo"]]


// 错误编码
#define RESULT_ERRORCODEFIELD  @"errorcode"

//数据
#define RESULT_RESULTFIELD  @"result"

//userinfo

#define RESULT_USERINFOFIELD  @"userinfo"
//获取当前屏幕的高度
#define kScreenHeight ([UIScreen mainScreen].applicationFrame.size.height)

//获取当前屏幕的宽度
#define kScreenWidth  ([UIScreen mainScreen].applicationFrame.size.width)

//相关于320屏幕宽度的比例
#define GetScaleBy320 mScreenWidth/320
//实际像素相关于320屏幕转换后的大小
#define GetWidthBy320(value) (value)*GetScaleBy320

#define iPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242,2208), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640,1136), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750,1334), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPhone4S ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640,960), [[UIScreen mainScreen] currentMode].size) : NO)

#define RectWidth(f)                        f.size.width
#define RectHeight(f)                       f.size.height

// 自定义Log
#ifdef DEBUG // 调试
#define MyLog(...) NSLog(__VA_ARGS__)
#else // 发布打包
#define MyLog(...)
#endif


#define kHeight     [UIScreen mainScreen].bounds.size.height
#define kWidth      [UIScreen mainScreen].bounds.size.width
//背景颜色灰色
#define zBgColor [UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:1]
//cell的高度

//SettingView颜色
#define ZSettingView_COLOR [UIColor colorWithRed:225/255.0 green:13/255.0 blue:63/255.0 alpha:1]
#define  ZInfoCellH 70
#define  ZInfoTextViewCellH 140

#define IS_IOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7)

#define   k_labText_color_gray [UIColor colorWithRed:192/255.0 green:192/255.0 blue:192/255.0 alpha:1]

#define  k_APP_TABBAR_TITLE_COLOR  [UIColor colorWithRed:0 green:0 blue:0 alpha:1]

#define K_APP_TABBAR_TITLE_FONT     [UIFont systemFontOfSize:11.f]

// Include any system framework and library headers here that should be included in all compilation units.
// You will also need to set the Prefix Header build setting of one or more of your targets to reference this file.



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

#define MainColor   RGB(222, 47, 80) //主色

//RECT

#define K_FRAME_BASE_WIDTH      [[UIScreen mainScreen]bounds].size.width
#define K_FRAME_BASE_HEIGHT     [[UIScreen mainScreen]bounds].size.height
#define K_FRAME_HEAD_HEIGHT     64
#define K_FRAME_NAVIGATION_BAR_HEIGHT   44
#define K_FRAME_VIEW_ORIGIN_Y   64
#define K_FRAME_TABBAR_ITEM_WIDTH   K_FRAME_BASE_WIDTH/3
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

//#define K_NAVBAR_COLOR RGBA(255, 125, 67, 1)
#define K_NAVBAR_COLOR RGBA(255, 0, 45, 1)
#define RGB(r, g, b)                        [UIColor colorWithRed:(r)/255.f green:(g)/255.f blue:(b)/255.f alpha:1.f]
#define RGBA(r, g, b, a)                    [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
//TAG
#define K_TAG_TABBAR 900000
#define K_TAG_TABBAR_BORDER 900001

#endif /* Config_h */
