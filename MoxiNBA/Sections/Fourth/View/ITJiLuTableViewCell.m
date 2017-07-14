//
//  ITJiLuTableViewCell.m
//  inrtest
//
//  Created by 张涛 on 2017/4/18.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import "ITJiLuTableViewCell.h"

@interface ITJiLuTableViewCell()

@property (nonatomic, strong) UILabel *titleLab;
@property (nonatomic, strong) UILabel *addressLab;
@property (nonatomic, strong) UILabel *disstanceLab;

@end

@implementation ITJiLuTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *cellId = @"ITJiLuTableViewCell";
    ITJiLuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[ITJiLuTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    return  cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        UILabel *titleLab = [[UILabel alloc]init];
        titleLab.font = fontSize(scaleWithSize(18));
        [self.contentView addSubview:titleLab];
        self.titleLab = titleLab;
        
        UILabel *addressLab = [[UILabel alloc]init];
        addressLab.font = fontSize(scaleWithSize(16));
        addressLab.textColor = Color(154, 154, 154, 1);
        [self.contentView addSubview:addressLab];
        self.addressLab = addressLab;
        
        UILabel *disstanceLab = [[UILabel alloc]init];
        disstanceLab.font = fontSize(scaleWithSize(16));
        disstanceLab.textColor = Color(154, 154, 154, 1);
        [self.contentView addSubview:disstanceLab];
        self.disstanceLab = disstanceLab;
        
        UIView *line = [[UIView alloc]init];
        line.backgroundColor = Color(213, 213, 213, 0.6);
        [self.contentView addSubview:line];
        
        [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(scaleWithSize(16));
            make.top.mas_equalTo(scaleWithSize(5));
            make.width.mas_lessThanOrEqualTo(SCREEN_SIZE.width - scaleWithSize(116));
        }];
        
        [addressLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(scaleWithSize(16));
//            make.top.mas_equalTo(titleLab.mas_bottom).offset(scaleWithSize(10));
            make.bottom.mas_equalTo(scaleWithSize(-5));
            make.width.mas_lessThanOrEqualTo(SCREEN_SIZE.width);
        }];
        
        [disstanceLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.contentView.mas_right).offset(scaleWithSize(-16));
            make.top.mas_equalTo(titleLab.mas_top);
            make.width.mas_lessThanOrEqualTo(scaleWithSize(100));
        }];
        
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(scaleWithSize(16));
            make.size.mas_equalTo(CGSizeMake(SCREEN_SIZE.width - scaleWithSize(16), 1));
            make.bottom.mas_equalTo(self.contentView.mas_bottom);
        }];
        
    }
    return  self;
}

- (void)setItem:(MKMapItem *)item{
    _item = item;
    
    self.titleLab.text = _item.name;
    self.addressLab.text = [NSString stringWithFormat:@"%@ %@,%@ %@,%@",
                            _item.placemark.country,
                            _item.placemark.administrativeArea,
                            _item.placemark.locality,
                            _item.placemark.subLocality,
                            _item.placemark.thoroughfare];
    
}

- (NSString *)judgeDis: (CGFloat)distance {
    if (distance < 1) {
        NSString *distanceStr = [[NSString stringWithFormat:@"%f", _distance * 1000] substringToIndex:3];
        NSString *str = [NSString stringWithFormat:@"%@m", distanceStr];
        return str;
    }else{
        return @"1km以外";
    }
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
