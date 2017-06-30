//
//  CPInfoHeaderView.m
//  彩票2
//
//  Created by 张涛 on 2017/4/14.
//  Copyright © 2017年 1. All rights reserved.
//

#import "CPInfoHeaderView.h"

@interface CPInfoHeaderView()

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIImageView *headImg;
@property (nonatomic, strong) UILabel *nameLab;
@property (nonatomic, strong) UIView *line;
@property (nonatomic, strong) UILabel *textLab;

@end

@implementation CPInfoHeaderView

    
- (instancetype)initWithFrame:(CGRect)frame
    {
        self = [super initWithFrame:frame];
        if (self) {
            
        }
        return self;
    }
    
- (instancetype)initWithHeader:(CGRect)frame{
    if (self = [super init]) {
        
        self.frame = frame;
        
        UIView *bgView = [[UIView alloc]initWithFrame:frame];
        [self addSubview:bgView];
        self.bgView = bgView;
        
        UIImageView *headImg = [[UIImageView alloc]init];        
        headImg.contentMode = UIViewContentModeScaleAspectFill;
        headImg.layer.cornerRadius = scaleWithSize(40);
        headImg.layer.masksToBounds = YES;
        [bgView addSubview:headImg];
        self.headImg = headImg;
        
        UILabel *nameLab = [[UILabel alloc]init];
        nameLab.font = fontSize(scaleWithSize(18));
        if ([[gobalConfig getInstance]IsLogin]) {
            
            nameLab.text=[[gobalConfig getInstance]userName];
        }else{
            
            nameLab.text = @"点击登录";
        }
        [bgView addSubview:nameLab];
        self.nameLab = nameLab;
        
        UIView *line = [[UIView alloc]init];
        line.backgroundColor = [UIColor blackColor];//Color(200, 199, 204, 1);
        [bgView addSubview:line];
        self.line = line;
        
        UILabel *textLab = [[UILabel alloc]init];
        textLab.text = @"Click to change Info";
        textLab.font = fontSize(scaleWithSize(16));
        [bgView addSubview:textLab];
        self.textLab = textLab;
        
        [self layoutView];
        
    }
    return self;
}
    
- (void)layoutView{
    
    [self.headImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(scaleWithSize(16));
        make.centerY.mas_equalTo(self.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(scaleWithSize(80), scaleWithSize(80)));
    }];
    
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.headImg.mas_right).offset(scaleWithSize(10));
        make.bottom.mas_equalTo(self.headImg.mas_centerY).offset(scaleWithSize(-10));
        make.width.mas_lessThanOrEqualTo(150);
    }];
    
    [self.textLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.nameLab.mas_left);
        make.top.mas_equalTo(self.headImg.mas_centerY).offset(scaleWithSize(10));
        make.width.mas_lessThanOrEqualTo(scaleWithSize(150));
    }];
    
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@0);
        make.bottom.mas_equalTo(self.bgView.mas_bottom);
        make.size.mas_equalTo(CGSizeMake(screen_width, 1));
    }];

}
    
- (void) setModel:(CPUserInfoModel *)model{
    _model = model;
    
    self.nameLab.text = _model.username;
    
    [self.headImg sd_setImageWithURL:[NSURL URLWithString:_model.imgpath] placeholderImage:[UIImage imageNamed:@"morentouxiang"]];
//    self.headImg.backgroundColor = [UIColor redColor];
}
    
//- (void)layoutHeaderViewForScrollViewOffset:(CGPoint)offset{
//    [self.bgHeaderView layoutHeaderViewForScrollViewOffset:offset];
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
