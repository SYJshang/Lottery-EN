//
//  ITMatchDetailTableViewCell.h
//  inrtest
//
//  Created by 张涛 on 2017/5/4.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ITBasketBallModel.h"
#import "ITFootBallModel.h"

@interface ITMatchDetailTableViewCell : UITableViewCell

+ (instancetype)cellWithTableView: (UITableView *)tableView;

@property (nonatomic, strong)ITFootBallModel *model;

@property (nonatomic, strong)ITBasketBallModel *basketModel;

@end
