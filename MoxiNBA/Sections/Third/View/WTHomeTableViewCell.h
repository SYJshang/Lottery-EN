//
//  WTHomeTableViewCell.h
//  inrtest
//
//  Created by zt on 2017/5/31.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WTMainModel.h"

@interface WTHomeTableViewCell : UITableViewCell

+ (instancetype)cellWithTableView: (UITableView *)tableView;

@property (nonatomic, strong) WTMainModel *model;

@property (nonatomic, strong) NSString *name;

@end
