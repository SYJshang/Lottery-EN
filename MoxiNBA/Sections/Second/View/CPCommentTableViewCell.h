//
//  CPCommentTableViewCell.h
//  inrtest
//
//  Created by 张涛 on 2017/5/10.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CPCommentModel.h"

@interface CPCommentTableViewCell : UITableViewCell

+ (instancetype)cellWithTableView: (UITableView *) tableView;

@property (nonatomic, strong) CPCommentModel *model;

@end
