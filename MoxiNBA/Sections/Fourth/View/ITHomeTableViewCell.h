//
//  ITHomeTableViewCell.h
//  inrtest
//
//  Created by 张涛 on 2017/5/6.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ITHomeTableViewCell : UITableViewCell

+ (instancetype)cellWithTableView: (UITableView *)tableView;

@property (nonatomic, strong) UIImageView *iconImage;
@property (nonatomic, strong) UILabel *titleLab;

@end
