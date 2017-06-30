//
//  ITInfoTableViewCell.m
//  inrtest
//
//  Created by 张涛 on 2017/5/4.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import "ITInfoTableViewCell.h"

@interface ITInfoTableViewCell()

@property (nonatomic, strong) UILabel *ranklab;
@property (nonatomic, strong) UILabel *namelab;
@property (nonatomic, strong) UILabel *matchesPlayedLab;
@property (nonatomic, strong) UILabel *winsLab;
@property (nonatomic, strong) UILabel *drawsLab;
@property (nonatomic, strong) UILabel *lossesLab;
@property (nonatomic, strong) UILabel *points;
@property (nonatomic, strong) UIView *line;

@end

@implementation ITInfoTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *cellID = @"ITInfoTableViewCell";
    ITInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[ITInfoTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        UILabel *rankLab = [[UILabel alloc]init];
        rankLab.textAlignment = NSTextAlignmentCenter;
        rankLab.font = fontSize(scaleWithSize(16));
        [self.contentView addSubview:rankLab];
        self.ranklab = rankLab;
        
        UILabel *namelab = [[UILabel alloc]init];
        namelab.textAlignment = NSTextAlignmentCenter;
        namelab.font = fontSize(scaleWithSize(16));
        [self.contentView addSubview:namelab];
        self.namelab = namelab;
        
        UILabel *matchesPlayedLab = [[UILabel alloc]init];
        matchesPlayedLab.textAlignment = NSTextAlignmentCenter;
        matchesPlayedLab.font = fontSize(scaleWithSize(16));
        [self.contentView addSubview:matchesPlayedLab];
        self.matchesPlayedLab = matchesPlayedLab;
        
        UILabel *winsLab = [[UILabel alloc]init];
        winsLab.textAlignment = NSTextAlignmentCenter;
        winsLab.font = fontSize(scaleWithSize(16));
        [self.contentView addSubview:winsLab];
        self.winsLab = winsLab;
        
        UILabel *drawsLab = [[UILabel alloc]init];
        drawsLab.textAlignment = NSTextAlignmentCenter;
        drawsLab.font = fontSize(scaleWithSize(16));
        [self.contentView addSubview:drawsLab];
        self.drawsLab = drawsLab;
        
        UILabel *lossesLab = [[UILabel alloc]init];
        lossesLab.textAlignment = NSTextAlignmentCenter;
        lossesLab.font = fontSize(scaleWithSize(16));
        [self.contentView addSubview:lossesLab];
        self.lossesLab = lossesLab;
        
        UILabel *points = [[UILabel alloc]init];
        points.textAlignment = NSTextAlignmentCenter;
        points.font = fontSize(scaleWithSize(16));
        [self.contentView addSubview:points];
        self.points = points;
        
        UIView *line = [[UIView alloc]init];
        line.backgroundColor = Color(213, 213, 213, 1);
        [self.contentView addSubview:line];
        self.line = line;
        
        [self layoutWithFrame];
    }
    return self;
}

- (void)layoutWithFrame {
    
    [self.ranklab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(scaleWithSize(16));
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.width.mas_equalTo(scaleWithSize(40));
    }];
    
    [self.namelab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.ranklab.mas_right);
        make.top.equalTo(self.ranklab.mas_top);
        make.width.mas_equalTo(scaleWithSize(100));
    }];
    
    [self.matchesPlayedLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.namelab.mas_right);
        make.top.equalTo(self.ranklab.mas_top);
        make.width.mas_equalTo(scaleWithSize(40));
    }];
    
    [self.winsLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.matchesPlayedLab.mas_right);
        make.top.equalTo(self.ranklab.mas_top);
        make.width.mas_equalTo(scaleWithSize(40));
    }];
    
    [self.drawsLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.winsLab.mas_right);
        make.top.equalTo(self.ranklab.mas_top);
        make.width.mas_equalTo(scaleWithSize(40));
    }];
    
    [self.lossesLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.drawsLab.mas_right);
        make.top.equalTo(self.ranklab.mas_top);
        make.width.mas_equalTo(scaleWithSize(40));
    }];
    
    [self.points mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.lossesLab.mas_right);
        make.top.equalTo(self.ranklab.mas_top);
        make.width.mas_equalTo(scaleWithSize(40));
    }];
    
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(scaleWithSize(16));
        make.bottom.equalTo(self.contentView.mas_bottom);
        make.size.mas_equalTo(CGSizeMake(screen_width - scaleWithSize(32), 1));
    }];
}

- (void)setModel:(ITTeamInfoModel *)model{
    _model = model;
    self.ranklab.text = [NSString stringWithFormat:@"%ld", (long)_model.rank];
    self.namelab.text = _model.team;
    self.matchesPlayedLab.text = [NSString stringWithFormat:@"%ld", (long)_model.matchesPlayed];
    self.winsLab.text = [NSString stringWithFormat:@"%ld", (long)_model.wins];
    self.drawsLab.text = [NSString stringWithFormat:@"%ld", (long)_model.draws];
    self.lossesLab.text = [NSString stringWithFormat:@"%ld", (long)_model.losses];
    self.points.text = [NSString stringWithFormat:@"%ld", (long)_model.points];
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
