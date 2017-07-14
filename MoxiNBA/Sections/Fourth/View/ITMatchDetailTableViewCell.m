//
//  ITMatchDetailTableViewCell.m
//  inrtest
//
//  Created by 张涛 on 2017/5/4.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import "ITMatchDetailTableViewCell.h"

@interface ITMatchDetailTableViewCell()

@property (nonatomic, strong) UILabel *teamA;
@property (nonatomic, strong) UILabel *teamB;
@property (nonatomic, strong) UILabel *matchOrder;
@property (nonatomic, strong) UIImageView *teamALogo;
@property (nonatomic, strong) UIImageView *teamBLogo;
@property (nonatomic, strong) UILabel *matchDay;
@property (nonatomic, strong) UILabel *statusDesc;
@property (nonatomic, strong) UILabel *goalLab;
@property (nonatomic, strong) UIView *line;

@end

@implementation ITMatchDetailTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *cellId = @"ITMatchDetailTableViewCell";
    ITMatchDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[ITMatchDetailTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        _teamA = [[UILabel alloc]init];
        _teamA.font = fontSize(scaleWithSize(18));
        [self.contentView addSubview:_teamA];
        
        _teamALogo = [[UIImageView alloc]init];
        _teamALogo.contentMode = UIViewContentModeScaleToFill;
        [self.contentView addSubview:_teamALogo];
        
        _teamBLogo = [[UIImageView alloc]init];
        _teamBLogo.contentMode = UIViewContentModeScaleToFill;
        [self.contentView addSubview:_teamBLogo];
        
        _teamB = [[UILabel alloc]init];
        _teamB.font = fontSize(scaleWithSize(18));
        [self.contentView addSubview:_teamB];
        
        _matchOrder = [[UILabel alloc]init];
        _matchOrder.textColor = Color(213, 213, 213, 1);
        _matchOrder.font = fontSize(scaleWithSize(16));
        [self.contentView addSubview:_matchOrder];
        
        _matchDay = [[UILabel alloc]init];
        _matchDay.textColor = Color(213, 213, 213, 1);
        _matchDay.font = fontSize(scaleWithSize(16));
        [self.contentView addSubview:_matchDay];
        
        _statusDesc = [[UILabel alloc]init];
        _statusDesc.font = fontSize(scaleWithSize(16));
        [self.contentView addSubview:_statusDesc];
        
        _goalLab = [[UILabel alloc]init];
        _goalLab.textColor = Color(250, 67, 67, 1);
        _goalLab.font = fontSize(scaleWithSize(18));
        [self.contentView addSubview:_goalLab];
        
        _line = [[UIView alloc]init];
        _line.backgroundColor = Color(213, 213, 213, 1);
        [self.contentView addSubview: _line];
        
        [self layoutFrame];
        
    }
    return self;
}

- (void)layoutFrame {
    
    [_matchOrder mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(scaleWithSize(16));
        make.top.mas_equalTo(scaleWithSize(5));
        make.width.mas_lessThanOrEqualTo(scaleWithSize(150));
    }];
    
    [_matchDay mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(scaleWithSize(-16));
        make.top.mas_equalTo(_matchOrder.mas_top);
        make.width.mas_lessThanOrEqualTo(scaleWithSize(150));
    }];
    
    [_teamA mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(scaleWithSize(30));
        make.top.mas_equalTo(_matchOrder.mas_bottom).offset(scaleWithSize(10));
        make.width.mas_lessThanOrEqualTo(scaleWithSize(100));
    }];
    
    [_teamB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(scaleWithSize(-30));
        make.top.mas_equalTo(_teamA.mas_top);
        make.width.mas_lessThanOrEqualTo(scaleWithSize(100));
    }];
    
    [_goalLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.contentView.mas_centerX);
        make.top.mas_equalTo(_teamA.mas_top);
        make.width.mas_lessThanOrEqualTo(scaleWithSize(100));
    }];
    
    [_statusDesc mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.contentView.mas_centerX);
        make.top.mas_equalTo(_goalLab.mas_bottom).offset(scaleWithSize(10));
        make.width.mas_lessThanOrEqualTo(scaleWithSize(100));
    }];
    
    [_teamALogo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_teamA.mas_centerX);
        make.top.equalTo(_teamA.mas_bottom).offset(scaleWithSize(10));
        make.size.mas_equalTo(CGSizeMake(scaleWithSize(40), scaleWithSize(40)));
    }];
    
    [_teamBLogo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_teamB.mas_centerX);
        make.top.equalTo(_teamB.mas_bottom).offset(scaleWithSize(10));
        make.size.mas_equalTo(CGSizeMake(scaleWithSize(40), scaleWithSize(40)));
    }];
    
    [_line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.bottom.equalTo(self.contentView.mas_bottom);
        make.size.mas_equalTo(CGSizeMake(screen_width, 1));
    }];
}
- (void)setModel:(ITFootBallModel *)model{
    _model = model;
    _teamA.text = _model.teamA;
    _teamB.text = _model.teamB;
    _matchOrder.text = _model.matchOrder;
    _matchDay.text = _model.matchDay;
    _goalLab.text = [NSString stringWithFormat:@"%@ : %@", _model.teamAGoal, _model.teamBGoal];
    [_teamALogo sd_setImageWithURL:[NSURL URLWithString:_model.teamALogo]];
    [_teamBLogo sd_setImageWithURL:[NSURL URLWithString:_model.teamBLogo]];
    _statusDesc.text = _model.statusDescNew;
}

- (void)setBasketModel:(ITBasketBallModel *)basketModel{
    _basketModel = basketModel;
    _teamA.text = _basketModel.hostName;
    _teamB.text = _basketModel.visitName;
    _matchOrder.text = _basketModel.matchOrder;
    _matchDay.text = _basketModel.matchDay;
    _goalLab.text = [NSString stringWithFormat:@"%@ : %@", _basketModel.hostGoal, _basketModel.visitGoal];
    [_teamALogo sd_setImageWithURL:[NSURL URLWithString:_basketModel.hostLogoUrl]];
    [_teamBLogo sd_setImageWithURL:[NSURL URLWithString:_basketModel.visitLogoUrl]];
    _statusDesc.text = _basketModel.statusDescNew;
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
