//
//  ITTieZiHeaderView.m
//  inrtest
//
//  Created by 张涛 on 2017/5/12.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import "ITTieZiHeaderView.h"

@interface ITTieZiHeaderView()

@property (nonatomic, strong) UILabel *titleLab;
@property (nonatomic, strong) UILabel *timeLab;
@property (nonatomic, strong) UILabel *nameLab;
@property (nonatomic, strong) UILabel *contentLab;
@property (nonatomic, strong) UIImageView *portrait;

@end

@implementation ITTieZiHeaderView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        self.frame = frame;
        
        UILabel *nameLab = [[UILabel alloc]init];
        nameLab.font = fontSize(scaleWithSize(14));
        [self addSubview:nameLab];
        self.nameLab = nameLab;
        
        UILabel *timeLab = [[UILabel alloc]init];
        timeLab.font = fontSize(scaleWithSize(14));
        timeLab.textColor = Color(73, 73, 73, 1);
        [self addSubview:timeLab];
        self.timeLab = timeLab;
        
        UIImageView *portrait = [[UIImageView alloc]init];
        portrait.contentMode = UIViewContentModeScaleToFill;
        portrait.layer.cornerRadius = scaleWithSize(22.5);
        [self addSubview:portrait];
        self.portrait = portrait;
        
        UILabel *contentLab = [[UILabel alloc]init];
        contentLab.font = fontSize(scaleWithSize(16));
        contentLab.numberOfLines = 0;
        _contentLab.lineBreakMode = UILineBreakModeWordWrap;
        [self addSubview:contentLab];
        self.contentLab = contentLab;
        
        UIView *line = [[UIView alloc]init];
        line.backgroundColor = Color(200, 199, 204, 1);
        [self addSubview:line];
        
        [_portrait mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(scaleWithSize(16));
            make.top.mas_equalTo(scaleWithSize(10));
            make.size.mas_equalTo(CGSizeMake(scaleWithSize(45), scaleWithSize(45)));
        }];
        
        [_nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_portrait.mas_right).offset(scaleWithSize(10));
            make.top.equalTo(_portrait.mas_top);
            make.width.mas_lessThanOrEqualTo(scaleWithSize(150));
        }];
        
        [_timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_nameLab.mas_left);
            make.bottom.equalTo(_portrait.mas_bottom);
            make.width.mas_lessThanOrEqualTo(scaleWithSize(150));
        }];
        
        [_contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_portrait.mas_left);
            make.top.mas_equalTo(_portrait.mas_bottom).offset(scaleWithSize(16));
            make.right.mas_equalTo(scaleWithSize(-16));
            make.bottom.mas_equalTo(line.mas_top).offset(scaleWithSize(-16));
        }];
        
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@0);
            make.right.equalTo(@0);
            make.height.mas_equalTo(1);
            make.bottom.equalTo(self.mas_bottom);
        }];
        
    }
    return self;
    
}

- (void)setModel:(ITTieZiModel *)model{
    _model = model;
    _nameLab.text = _model.username;
    _timeLab.text = _model.strcreatetime;
    _contentLab.text = _model.content;
    
    CGSize size = CGSizeMake(_contentLab.frame.size.width, 1000);
    
    UIFont *font = [UIFont fontWithName:@"Arial" size:scaleWithSize(16)];
//    CGSize size = CGSizeMake(320,2000);
//    CGSize labelsize = [_model.content sizeWithFont:font constrainedToSize:size lineBreakMode:UILineBreakModeWordWrap];
    
    CGSize labelsize = [_model.content boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin  attributes:@{NSFontAttributeName: font} context:nil].size;
    
    if ([self.delegate respondsToSelector:@selector(setContentHeight:)]) {
        [self.delegate setContentHeight:labelsize.height + scaleWithSize(25)];
    }
    
    if ([_imgPath isEqual: [NSNull null]]) {
        self.portrait.image = [UIImage imageNamed:@"头像"];
    }else{

        [self.portrait sd_setImageWithURL:[NSURL URLWithString:self.imgPath] placeholderImage:[UIImage imageNamed:@"头像"]];
    
    
    }
    
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
