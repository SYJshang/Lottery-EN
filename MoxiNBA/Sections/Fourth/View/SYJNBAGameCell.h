//
//  SYJNBAGameCell.h
//  MoxiNBA
//
//  Created by 尚勇杰 on 2017/6/15.
//  Copyright © 2017年 尚勇杰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SYJGameModel.h"
#import "SYJScoreModel.h"

@interface SYJNBAGameCell : UITableViewCell

@property (nonatomic, strong) UIImageView *homeIcon;
@property (nonatomic, strong) UIImageView *otherIcon;
@property (nonatomic, strong) UILabel     *sorLab;
@property (nonatomic, strong) UILabel     *time;
@property (nonatomic, strong) UILabel     *homeName;
@property (nonatomic, strong) UILabel     *otherName;

@property (nonatomic, strong) SYJGameModel *model;

@end
