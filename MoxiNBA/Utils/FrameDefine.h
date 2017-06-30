//
//  FrameDefine.h
//  Bank_IOS_Test
//
//  Created by carlos on 12-11-11.
//  Copyright (c) 2012年 carlos. All rights reserved.
//UI坐标

#ifndef Bank_IOS_Test_FrameDefine_h
#define Bank_IOS_Test_FrameDefine_h

#define k_frame_base_width [[UIScreen mainScreen]bounds].size.width
#define k_frame_base_height [[UIScreen mainScreen]bounds].size.height
#define k_frame_head_height  20
#define k_frame_navigation_bar_height 44
#define k_frame_tabbar_height 49

//除去底部tablview和导航栏的高度
#define k_frame_with_out_bar_tabbar_head  k_frame_base_height - k_frame_tabbar_height - k_frame_head_height- k_frame_navigation_bar_height

//列表
#define K_table_view_frame   CGRectMake(0, topBarHeight+43, 320, (([Utils isIphone5]&&IOSVersion <= 7.0) ? k_frame_base_height-160 : k_frame_base_height-140))


//列表元素
#define cell_image_frame            CGRectMake(10, 5, 83, 70)               //图片
#define cell_title_frame            CGRectMake(101, 5, 180, 20)             //主标题
#define cell_subTitle_frame         CGRectMake(101, 22, 250-72, 25)         //描述
#define cell_time_frame             CGRectMake(101, 55+5, 300-72, 15)       //时间，等

#define cell_collect_button_frame   CGRectMake(300-48,40, 30, 30)       //收藏按钮
#define cell_share_button_frame     CGRectMake(300-80,40, 30, 30)       //分享按钮
#define cell_download_button_frame  CGRectMake(300-15,40, 30, 30)       //下载按钮


//日期、热度、周排行 相对位置
#define K_segCtrl_background_view_frame         CGRectMake(0, (IOSVersion >= 7.0 ? k_frame_base_height-30 : k_frame_base_height-50), 320, 30)

#define K_segmented_control_relative_frame      CGRectMake(320/2-180/2, 2, 180, 20)



//....颜色值.....
#define k_cell_title_color      [UIColor colorWithRed:0x53/255.0f green:0x2f/255.0f blue:0x2f/255.0f alpha:1.0]

#define k_carVideo_base_orangeColor  [UIColor colorWithRed:255/255.0 green:162/255.0 blue:0/255.0 alpha:1.0]

#define k_right_side_background_color   [UIColor colorWithRed:0xf4/55.0 green:0xde/255.0 blue:0xae/255.0 alpha:1.0]

#endif
