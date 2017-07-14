//
//  SYJHeaderCell.h
//  MoxiNBA
//
//  Created by 尚勇杰 on 2017/6/26.
//  Copyright © 2017年 尚勇杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SYJHeaderCell : UITableViewCell

+ (instancetype)cellWithTableView: (UITableView *)tableView;

@property (nonatomic, strong) UIImageView *iconImg;
@property (nonatomic, strong) UILabel *userName;
//@property (nonatomic, strong) UILabel *;

@end
