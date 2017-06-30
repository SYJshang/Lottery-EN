//
//  ITHomeTableViewCell.m
//  inrtest
//
//  Created by 张涛 on 2017/5/6.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import "ITHomeTableViewCell.h"

@interface ITHomeTableViewCell()

@end

@implementation ITHomeTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *cellId = @"ITHomeTableViewCell";
    ITHomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[ITHomeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        UIImageView *iconImage = [[UIImageView alloc]init];
        iconImage.contentMode = UIViewContentModeScaleToFill;
        [self.contentView addSubview:iconImage];
        _iconImage = iconImage;
        
        UILabel *titleLab = [[UILabel alloc]init];
        titleLab.font = fontSize(scaleWithSize(18));
        [self.contentView addSubview:titleLab];
        _titleLab = titleLab;
        
        [iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(scaleWithSize(16));
            make.centerY.mas_equalTo(self.contentView.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(scaleWithSize(50), scaleWithSize(50)));

        }];
        
        [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(iconImage.mas_right).offset(scaleWithSize(16));
            make.centerY.mas_equalTo(self.contentView.mas_centerY);
            make.width.mas_lessThanOrEqualTo(150);
        }];
        
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
