//
//  SYJDetailCell.h
//  MoxiNBA
//
//  Created by 尚勇杰 on 2017/6/27.
//  Copyright © 2017年 尚勇杰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SYJMatchModel.h"

@interface SYJDetailCell : UITableViewCell

+ (instancetype)cellWithTableView: (UITableView *)tableView;


@property (nonatomic, strong) UILabel *name1Lab;
@property (nonatomic, strong) UILabel *name2Lab;
@property (nonatomic, strong) UILabel *name3Lab;

@property (nonatomic, strong) SYJMatchModel *model;


@end
