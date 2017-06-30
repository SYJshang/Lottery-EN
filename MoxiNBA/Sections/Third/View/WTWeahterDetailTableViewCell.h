//
//  WTWeahterDetailTableViewCell.h
//  inrtest
//
//  Created by zt on 2017/6/1.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WTWeahterDetailTableViewCell : UITableViewCell

+ (instancetype)cellWithTableView: (UITableView *) tableView;

@property (nonatomic, strong) NSDictionary *dic;

@end
