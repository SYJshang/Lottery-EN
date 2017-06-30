//
//  WTHomeTableViewCell.m
//  inrtest
//
//  Created by zt on 2017/5/31.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import "WTHomeTableViewCell.h"

@interface WTHomeTableViewCell()

@property (nonatomic, strong) UILabel *timeLab;
@property (nonatomic, strong) UILabel *addressLab;
@property (nonatomic, strong) UILabel *temLab;

@end

@implementation WTHomeTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *cellId = @"WTHomeTableViewCell";
    WTHomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[WTHomeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ( self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        UILabel *timeLab = [[UILabel alloc]init];
        timeLab.textColor = [UIColor darkGrayColor];
        timeLab.font = fontSize(scaleWithSize(15));
        [self.contentView addSubview:timeLab];
        self.timeLab = timeLab;
        
        UILabel *addressLab = [[UILabel alloc]init];
        addressLab.font = fontSize(scaleWithSize(18));
        addressLab.textColor = TextColor;
        [self.contentView addSubview:addressLab];
        self.addressLab = addressLab;
        
        UILabel *temLab = [[UILabel alloc]init];
        temLab.font = fontSize(scaleWithSize(22));
        temLab.textColor = [UIColor darkGrayColor];
        [self.contentView addSubview:temLab];
        self.temLab = temLab;
        
        [addressLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(scaleWithSize(16));
            make.centerY.mas_equalTo(self.contentView.mas_centerY);
            make.width.mas_lessThanOrEqualTo(scaleWithSize(150));
        }];
        
        [temLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(scaleWithSize(-16));
            make.centerY.mas_equalTo(self.contentView.mas_centerY);
            make.width.mas_lessThanOrEqualTo(scaleWithSize(200));
        }];
        
        [timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(addressLab.mas_right).offset(scaleWithSize(16));
            make.centerY.mas_equalTo(self.contentView.mas_centerY);
            make.width.mas_lessThanOrEqualTo(scaleWithSize(150));
        }];
    }
    return self;
}

- (void)setModel:(WTMainModel *)model{
    _model = model;
    
    self.temLab.text = [NSString stringWithFormat:@"%0.1f°F", [self turnToFahrenheit: _model.temp]];
    self.addressLab.text = self.name;
    
    NSDate *dateNow = [NSDate new];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:dateNow];
    
    NSInteger hour =  [dateComponent hour];
    NSInteger minute =  [dateComponent minute];
    if (hour < 10 && minute < 10) {
        self.timeLab.text = [NSString stringWithFormat:@"0%d:0%d", hour, minute];
    }else if (hour < 10 && minute >= 10){
        self.timeLab.text = [NSString stringWithFormat:@"0%d:%d", hour, minute];
    }else{
        self.timeLab.text = [NSString stringWithFormat:@"%d:0%d", hour, minute];
    }
    
}

- (CGFloat)turnToFahrenheit: (CGFloat)Kelvin{
    
    CGFloat Fahrenheit = (Kelvin - 273.15) * 9/5 +32;
    return Fahrenheit;
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
