//
//  SYJTitleCell.h
//  MoxiNBA
//
//  Created by 尚勇杰 on 2017/6/26.
//  Copyright © 2017年 尚勇杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SYJTitleCell : UITableViewCell

@property (nonatomic, strong) UIImageView *icon;
@property (nonatomic, strong) UILabel *nameLab;

+ (instancetype)cellWithTableView: (UITableView *)tableView;


@end
