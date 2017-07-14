//
//  WTWeahterDetailTableViewCell.m
//  inrtest
//
//  Created by zt on 2017/6/1.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import "WTWeahterDetailTableViewCell.h"
#import "WTMainModel.h"
#import "WTWeatherModel.h"
#import "WTTempModel.h"

@interface WTWeahterDetailTableViewCell()

@property (nonatomic, strong) UILabel *dateLab;
@property (nonatomic, strong) UIImageView *weatherImg;
@property (nonatomic, strong) UILabel *tempMin;
@property (nonatomic, strong) UILabel *tempMax;

@end

@implementation WTWeahterDetailTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *cellId= @"WTWeahterDetailTableViewCell";
    WTWeahterDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[WTWeahterDetailTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        UILabel *dateLab = [[UILabel alloc]init];
        dateLab.textColor = [UIColor darkGrayColor];
        dateLab.font = fontSize(scaleWithSize(16));
        [self.contentView addSubview:dateLab];
        self.dateLab = dateLab;
        
        UIImageView *weatherImg = [[UIImageView alloc]init];
        weatherImg.contentMode = UIViewContentModeScaleToFill;
        [self.contentView addSubview:weatherImg];
        self.weatherImg = weatherImg;
        
        UILabel *tempMin = [[UILabel alloc]init];
        tempMin.textColor = [UIColor darkGrayColor];
        tempMin.font = fontSize(scaleWithSize(16));
        [self.contentView addSubview:tempMin];
        self.tempMin = tempMin;
        
        UILabel *tempMax = [[UILabel alloc]init];
        tempMax.textColor = [UIColor darkGrayColor];
        tempMax.font = fontSize(scaleWithSize(16));
        [self.contentView addSubview:tempMax];
        self.tempMax = tempMax;
        
        [dateLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(scaleWithSize(16));
            make.centerY.mas_equalTo(self.contentView.mas_centerY);
            make.width.mas_lessThanOrEqualTo(scaleWithSize(150));
        }];
        
        [weatherImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.contentView.mas_centerX);
            make.centerY.mas_equalTo(self.contentView.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(scaleWithSize(32), 32));
        }];
        
        [tempMax mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(scaleWithSize(-16));
            make.centerY.mas_equalTo(self.contentView.mas_centerY);
            make.width.mas_lessThanOrEqualTo(scaleWithSize(150));
        }];
        
        [tempMin mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(tempMax.mas_left).offset(scaleWithSize(-15));
            make.centerY.mas_equalTo(self.contentView.mas_centerY);
            make.width.mas_lessThanOrEqualTo(scaleWithSize(150));
        }];
        
    }
    return self;
}

- (void)setDic:(NSDictionary *)dic{
    _dic = dic;
    
    WTTempModel *model = _dic[@"temp"];
    WTWeatherModel *Wmodel = _dic[@"weather"];
    
    self.dateLab.text = _dic[@"weekday"];
    self.tempMax.text = [NSString stringWithFormat:@"%0.1f", model.max];
    self.tempMin.text = [NSString stringWithFormat:@"%0.1f", model.min];
    self.weatherImg.image = [self setWeatherImage:Wmodel.main];
}

- (UIImage *)setWeatherImage: (NSString *)weather{
    NSArray *arr = @[@"Clouds", @"Rain", @"Clear", @"Snow"];
    UIImage *image;
    switch ([arr indexOfObject:weather]) {
        case 0:
            image = [UIImage imageNamed:@"clouds"];
            break;
        case 1:
            image = [UIImage imageNamed:@"rain"];
            break;
        case 2:
            image = [UIImage imageNamed:@"sun"];
            break;
        case 3:
            image = [UIImage imageNamed:@"clouds"];
            break;
            
        default:
            break;
    }
    return image;
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
