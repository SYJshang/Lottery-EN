//
//  ITJiLuTableViewCell.h
//  inrtest
//
//  Created by 张涛 on 2017/4/18.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ITJiLuTableViewCell : UITableViewCell

+ (instancetype)cellWithTableView: (UITableView *)tableView;

@property (nonatomic, assign) CLLocationDistance distance;
@property (nonatomic, strong) NSDictionary *dic;

@property (nonatomic, strong) MKMapItem *item;

@end
