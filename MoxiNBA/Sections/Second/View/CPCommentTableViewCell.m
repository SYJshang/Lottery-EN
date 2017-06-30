//
//  CPCommentTableViewCell.m
//  inrtest
//
//  Created by 张涛 on 2017/5/10.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import "CPCommentTableViewCell.h"

@interface CPCommentTableViewCell()

@property (nonatomic, strong) UILabel *nameLab;
@property (nonatomic, strong) UILabel *timeLab;
@property (nonatomic, strong) UILabel *contentLab;
@property (nonatomic, strong) UIView *line;

@end

@implementation CPCommentTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *cellId = @"CPCommentTableViewCell";
    CPCommentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[CPCommentTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;

        
        UILabel *nameLab = [[UILabel alloc]init];
        nameLab.font = fontSize(scaleWithSize(16));
        nameLab.textColor = Color(0, 0, 0, 1);
        [self.contentView addSubview:nameLab];
        self.nameLab = nameLab;
        
        UILabel *timeLab = [[UILabel alloc]init];
        timeLab.font = fontSize(scaleWithSize(16));
        timeLab.textColor = Color(93, 93, 93, 1);
        timeLab.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:timeLab];
        self.timeLab = timeLab;
        
        UILabel *contentLab = [[UILabel alloc]init];
        contentLab.font = fontSize(scaleWithSize(16));
        contentLab.textColor = Color(73, 73, 73, 1);
        contentLab.numberOfLines = 0;
        [self.contentView addSubview:contentLab];
        self.contentLab = contentLab;
        
        UIView *line = [[UIView alloc]init];
        line.backgroundColor = Color(213, 213, 213, 0.6);
        [self.contentView addSubview:line];
        self.line = line;
        
        [self layoutViews];
    }
    return self;
}

- (void)layoutViews {
//    
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(scaleWithSize(16));
        make.top.mas_equalTo(scaleWithSize(14));
        make.width.lessThanOrEqualTo(@150);
    }];
//
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).offset(scaleWithSize(-16));
        make.top.mas_equalTo(scaleWithSize(14));
        make.width.lessThanOrEqualTo(@200);
    }];
    //
    [self.contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(scaleWithSize(16));
        make.top.mas_equalTo(self.nameLab.mas_bottom).offset(scaleWithSize(10));
        make.right.mas_equalTo(scaleWithSize(-16));
        make.bottom.equalTo(self.line.mas_top).offset(scaleWithSize(-10));
    }];
    //
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLab.mas_left);
        make.right.equalTo(self.contentView);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-0.5f);
        make.height.equalTo(@0.5f);
    }];
    
}

- (void)setModel:(CPCommentModel *)model{
    _model = model;
    self.contentLab.text = _model.content;
    self.nameLab.text = _model.username;
    self.timeLab.text = _model.strcreatetime;
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
