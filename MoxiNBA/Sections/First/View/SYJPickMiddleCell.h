//
//  SYJPickMiddleCell.h
//  MoxiNBA
//
//  Created by 尚勇杰 on 2017/6/28.
//  Copyright © 2017年 尚勇杰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SYJDetailPowerModel.h"

@interface SYJPickMiddleCell : UITableViewCell

+ (instancetype)cellWithTableView: (UITableView *)tableView;


@property (nonatomic, strong) UILabel *nameLab;
@property (nonatomic, strong) UILabel *timeLab;
@property (nonatomic, strong) UILabel *firstLab;
@property (nonatomic, strong) UILabel *secondLab;
@property (nonatomic, strong) UILabel *thirdLab;
//@property (nonatomic, strong) UILabel *powerPlayLab;
//@property (nonatomic, strong) UILabel *nextJackPot;

@property (nonatomic, strong) SYJDetailPowerModel *model;


@end
