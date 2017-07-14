//
//  SYJPowerballCell.h
//  MoxiNBA
//
//  Created by 尚勇杰 on 2017/6/27.
//  Copyright © 2017年 尚勇杰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SYJAllModel.h"
#import "SYJAttIDModel.h"

@interface SYJPowerballCell : UITableViewCell

+ (instancetype)cellWithTableView: (UITableView *)tableView;


@property (nonatomic, strong) UILabel *nameLab;
@property (nonatomic, strong) UILabel *timeLab;
@property (nonatomic, strong) UILabel *firstLab;
@property (nonatomic, strong) UILabel *secondLab;
@property (nonatomic, strong) UILabel *thirdLab;
@property (nonatomic, strong) UILabel *fouthLab;
@property (nonatomic, strong) UILabel *fiveLab;
@property (nonatomic, strong) UILabel *sixLab;
@property (nonatomic, strong) UILabel *powerPlayLab;
@property (nonatomic, strong) UILabel *NextTimeLab;
@property (nonatomic, strong) UILabel *nextJackPot;

@property (nonatomic, strong) SYJAllModel *model;


@end
