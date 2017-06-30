//
//  ITInfoTableViewCell.h
//  inrtest
//
//  Created by 张涛 on 2017/5/4.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ITTeamInfoModel.h"

@interface ITInfoTableViewCell : UITableViewCell

+ (instancetype) cellWithTableView: (UITableView *) tableView;

@property (nonatomic, strong) ITTeamInfoModel *model;

@end
