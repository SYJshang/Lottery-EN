//
//  YJCache.h
//  全球向导
//
//  Created by SYJ on 2016/12/5.
//  Copyright © 2016年 尚勇杰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YJCache : NSObject


//获取大小（Mb）
+ ( float )filePath;
//1:首先我们计算一下 单个文件的大小
+ ( long long ) fileSizeAtPath:( NSString *) filePath;

//2:遍历文件夹获得文件夹大小，返回多少 M（提示：你可以在工程界设置（)m）

+ ( float ) folderSizeAtPath:( NSString *) folderPath;

// 清理缓存
+ (void)clearFile;


@end
