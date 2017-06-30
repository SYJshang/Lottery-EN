//
//  SYJPlayerCell.h
//  MoxiNBA
//
//  Created by 尚勇杰 on 2017/6/16.
//  Copyright © 2017年 尚勇杰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SYJPlayerModel.h"

@interface SYJPlayerCell : UITableViewCell

@property (nonatomic, strong) UILabel *nameLab;
@property (nonatomic, strong) UILabel *birthDateLab;
//@property (nonatomic, strong) UILabel *positionLab;
@property (nonatomic, strong) UILabel *heightLab;
@property (nonatomic, strong) UILabel *rookieYearLab;
@property (nonatomic, strong) UILabel *uniformNumberLab;
//@property (nonatomic, strong) UILabel *lastYearLab;
@property (nonatomic, strong) UILabel *weightLab;
//@property (nonatomic, strong) UILabel *teamLab;
@property (nonatomic, strong) UILabel *statusLab;

@property (nonatomic, strong) SYJPlayerModel *model;

@end
