//
//  ALCommonMarco.h
//  Aladdin
//
//  Created by Yfeng__ on 14-6-6.
//  Copyright (c) 2014年 com.jit. All rights reserved.
//

#ifndef Aladdin_ALCommonMarco_h
#define Aladdin_ALCommonMarco_h

#import "UIColor+expanded.h"

#pragma mark - common
//#define VERSION     @"v2.0.5"
#define VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleVersionKey]



#pragma mark - system info

#define IOS5    5.000000f
#define IOS4    4.000000f
#define IOS6    6.000000f
#define IOS7    7.000000f
#define IOS4_2  4.2f
#define IPHONE_SIMULATOR			@"iPhone Simulator"
#define CURRENT_OS_VERSION  [[[UIDevice currentDevice] systemVersion] floatValue]

#define isRetina ([[UIScreen mainScreen] scale]==2)
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define isPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

#pragma mark - splash

#define SPLASH_DEFAULT_SLEEP_DURATION  2.f

#pragma mark - obj

#define OBJ_FROM_DIC(_DIC_, _KEY_) [CommonUtils validateResult:_DIC_ dicKey:_KEY_]
#define INT_VALUE_FROM_DIC(_DIC_, _KEY_) ((NSString *)OBJ_FROM_DIC(_DIC_, _KEY_)).intValue
#define FLOAT_VALUE_FROM_DIC(_DIC_, _KEY_) ((NSString *)OBJ_FROM_DIC(_DIC_, _KEY_)).floatValue
#define DOUBLE_VALUE_FROM_DIC(_DIC_, _KEY_) ((NSString *)OBJ_FROM_DIC(_DIC_, _KEY_)).doubleValue

#pragma mark - number

#define NUMBER(__OBJ) [NSNumber numberWithInt:__OBJ]


#pragma mark - color

#define RANDOM_COLOR [UIColor colorWithRed:arc4random() % 255 / 255.0 green:arc4random() % 255 / 255.0 blue:arc4random() % 255 / 255.0 alpha:1]
#define COLOR(r, g, b)            [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
#define TRANSPARENT_COLOR         [UIColor clearColor]
#define TITLE_COLOR               COLOR(90.0f, 90.0f, 90.0f)
#define BLUE_TITLE_COLOR          COLOR(36.0f, 107.0f, 195.0f)
#define LIGHT_GRAY_BACKGROUND_COLOR COLOR(252.0f, 252.0f, 252.0f)
#define WHITE_COLOR               [UIColor whiteColor]
#define RED_COLOR                   [UIColor redColor]
#define BLACK_COLOR               [UIColor blackColor]
#define BLUE_COLOR                [UIColor blueColor]
#define HEX_COLOR(__STR)          [UIColor colorWithHexString:__STR]
#define DEFAULT_VIEW_COLOR  COLOR(0xe1, 0xe5, 0xe7)
#define DEFAULT_VIEW_BACKGROUND_COLOR COLOR(238,238,238)
#define DEFAULT_BACKGROUND_COLOR COLOR(0xed, 0xed, 0xed)


#pragma mark - image

#define kColorWithPatternImage(name)     [UIColor colorWithPatternImage:[UIImage imageNamed:name]]
#define kImageNamed(name)                [UIImage imageNamed:name]



#define NUMBER(__OBJ) [NSNumber numberWithInt:__OBJ]
#define NUMBER_LONG(__OBJ) [NSNumber numberWithLong:__OBJ]
#define NUMBER_DOUBLE(__OBJ) [NSNumber numberWithDouble:__OBJ]


#pragma mark - ui elements

#define NUMBER_BADGE_COLOR    COLOR(231,50,47)
#define PHOTO_MARGIN          3.0f
#define MARGIN                5.0f
#define HEADER_SCROLL_HEIGHT  240.f
#define FOOTER_CELL_HEIGHT    40.f
#define DEFAULT_CELL_HEIGHT             44.0f
#define DEFAULT_HEADER_CELL_HEIGHT      20.0f

#pragma mark - WeChat integration
#define MAX_WECHAT_ATTACHED_IMG_SIZE    30 * 1024
#define MAX_WECHAT_MAX_DESC_CHAR_COUNT  32
#define MAX_WECHAT_MAX_TITLE_CHAR_COUNT 60


#pragma mark - size

#define APP_DELEGATE            [UIApplication sharedApplication].delegate
#define APP_WINDOW              ((UIWindow *)([[UIApplication sharedApplication].windows objectAtIndex:0]))
#define WINDOW                  (APP_DELEGATE).window
#define SCREEN_WIDTH            WINDOW.frame.size.width
#define SCREEN_HEIGHT           WINDOW.frame.size.height


#define NAVIGATION_BAR_HEIGHT           44.0f
#define SYS_STATUS_BAR_HEIGHT   [UIApplication sharedApplication].statusBarFrame.size.height

#define mark - date time

#define kDEFAULT_DATE_TIME_FORMAT   (@"yyyy-MM-dd HH:mm:ss")


#pragma mark - WeChat integration

#define MAX_WECHAT_ATTACHED_IMG_SIZE    30 * 1024
#define MAX_WECHAT_MAX_DESC_CHAR_COUNT  32
#define MAX_WECHAT_MAX_TITLE_CHAR_COUNT 60


#pragma mark - font
#define FONT_SYSTEM_SIZE(size) [UIFont systemFontOfSize:(size)]
#define FONT_BOLD_SYSTEM_SIZE(size) [UIFont boldSystemFontOfSize:(size)]

#define scaleWithSize(s) ((s) * (SCREEN_SIZE.width / 375))

#pragma mark - data value
#define NULL_PARAM_VALUE            @""
#define INIT_VALUE_TYPE             -1
#define STR_FORMAT(args...)         [NSString stringWithFormat:args]
#define INT_TO_STRING(_INT_VALUE)   STR_FORMAT(@"%d", _INT_VALUE)
#define LLINT_TO_STRING(_LLINT_VALUE)   [NSString stringWithFormat:@"%lld", _LLINT_VALUE]
#define FLOAT_TO_STRING(_FLOAT_VALUE)   [NSString stringWithFormat:@"%f", _FLOAT_VALUE]
#define DOUBLE_TO_STRING(_DOUBLE_VALUE) [NSString stringWithFormat:@"%f", _DOUBLE_VALUE]
#define LOCDATA_TO_STRING(_DOUBLE_VALUE) [NSString stringWithFormat:@"%.8f", _DOUBLE_VALUE]
#define RADIANS( degrees )			( degrees * M_PI / 180 )

#define URLFormat(fmt,...) [NSString stringWithFormat:fmt,##__VA_ARGS__]

#pragma mark - date formatter type
typedef enum {
    FormatType_Default = 0,
    FormatType_Han
}FormatType;

typedef NS_ENUM(NSInteger, ALDTabBarIndexTag) {
    ALDTabBarIndexTagMerchant = 0,
    ALDTabBarIndexTagService,
    ALDTabBarIndexTagGroup,
    ALDTabBarIndexTagOrder,
    ALDTabBarIndexTagPersonal
};


#pragma mark - cell margin

typedef struct {
    CGFloat left;
    CGFloat right;
    CGFloat top;
    CGFloat bottom;
}CellMargin;

UIKIT_STATIC_INLINE CellMargin NSCellMarginMake(CGFloat left,
                                                CGFloat right,
                                                CGFloat top,
                                                CGFloat bottom) {
    CellMargin cm = {left, right, top, bottom};
    return cm;
}

typedef struct {
    CGFloat x;
    CGFloat y;
}CellDist;

UIKIT_STATIC_INLINE CellDist NSCellDistanceMake(CGFloat x,
                                                CGFloat y) {
    CellDist cd = {x, y};
    return cd;
}


//============================


#pragma mark - font
#define BASE_INFO_COLOR                 COLOR(130, 130, 140)
#define DARK_TEXT_COLOR  COLOR(98, 87, 87)
#define HEADER_CELL_TITLE_FONT    BOLD_FONT(13)

#pragma mark - table cell
#define CELL_TITLE_COLOR COLOR(30.0f, 30.0f, 30.0f)

#define CELL_COLOR                      COLOR(239, 239, 239)

#define COMMON_CELL_SUBTITLE_FONT BOLD_FONT(12)
#define COMMON_CELL_TITLE_FONT    BOLD_FONT(14)
#define COMMON_CELL_CONTENT_FONT  BOLD_FONT(13)

#define CELL_TITLE_IMAGE_SIDE_LENGTH    24.0f

#define CELL_CONTENT_PORTRAIT_WIDTH     280.0f

#define PLAIN_TABLE_NO_TITLE_IMAGE_ACCESS_DISCLOSUR_WIDTH     266.0f
#define PLAIN_TABLE_NO_IMAGE_ACCESS_NONE_WIDTH                300.0f
#define GROUPED_TABLE_NO_TITLE_IMAGE_ACCESS_DISCLOSUR_WIDTH   216.0f
#define GROUPED_TABLE_NO_TITLE_IMAGE_ACCESS_NONE_WIDTH        270.0f

#define PLAIN_TABLE_WITH_TITLE_IMAGE_ACCESS_DISCLOSUR_WIDTH   232.0f
#define PLAIN_TABLE_WITH_IMAGE_ACCESS_NONE_WIDTH              246.0f
#define GROUPED_TABLE_WITH_TITLE_IMAGE_ACCESS_DISCLOSUR_WIDTH 232.0f
#define GROUPED_TABLE_WITH_TITLE_IMAGE_ACCESS_NONE_WIDTH      236.0f

#define GROUP_STYLE_CELL_CORNER_RADIUS  10.0f

#pragma mark - table list
#define SEPARATOR_LINE_COLOR            COLOR(158,161,168)


//#define FONT_SYSTEM_SIZE(aSize) [UIFont fontWithName:@"MicrosoftYaHei" size:aSize]
//#define FONT_BOLD_SYSTEM_SIZE(aSize) [UIFont fontWithName:@"MicrosoftYaHei-Bold" size:aSize]

#define FONT_SYSTEM_SIZE(size) [UIFont systemFontOfSize:(size)]
#define FONT_BOLD_SYSTEM_SIZE(size) [UIFont boldSystemFontOfSize:(size)]




#define DEFAULT_NAV_BAR_COLOR   [UIColor colorWithPatternImage:[UIImage imageNamed:@"gohigh_navigationBar_background"]]

#define DEFAULT_VIEW_COLOR  COLOR(0xe1, 0xe5, 0xe7)
#define DEFAULT_VIEW_BACKGROUND_COLOR COLOR(238,238,238)
//#define DEFAULT_VIEW_COLOR [UIColor colorWithPatternImage:IMAGE_WITH_NAME(@"background")]


#define COLOR_WITH_IMAGE_NAME(name)     [UIColor colorWithPatternImage:[UIImage imageNamed:name]]
#define IMAGE_WITH_IMAGE_NAME(name)     [UIImage imageNamed:name]

#pragma mark - common ui elements
#define NUMBER_BADGE_COLOR    COLOR(231,50,47)
#define PHOTO_MARGIN                    3.0f

#define kDEFAULT_DATE_TIME_FORMAT   (@"yyyy-MM-dd HH:mm:ss")


#define MARGIN                      5.0f


#define HEADER_SCROLL_HEIGHT  240.f

#define FOOTER_CELL_HEIGHT   40.f


#define CHART_PHOTO_WIDTH               35.f //42.5f
#define CHART_PHOTO_HEIGHT              35.f //50.0f

//底部高度
#define ITEM_BASE_TOP_VIEW_HEIGHT    0
#define ITEM_BASE_BOTTOM_VIEW_HEIGHT    40

#define ALONE_MARKETING_TAB_HEIGHT 44

#pragma mark - network


#pragma mark - we chat
#define WEIXIN_APP_ID       @"wx57ec13e1abe5c946"
#define WEIXIN_APP_KEY      @"10463958b01083d8cbd3e552861cf7ff"


#pragma mark - homepage
#define HOMEPAGE_TAB_HEIGHT             47.0f
#define NO_IMAGE_FLAG                 @"no_image_url_"


#define NAVIGATION_BAR_COLOR      COLOR(221, 57, 57)


#pragma mark - WeChat integration
#define MAX_WECHAT_ATTACHED_IMG_SIZE    30 * 1024
#define MAX_WECHAT_MAX_DESC_CHAR_COUNT  32
#define MAX_WECHAT_MAX_TITLE_CHAR_COUNT 60

/*
 typedef enum {
 ENTRANCE_TAG,
 BIZ_TAG,
 EVENT_TAG,
 MORE_TAG,
 } HomeEntranceItemTagType;
 
 */


#define VALUE_TO_BE_EXPECTED    @"敬请期待"


#define VALUE_LOCATION_ALL      @"全城"
#define VALUE_LOCATION_500      @"500m"
#define VALUE_LOCATION_1000     @"1000m"
#define VALUE_LOCATION_2000     @"2000m"
#define VALUE_LOCATION_5000     @"5000m"


#define VALUE_SORT_DEFAULT      @"默认排序"
#define VALUE_SORT_DIST_FIRST   @"按距离从近到远排序"
#define VALUE_SORT_HOT_FIRST        @"按热门从高到低排序"


#define VALUE_VERSION_TIP       @"检测到新版本，是否升级？"


#define VALUE_PAGE_SIZE 20



#define VALUE_ORDER_INFO_ORDER_ID       @"orderId"
#define VALUE_ORDER_INFO_ORDER_AMOUNT   @"orderAmount"



#define TAB_HEIGHT 44
#define NAVIGATION_BAR_HEIGHT           44.0f
#define SYS_STATUS_BAR_HEIGHT   [UIApplication sharedApplication].statusBarFrame.size.height




#define APP_CHANNEL_ID_ALADDIN_DEV      @"4"
#define APP_CHANNEL_ID_ALADDIN_PRO      @"4"



#pragma mark - system info
#define IOS5    5.000000f
#define IOS4    4.000000f
#define IOS6    6.000000f
#define IOS7    7.000000f
#define IOS4_2  4.2f
#define IPHONE_SIMULATOR			@"iPhone Simulator"


#define CURRENT_OS_VERSION  [[[UIDevice currentDevice] systemVersion] floatValue]


//订xx 类型
enum BOOK_TYPE {
    BOOK_TYPE_SEATS,
    BOOK_TYPE_DINNER,
};

#pragma mark - date formatter type

typedef enum {
    NEW_TAG = 0,
    TUAN_TAG,
    HOMEPAGE_TAG,
    ORDER_TAG,
    ME_TAG,
} HomeEntranceItemTagType;

typedef enum {
    ELIYA_HOMEPAGE_TAG = 0,
    ELIYA_STORE_TAG = 1,
    ELIYA_ORDER_TAG = 2,
    ELIYA_ME_TAG = 3,
    
}EliyaHomeEntranceItemTagType;


enum ORDER_PAY_TYPE {
    ORDER_PAY_TYPE_TMALL = 1,
    ORDER_PAY_TYPE_IVR = 2,
    ORDER_PAY_TYPE_WAP = 3,
};
#pragma mark - training

typedef enum {
    MY_COURSE_TY,
    ALL_COURSE_TY,
}TrainingCourseType;


#pragma mark - alumnus
typedef enum {
    OTHER_CLASS_ALUMNUS_TY,
    SAME_CLASS_ALUMNUS_TY,
} KnownAlumnusType;

typedef enum {
	CHAT_SHEET_IDX,
	DETAIL_SHEET_IDX,
    CANCEL_SHEET_IDX,
} UserListActionSheetType;



enum ORDER_TYPE {
    ORDER_TYPE_TANGCHI= 1,
    ORDER_TYPE_WAISONG = 2
};

enum ORDER_INFO_TYPE {
    ORDER_INFO_TYPE_NON_GROUP = 0,
    ORDER_INFO_TYPE_GROUP = 1,
}; 


enum ELIYA_TUAN_CELL_VIEW_TYPE {
    
    ELIYA_TUAN_CELL_VIEW_TYPE_UNKNOWN=-1,
    ELIYA_TUAN_CELL_VIEW_TYPE_GROUP=0,//第2个--团购
    ELIYA_TUAN_CELL_VIEW_TYPE_PANIC_BUY=1,//第1个--抢购
    ELIYA_TUAN_CELL_VIEW_TYPE_TIME=2,//第3个--限时购
};

enum GROUP_PROPERTY_TYPE {
    GROUP_PROPERTY_TYPE_NAME = 1,
    GROUP_PROPERTY_BRIEF,
    GROUP_PROPERTY_PHONE,
    GROUP_PROPERTY_EMAIL,
    GROUP_PROPERTY_WEBSITE,
};


enum FRIEND_TYPE {
    FRIEND_TYPE_UPDATE = 0,
    FRIEND_TYPE_DELETE = 2,
    FRIEND_TYPE_ADD = 1,
    FRIEND_TYPE_PRIVATE_DELETE=3,
};

#pragma mark - event
#define FAKE_EVENT_INTERVAL_DAY   -1

typedef enum {
    OTHER_CATEGORY_EVENT = 0,
    TODAY_CATEGORY_EVENT = 1,
    THIS_MONTH_CATEGORY_EVENT,
} EventDateCategory;

#pragma mark - load item type
typedef enum {
    LOGIN_TY,
    LOAD_LATEST_VIDEO_TY,
    EVENTLIST_TY,
    LOAD_KNOWN_ALUMNUS_TY,
    SUBMIT_FEEDBACK_TY,
    
    LOAD_SEARCH_STORE_LIST,//3.1.1	首页商户搜索
    LOAD_GET_MESSAGE_LIST,  //3.1.2	获取首页消息
    LOAD_HOMEPAGE_AD_IMAGES      ,//3.1.3	获取首页图片广告
    LOAD_GET_COUPONS,//3.1.4	获取优惠券
    LOAD_GET_HOT_COMMODITIES,//3.1.5	获取热销商品
    
    LOAD_GET_CITIES,//3.1.6	获取城市信息
    
    LOAD_GET_MALL_ITEM_CATEGORIES,//3.1.7
    LOAD_GET_MALL_ITEMS,//3.1.8
    
    LOAD_GET_STORE_LIST,//3.2.1	获取商户列表
    LOAD_GET_CONDITION_LIST,//3.2.3	获取筛选条件列表
    LOAD_MEMBER_LOGIN,        //3.3.2	会员登录
    LOAD_MEMBER_REGISTER,       //3.3.2 会员注册
    LOAD_QUERY_AUTH_CODE,   //3.3.4	获取验证码
    LOAD_AUTH_CODE_LOGIN,   //3.3.5	验证码登录
    LOAD_GET_STORE_DETAIL,//获取商户详情
    LOAD_CHECK_APP_VERSION,//3.1 3.1.	检查App版本
    LOAD_GET_ORDERS_LIST,//3.4.4	获取订单列表
    LOAD_CHANGE_ORDER_STATUS,//3.4.4
    LOAD_GET_CONSIGNEE_ADDRESS_LIST,//3.5.1	获取收货地址列表
    LOAD_GET_CONSIGNEE_ADD_ADDRESS_OPERATE, //3.5.2	收货地址新增、修改、删除操作
    LOAD_GET_AREA_LIST,//3.5.3	获取地理区域信息
    LOAD_GET_NEWEST_RECOMMAND,//3.5.8	获取最新商品展示
    LOAD_GET_GROUP_PURCHASE_LIST,//3.5.9	获取团购信息
    
    LOAD_GET_STORE_ITEM_TYPE_LIST,//2.2.2 获取福利商品类别集合
    
    LOAD_GET_STORE_ITEM_LIST,//2.2.1 获取校友福利商品列表
    LOAD_GET_STORE_ITEM_DETAIL,//2.2.4
    LOAD_GET_STORE_LIST_BY_ITEM,//2.2.5
    LOAD_GET_PAYMENT_LIST,  //2.2.12 获取支付方式集合
    LOAD_SET_ITEM_KEEP,//2.2.15 设置福利商品收藏与取消收藏
    LOAD_GET_PANIC_BUY_ITEM_LIST,//10.4.1 获取抢购商品列表
    LOAD_GET_PANIC_BUY_ITEM_DETAIL,//10.4.2 获取抢购商品明细信息
    LOAD_GET_PANIC_BUY_LIST,//11.2.1 获取首页商品列表
    
    LOAD_SET_SEAT_ORDER_INFO,//2.2.22 提交订座
    
    LOAD_SET_SHOPPING_CART,    //2.5.6 提交购物车信息(单个商品)
    LOAD_SET_SHOPPING_CART_LIST,    //2.5.6-2 提交购物车信息(多个商品)
    LOAD_GET_SHOPPING_CART,//2.5.7 获取购物车商品信息(酒店修改)
    LOAD_GET_ITEM_KEEP, //2.5.9 获取收藏商品信息
    LOAD_GET_ORDER_LIST, //2.5.10 获取收藏商品信息
    LOAD_SET_ORDER_STATUS,//2.5.12 订单状态修改
    LOAD_GET_VIP_ADDRESS_LIST,//2 收货地址管理
    LOAD_SET_VIP_ADDRESS,//2 收货地址修改
    
    LOAD_GET_DISTRICT_LIST,//3.3.4	获取区县列表
    LOAD_GET_VIP_ORDER_LIST,//4.4.6	获取会员个人中心订单列表
    LOAD_GET_VIP_ORDER_DETAIL,//4.6.7	获取订单详细
    
    LOAD_GET_PAYMENT_LIST_BY_CID,//7.5.1 获取客户的支付方式
    LOAD_SET_PAY_ORDER,//7.5.2 订单支付
    
    LOAD_SET_DEVICE_TOKEN,//设置o2o device token
    LOAD_SET_SIGN_UP,//O2O注册
    LOAD_SET_SIGN_IN,//O2O登录
    LOAD_GET_CUSTOMER_SETTING,//4.11.1	获取客户基本信息
    
    LOAD_SET_ORDER_INFO_TWO_TANGCHI,//2.2.10 订单提交
    LOAD_SET_ORDER_INFO_TWO_WAISONG,//2.2.10 订单提交
    LOAD_SET_ORDER_INFO_4_ALD,//2.2.10 订单提交
    LOAD_IS_ORDER_PAYED_4_ALD,//检查订单是否提交
    
    LOAD_APP_VERSION_INFO,//版本检查
    
    LOAD_PAY_ORDER, //订单支付
    LOAD_MALL_PAY_ORDER,//阿拉丁Mall 支付
    
#pragma mark -- eliya
    LOAD_ELIYA_GET_AD_LIST,//2.1.1	获取广告列表
    LOAD_ELIYA_GET_INDEX_CATEGORY_LIST,//2.1.2	获取类目列表
    LOAD_ELIYA_GET_SEARCH_STORES,//2.2.1	查询门店
    LOAD_ELIYA_HOMEPAGE_CONFIG,//4.3.1	获取客户端首页信息
    
    LOAD_ELIYA_GET_ITEM_KEEP,
    LOAD_ELIYA_SET_ITEM_KEEP,
    LOAD_ELIYA_CHANGE_PASSWORD,//修改密码
    LOAD_ELIYA_GET_CATEGORY_LIST,//获取商品分类
    
    LOAD_ELIYA_GET_AUTH_CODE,
    LOAD_ELIYA_AUTH_CODE_LOGIN,
    
    
#pragma mark -- aladdin
    LOAD_GET_HOME_PAGE,//3.1.1	获取首页信息
    LOAD_GET_PRODUCT_DETAIL
    
} WebItemType;


typedef enum {
    
    ERR_CODE = -1,
    MOC_SAVE_ERR_CODE = 1,
    NO_DATA_CODE = 1001,
    SUCCESS_CODE = 200,
    RESP_OK = 200,
    APP_EXPIRED_CODE = 206,
    SOFT_UPDATE_CODE = 220,
    
    
    
    // system error code
    SESSION_EXPIRED_CODE = 101,
    BACKEND_ERR_CODE = 102,
    DB_ERROR_CODE = 103,
    USER_NO_AUTH_CODE = 104,
    
    // biz error code
    CUSTOMER_NAME_ERR_CODE = 300,
    USERNAME_ERR_CODE = 301,
    PASSWORD_ERR_CODE = 302,
    ACCOUNT_INVALID_CODE = 303,
    MOBILE_OCCUPIED_CODE = 304,
    EMAIL_OCCUPIED_CODE = 305,
    HAS_NEW_VERSION_CODE = 306,
    // join the group
    GROUP_REJECT_JOIN = 307,
    GROUP_NEED_AUDIT_JOIN = 308,
    GROUP_APPLY_JOINED = 309,
    GROUP_EXIT_FAILED = 400,
    
    // object handle
    OBJ_IS_NULL_CODE = 404,
    
    PASSWORD_OLD_ERR_CODE = 425,
    
    GROUP_NOT_EXIST = 1002,
    // coustom jump
    COUSTOM_JUMP_PROFILE = 4001,// 个人名片页面
    COUSTOM_JUMP_CERTIFICATION = 4002,// 提交认证资料页面
    COUSTOM_JUMP_APPROVAL = 4003,// 待认证页面
    
} ConnectionAndParserResultCode;


enum STORE_INFO_DATA_SOURCE_TYPE {
    STORE_INFO_DATA_SOURCE_TYPE_SEARCH,
    STORE_INFO_DATA_SOURCE_TYPE_GET,
};


enum HOMEPAGE_ITEM_TYPE {
    HOMEPAGE_ITEM_TYPE_UNKNOWN= -1,
    HOMEPAGE_ITEM_TYPE_ALL  =   0,
    HOMEPAGE_ITEM_TYPE_RESTRANT=1,
    HOMEPAGE_ITEM_TYPE_HOTEL=2,
    HOMEPAGE_ITEM_TYPE_MRMF=3,
    HOMEPAGE_ITEM_TYPE_HELTHY=4,
    HOMEPAGE_ITEM_TYPE_CAR_SERVICE=5,
    HOMEPAGE_ITEM_TYPE_SURROUNDING=6,
    HOMEPAGE_ITEM_TYPE_SHOP=7,
    HOMEPAGE_ITEM_TYPE_ALASHE=8,
};

//个人中心类型
enum PERSONAL_CENTER_CELL_TYPE {
    PERSONAL_CENTER_CELL_TYPE_PRE_ORDER,
    PERSONAL_CENTER_CELL_TYPE_ORDER,
    PERSONAL_CENTER_CELL_TYPE_INFO,
    PERSONAL_CENTER_CELL_TYPE_PREFERENTIAL,
};

enum STORE_INFO_FEATURE_TYPE {
    STORE_INFO_FEATURE_TYPE_MENG = 1,
    STORE_INFO_FEATURE_TYPE_TUAN = 2,
    STORE_INFO_FEATURE_TYPE_QUAN=3,
    STORE_INFO_FEATURE_TYPE_DING =4,
};


enum ORDER_SEAT_CELL_TYPE {
    ORDER_SEAT_CELL_TYPE_MEMBER_COUNT_TIME,
    ORDER_SEAT_CELL_TYPE_PERSONAL_INFO,
    ORDER_SEAT_CELL_TYPE_REMARK,
};



enum ADD_CONSIGNEE_ADDRESS_OPERATOR_TYPE {
    ADD_CONSIGNEE_ADDRESS_OPERATOR_TYPE_ADD = 1,
    ADD_CONSIGNEE_ADDRESS_OPERATOR_TYPE_MODIFY = 2,
    ADD_CONSIGNEE_ADDRESS_OPERATOR_TYPE_DELETE = 3,
};

enum CONDITION_FILTER_TYPE {
    CONDITION_FILTER_TYPE_ZONE = 0,
    CONDITION_FILTER_TYPE_CATEGORY = 1,
    CONDITION_FILTER_TYPE_SORT_ORDER = 2,
};


enum MOC_FROM_TYPE {
    MOC_FRMO_TYPE_SHOPPING_CART,
    MOC_FROM_TYPE_ITEM_INFO,
};

#pragma mark - address operation type

typedef NS_ENUM (NSInteger, AddressOperationType) {
    AddressOperationTypeAdd     = 1,
    AddressOperationTypeModify  = 2,
    AddressOperationTypeDelete  = 3,
    AddressOperationTypeDefault  = 4,
};

#pragma mark - system message
typedef enum {
	SUCCESS_TY,
    INFO_TY,
	WARNING_TY,
	ERROR_TY,
} MessageType;

#define ADD_CONSIGNEE_CELL_TYPE_TITLE       @"consigneeTypeTitle"
#define ADD_CONSIGNEE_CELL_TYPE_TYPE        @"consigneeTypeType"
#define ADD_CONSIGNEE_CELL_TYPE_VALUE       @"consigneeTypeValue"
#define ADD_CONSIGNEE_CELL_TYPE_PLACEHOLD   @"consigneeTypePlacehold"



#define OBJ_FROM_DIC(_DIC_, _KEY_) [CommonUtils validateResult:_DIC_ dicKey:_KEY_]
#define INT_VALUE_FROM_DIC(_DIC_, _KEY_) ((NSString *)OBJ_FROM_DIC(_DIC_, _KEY_)).intValue
#define FLOAT_VALUE_FROM_DIC(_DIC_, _KEY_) ((NSString *)OBJ_FROM_DIC(_DIC_, _KEY_)).floatValue
#define DOUBLE_VALUE_FROM_DIC(_DIC_, _KEY_) ((NSString *)OBJ_FROM_DIC(_DIC_, _KEY_)).doubleValue


#pragma mark - UIAlertView

#if __has_feature(objc_arc)

#define ShowAlert(Delegate,TITLE,MSG,But) [[[UIAlertView alloc] initWithTitle:(TITLE) \
message:(MSG) \
delegate:Delegate \
cancelButtonTitle:But \
otherButtonTitles:nil] show]

#else

#define ShowAlert(Delegate,TITLE,MSG,But) [[[[UIAlertView alloc] initWithTitle:(TITLE) \
message:(MSG) \
delegate:Delegate \
cancelButtonTitle:But \
otherButtonTitles:nil] autorelease] show]

#endif

#define DETAIL_RET_CODE_NAME    @"code"
#define RET_CODE_NAME               @"ResultCode"
#define RET_DESC_NAME               @"Message"
#define DETAIL_RET_DESC_NAME    @"description"


//-------------------------------------------communication----------------------------------------
#define COMMUNICATION_GROUP_BRIEF_VIEW_HEIGHT   78
#define COMMUNICATION_GROUP_BRIEF_VIEW_HEIGHT_BK   76
#define COMMUNICATION_GROUP_BRIEF_VIEW_BOTTOM_HEIGHT   0.5


#define SYSTEM_STATUS_BAR_HEIGHT   20


#define COMMUNICATE_PROPERTY_CELL_HEIGHT    45
#define COMMUNICATE_PROPERTY_CELL_FOOTER_HEIGHT    20

#define COMMUNICATION_MEMBER_HEADER_BRIEF_VIEW_MAX_COLUMN_COUNT 4
#define COMMUNICATION_MEMBER_HEADER_BRIEF_VIEW_WIDTH   60
#define COMMUNICATION_MEMBER_HEADER_BRIEF_VIEW_HEIGHT   (COMMUNICATION_MEMBER_HEADER_BRIEF_VIEW_WIDTH + 20)


#pragma mark - local user default storage
#define USER_ID_LOCAL_KEY               @"USER_ID_LOCAL_KEY"
#define USER_NAME_LOCAL_KEY             @"USER_NAME_LOCAL_KEY"
#define USER_EMAIL_LOCAL_KEY            @"USER_EMAIL_LOCAL_KEY"
#define USER_ACCESS_TOKEN_LOCAL_KEY     @"USER_ACCESS_TOKEN_LOCAL_KEY"
#define SYSTEM_LANGUAGE_LOCAL_KEY       @"SYSTEM_LANGUAGE_LOCAL_KEY"
#define USER_CITY_ID_LOCAL_KEY          @"USER_CITY_ID_LOCAL_KEY"
#define USER_CITY_NAME_LOCAL_KEY        @"USER_CITY_NAME_LOCAL_KEY"
#define USER_COUNTRY_ID_LOCAL_KEY       @"USER_COUNTRY_ID_LOCAL_KEY"
#define USER_COUNTRY_NAME_LOCAL_KEY     @"USER_COUNTRY_NAME_LOCAL_KEY"
#define FONT_SIZE_LOCAL_KEY             @"FONT_SIZE_LOCAL_KEY"
#define HOST_LOCAL_KEY                  @"HOST_LOCAL_KEY"
#define HOMEPAGE_HANDY_NOTIFY_LOCAL_KEY @"HOMEPAGE_HANDY_NOTIFY_LOCAL_KEY"
#define NEWS_FAV_HANDY_NOTIFY_LOCAL_KEY @"NEWS_FAV_HANDY_NOTIFY_LOCAL_KEY"
#define SWIPE_HANDY_NOTIFY_LOCAL_KEY    @"SWIPE_HANDY_NOTIFY_LOCAL_KEY"
#define LOADING_NOTIFY_LOCAL_KEY        @"LOADING_NOTIFY_LOCAL_KEY"




#define KEY_PROPERTY_CONTENT_TYPE_TITLE @"contentTitle"
#define KEY_PROPERTY_CONTENT_TYPE_VALUE @"contentVale"
#define KEY_PROPERTY_CONTENT_TYPE_TYPE  @"contentType"
#define KEY_PROPERTY_CONTENT_TYPE_SEL  @"contentSEL"
#define KEY_PROPERTY_CONTENT_TYPE_TARGET  @"contentTarget"



#define PROPERTY_TYPE_BUTTON    @"1"
#define PROPERTY_TYPE_TEXT      @"2"

#pragma mark - network
//  Publish
//#define HOST_TYPE                   12
//#define HOST_URL                    @"http://180.153.154.21:9000/"
//  Test
#define HOST_TYPE                   14
#define HOST_URL                    @"http://180.153.154.21:9007/"

//------------------------
#define APP_NAME                    @"Aladdin"
#define SINGLE_LOGIN_APP_NAME       @"Aladdin"
#define PLATFORM                    @"iPhone"
#define APP_ID                      @"Aladdin"

//1:default 2:gohigh 3:CIO



#if APP_TYPE == APP_TYPE_JIT

//GoHigh-AppKey
#define APP_KEY                     @"1141CF99-EACE-4368-8048-D86059698E78"

#elif APP_TYPE == APP_TYPE_GOHIGH

#define APP_KEY                     @"6450fd2c-57ce-11e3-a1a7-00163e0028ea"

#elif APP_TYPE == APP_TYPE_CIO
//CIO 联盟- AppKey
#define APP_KEY                     @"352e736a-4120-11e3-8165-ab3a22f97e8b"

#else

//测试服务器
#define APP_KEY                     @"1141CF99-EACE-4368-8048-D86059698E78"

#endif


#pragma mark - invoketype

#define INVOKETYPE_LOOKUSERINFO  1
#define INVOKETYPE_EDITUSERINFO  2
#define INVOKETYPE_SEARCHUSER    3
#define INVOKETYPE_SAVEUSERINFO  4
#define INVOKETYPE_ALLUSERINFO   5

#pragma mark - controlType

#define CONTROLTYPE_TEXT        1
#define CONTROLTYPE_MTEXT       2
#define CONTROLTYPE_DROPLIST    3
#define CONTROLTYPE_IMAGE       4

#pragma mark - imageType

#define IMAGETYPE_INFORMATION       1
#define IMAGETYPE_EVENT             2
#define IMAGETYPE_TRAIN             3
#define IMAGETYPE_PROJECT_THUMBNAIL 4
#define IMAGETYPE_PROJECT_ORIGINAL  5

#pragma mark - informationtype

#define INFORMATION_TYPE_NEWS_INFOTMATION        1
#define INFORMATION_TYPE_ALONE_MARKETING         2
#define INFORMATION_TYPE_BUSINESS                3
#define INFORMATION_TYPE_RECOMMEND_BOOK          4

#pragma mark - eventsType

#define EVENTS_TYPE_PRE  0 //预告
#define EVENTS_TYPE_REV  1 //回顾
#define EVENTS_TYPE_ALL  2 //全部


#define GROUP_PROPERTY_MAX_COUNT_NAME   20
#define GROUP_PROPERTY_MAX_COUNT_BRIEF  200
#define GROUP_PROPERTY_MAX_COUNT_PHONE 15
#define GROUP_PROPERTY_MAX_COUNT_EMAIL  20
#define GROUP_PROPERTY_MAX_COUNT_WEBSITE    20

#pragma MARK - categoryType

#define CATEGORY_TYPE_ALONE_MARKETING   2
#define CATEGORY_TYPE_BUSINESS          3

#define USE_ASIHTTP 0

#define ImageWithName(string) [UIImage imageNamed:string]

#define NUMBER(__OBJ) [NSNumber numberWithInt:__OBJ]
#define NUMBER_LONG(__OBJ) [NSNumber numberWithLong:__OBJ]
#define NUMBER_DOUBLE(__OBJ) [NSNumber numberWithDouble:__OBJ]



#define ORDER_TYPE_UNKNOWN   0
#define ORDER_TYPE_PAYING   1
#define ORDER_TYPE_RECEIVING   2
#define ORDER_TYPE_FINISHED   3


#define DISMISS_KEYBOARD_EVENT  @"dismissKeyboardEvent"

//门店搜索结果页面
#define ICON_WIDTH   15.f
#define ICON_HEIGHT  15.f

#define GOODS_PAGE_SIZE   15

typedef NS_ENUM(NSInteger, ALSlideDirection) {
    ALSlideDirectionUp    = 0,
    ALSlideDirectionDown  = 1,
};

typedef NS_ENUM(NSInteger, ALPriceIconState) {
    ALPriceIconStateNormal   = 0,
    ALPriceIconStateUp       = 1,
    ALPriceIconStateDown     = 2,
};


enum VIP_ORDER_TYPE {
    VIP_ORDER_TYPE_UNKNOWN=0,
    VIP_ORDER_TYPE_OBLIGATION=1,//待付款
    VIP_ORDER_TYPE_WAITING_GOODS=2,//待收货/提货
    VIP_ORDER_TYPE_FINISHED=3,//已完成
    
};

enum DELIVERY_TYPE {
    DELIVERY_TYPE_SEND = 1,//送货到家
    DELIVERY_TYPE_STORE = 2,//到店自提
};


enum LOGIN_TYPE {
    LOGIN_TYPE_UNKNOWN = -1,
    LOGIN_TYPE_MESSAGE_VERIFY = 0,
    LOGIN_TYPE_USER_NAME = 1,
};


enum ITEM_BUY_TYPE {
    ITEM_BUY_TYPE_RUSH_BUY = 1,
    ITEM_BUY_TYPE_ADD_TO_CART = 2,
};

typedef NS_ENUM (NSInteger, ALItemBuyType){
    ALItemBuyTypeRushBuy    = 1,
    ALItemBuyTypeAddToCart  = 2,
};

typedef NS_ENUM (NSInteger, AL_SHOPPING_CART_TYPE) {
    AL_SHOPPING_CART_TYPE_ITEM = 0,//商品
    AL_SHOPPING_CART_TYPE_PANIC = 1,//活动
};

typedef NS_ENUM (NSInteger, AL_REFRESH_ORDER_LIST_TYPE) {
    AL_REFRESH_ORDER_LIST_TYPE_UNKNOWN = 0,
    AL_REFRESH_ORDER_LIST_TYPE_ORDER = 1,
    AL_REFRESH_ORDER_LIST_TYPE_PAY = 2,
};

typedef NS_ENUM (NSInteger, AL_PUSH_TYPE){
    AL_PUSH_TYPE_FROM_UNKNOWN = 0,
    AL_PUSH_TYPE_FROM_MAIN_VC = 1,
    AL_PUSH_TYPE_FROM_SUB_VC = 2,
};


typedef NS_ENUM (NSInteger, AL_ORDER_TYPE) {
    AL_ORDER_TYPE_GOODS = 1, //商品订单
    AL_ORDER_TYPE_HOTEL = 2, //酒店订单
};

typedef NS_ENUM (NSInteger, AL_VERSION_TYPE) {
    AL_VERSION_TYPE_PRO = 1,    //正式环境
    AL_VERSION_TYPE_DEV = 2,    //开发环境
    AL_VERSION_TYPE_TEST1 = 3,   //测试环境 1
    AL_VERSION_TYPE_TEST2 = 4,   //测试环境 2
    AL_VERSION_TYPE_TEST3 = 5,   //测试环境 3
    AL_VERSION_TYPE_TEST4 = 6,   //测试环境 4
};

//-------支付方式id
#define PAYMENT_TYPE_ID_UNION_PAY_WAP       @"318529D4E4F24AEFBBE5B26191A3B584"
#define PAYMENT_TYPE_ID_UNION_PAY_AUDIO     @"7730ABEECF3048BE9E207D7E83C944AF"
#define PAYMENT_TYPE_ID_ALIPAY_WAP          @"541DF4A0DFF84015924E1C60C33FBA27"
#define PAYMENT_TYPE_ID_ALIPAY_OFFLINE      @"06047C678EC643DE80A5EA44A4CDADF6"

#define PAYMENT_TYPE_NAME_HUODAOFUKUAN      @"货到付款"


#define AL_PROTOCOL_LINK                    @"aldlinks"

#define AL_PROTOCOL_PRODUCT_DETAIL          @"product/detail"
#define AL_PROTOCOL_PRODUCT_LIST            @"product/list"

#define AL_PROTOCOL_PANIC_BUY               @"panicbuy"
#define AL_PROTOCOL_PANIC_BUYDETAIL         @"panicbuy/detail"
#define AL_PROTOCOL_GROUP_BUY               @"groupbuy"
#define AL_PROTOCOL_GROUP_BUYDETAIL         @"groupbuy/detail"
#define AL_PROTOCOL_NEW_BUY                 @"newbuy"
#define AL_PROTOCOL_NEW_BUYDETAIL           @"newbuy/detail"
#define AL_PROTOCOL_STORE_HOME              @"store/home"
#define AL_PROTOCOL_STORE_CATEGORY          @"store/category"
#define AL_PROTOCOL_STORE_PRODUCT_LIST      @"store/product/list"
#define AL_PROTOCOL_STORE_ALBUM_LIST        @"storealbum/list"


#define AL_SERVICE_HOTEL                    @"service/hotel"
#define AL_SERVICE_LIST                     @"service/list"
#define AL_SERVICE_STORE_HOME               @"service/store/home"
#define AL_SERVICE_STORE_PRODUCT_DETAIL     @"service/product/detail"

#define AL_STOREHOMEURL                     @"/HtmlApps/other/store/index.html?customerId=%@"


#endif
