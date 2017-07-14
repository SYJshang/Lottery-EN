//
//  WTWeatherHeaderView.m
//  inrtest
//
//  Created by zt on 2017/5/31.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import "WTWeatherHeaderView.h"
#import "WTMainModel.h"
#import "WTWeatherModel.h"

@interface WTWeatherHeaderView()

@property (nonatomic, strong) UILabel *dateLab;
@property (nonatomic, strong) UILabel *interval;
@property (nonatomic, strong) UILabel *cityLab;
@property (nonatomic, strong) UILabel *weatherLab;
@property (nonatomic, strong) UILabel *temLab;
@property (nonatomic, strong) UIImageView *weatherImg;

@end

@implementation WTWeatherHeaderView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
//        self.backgroundColor = Gray;
        
        UILabel *dateLab = [[UILabel alloc]init];
        dateLab.font = fontSize(scaleWithSize(14));
        dateLab.textColor = TextColor;
        dateLab.text = @"today";
        [self addSubview:dateLab];
        
        
        UILabel *interval = [[UILabel alloc]init];
        interval.font = fontSize(scaleWithSize(16));
        interval.textColor = TextColor;
        [self addSubview:interval];
        self.interval = interval;
        
        UILabel *cityLab = [[UILabel alloc]init];
        cityLab.font = fontSize(scaleWithSize(18));
        cityLab.textColor = TextColor;
        [self addSubview:cityLab];
        self.cityLab = cityLab;
        
        UILabel *weatherLab = [[UILabel alloc]init];
        weatherLab.font = fontSize(scaleWithSize(16));
        weatherLab.textColor = TextColor;
        [self addSubview:weatherLab];
        self.weatherLab = weatherLab;
        
        UILabel *temLab = [[UILabel alloc]init];
        temLab.font = fontSize(scaleWithSize(25));
        temLab.textColor = TextColor;
        [self addSubview:temLab];
        self.temLab = temLab;
        
        UIImageView *weatherImg = [[UIImageView alloc]init];
        weatherImg.contentMode = UIViewContentModeScaleToFill;
//        weatherImg.image = [UIImage imageNamed:@"clouds"];
        [self addSubview:weatherImg];
        self.weatherImg = weatherImg;
        
        [dateLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(scaleWithSize(16));
            make.top.mas_equalTo(scaleWithSize(scaleWithSize(10)));
            make.width.mas_lessThanOrEqualTo(scaleWithSize(100));
        }];
        
        [interval mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(scaleWithSize(-16));
            make.top.mas_equalTo(scaleWithSize(scaleWithSize(10)));
            make.width.mas_lessThanOrEqualTo(scaleWithSize(200));
        }];
        
        [cityLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.mas_centerX);
            make.top.mas_equalTo(interval.mas_bottom).offset(scaleWithSize(10));
            make.width.mas_lessThanOrEqualTo(scaleWithSize(200));
        }];
        
        [weatherLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.mas_centerX);
            make.top.mas_equalTo(cityLab.mas_bottom).offset(scaleWithSize(10));
            make.width.mas_lessThanOrEqualTo(scaleWithSize(200));
        }];
        
        [weatherImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.mas_centerX);
            make.top.mas_equalTo(weatherLab.mas_bottom).offset(scaleWithSize(30));
            make.size.mas_equalTo(CGSizeMake(scaleWithSize(168), scaleWithSize(168)));
        }];
        
        [temLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.mas_centerX);
            make.top.mas_equalTo(weatherLab.mas_bottom).offset(scaleWithSize(10));
            make.width.mas_lessThanOrEqualTo(scaleWithSize(200));
        }];
        
    }
    
    return self;
    
}

- (void)setDic:(NSDictionary *)dic{
    _dic = dic;
    
    WTMainModel *model = _dic[@"main"];
    WTWeatherModel *Wmodel = _dic[@"weather"];
    
    self.interval.text = [NSString stringWithFormat:@"%0.1f°F ~ %0.1f°F", model.temp_min, model.temp_max];
    self.cityLab.text = _dic[@"city"];
    self.weatherLab.text = Wmodel.detail;
    self.temLab.text = [NSString stringWithFormat:@"%0.1f°F", model.temp];
    self.weatherImg.image = [self setWeatherImage:Wmodel.main];
}

- (UIImage *)setWeatherImage: (NSString *)weather{
    NSArray *arr = @[@"Clouds", @"Rian", @"Clear", @"Snow"];
    UIImage *image;
    switch ([arr indexOfObject:weather]) {
        case 0:
            image = [UIImage imageNamed:@"clouds"];
            break;
        case 1:
            image = [UIImage imageNamed:@"rian"];
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

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
