//
//  SYJListCell.h
//  MoxiNBA
//
//  Created by 尚勇杰 on 2017/7/10.
//  Copyright © 2017年 尚勇杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SYJListCell : UITableViewCell

@property (nonatomic, strong) UIImageView *iconImg;
@property (nonatomic, strong) UILabel *nameLab;

+ (instancetype)cellWithTableView: (UITableView *)tableView;

@end
