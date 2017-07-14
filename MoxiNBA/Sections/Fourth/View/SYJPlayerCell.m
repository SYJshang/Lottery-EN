//
//  SYJPlayerCell.m
//  MoxiNBA
//
//  Created by 尚勇杰 on 2017/6/16.
//  Copyright © 2017年 尚勇杰. All rights reserved.
//

#import "SYJPlayerCell.h"

@implementation SYJPlayerCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.nameLab = [[UILabel alloc]init];
        [self.contentView addSubview:self.nameLab];
        self.nameLab.textColor = TextColor;
        self.nameLab.textAlignment = NSTextAlignmentCenter;
        self.nameLab.font = [UIFont systemFontOfSize:8.0];
        self.nameLab.sd_layout.leftSpaceToView(self.contentView, 0).centerYEqualToView(self.contentView).heightIs(40).widthIs(KSceenW / 7);
        self.nameLab.layer.masksToBounds = YES;
        self.nameLab.layer.borderColor = Gray.CGColor;
        self.nameLab.layer.borderWidth = 0.5;
        
        
//        self.teamLab = [[UILabel alloc]init];
//        [self.contentView addSubview:self.teamLab];
//        self.teamLab.textColor = TextColor;
//        self.teamLab.textAlignment = NSTextAlignmentCenter;
//        self.teamLab.font = [UIFont systemFontOfSize:8.0];
//        self.teamLab.sd_layout.leftSpaceToView(self.nameLab, 0).centerYEqualToView(self.contentView).heightIs(40).widthIs(KSceenW / 10);
//        self.teamLab.layer.masksToBounds = YES;
//        self.teamLab.layer.borderColor = Gray.CGColor;
//        self.teamLab.layer.borderWidth = 0.5;
        
        
        self.heightLab = [[UILabel alloc]init];
        [self.contentView addSubview:self.heightLab];
        self.heightLab.textColor = TextColor;
        self.heightLab.textAlignment = NSTextAlignmentCenter;
        self.heightLab.font = [UIFont systemFontOfSize:8.0];
        self.heightLab.sd_layout.leftSpaceToView(self.nameLab, 0).centerYEqualToView(self.contentView).heightIs(40).widthIs(KSceenW / 7);
        self.heightLab.layer.masksToBounds = YES;
        self.heightLab.layer.borderColor = Gray.CGColor;
        self.heightLab.layer.borderWidth = 0.5;
        
        self.weightLab = [[UILabel alloc]init];
        [self.contentView addSubview:self.weightLab];
        self.weightLab.textColor = TextColor;
        self.weightLab.textAlignment = NSTextAlignmentCenter;
        self.weightLab.font = [UIFont systemFontOfSize:8.0];
        self.weightLab.sd_layout.leftSpaceToView(self.heightLab, 0).centerYEqualToView(self.contentView).heightIs(40).widthIs(KSceenW / 7);
        self.weightLab.layer.masksToBounds = YES;
        self.weightLab.layer.borderColor = Gray.CGColor;
        self.weightLab.layer.borderWidth = 0.5;
        
        self.uniformNumberLab = [[UILabel alloc]init];
        [self.contentView addSubview:self.uniformNumberLab];
        self.uniformNumberLab.textColor = TextColor;
        self.uniformNumberLab.textAlignment = NSTextAlignmentCenter;
        self.uniformNumberLab.font = [UIFont systemFontOfSize:8.0];
        self.uniformNumberLab.sd_layout.leftSpaceToView(self.weightLab, 0).centerYEqualToView(self.contentView).heightIs(40).widthIs(KSceenW / 7);
        self.uniformNumberLab.layer.masksToBounds = YES;
        self.uniformNumberLab.layer.borderColor = Gray.CGColor;
        self.uniformNumberLab.layer.borderWidth = 0.5;
        
        self.rookieYearLab = [[UILabel alloc]init];
        [self.contentView addSubview:self.rookieYearLab];
        self.rookieYearLab.textColor = TextColor;
        self.rookieYearLab.textAlignment = NSTextAlignmentCenter;
        self.rookieYearLab.font = [UIFont systemFontOfSize:8.0];
        self.rookieYearLab.sd_layout.leftSpaceToView(self.uniformNumberLab, 0).centerYEqualToView(self.contentView).heightIs(40).widthIs(KSceenW / 7);
        self.rookieYearLab.layer.masksToBounds = YES;
        self.rookieYearLab.layer.borderColor = Gray.CGColor;
        self.rookieYearLab.layer.borderWidth = 0.5;
        
//        self.lastYearLab = [[UILabel alloc]init];
//        [self.contentView addSubview:self.lastYearLab];
//        self.lastYearLab.textColor = TextColor;
//        self.lastYearLab.textAlignment = NSTextAlignmentCenter;
//        self.lastYearLab.font = [UIFont systemFontOfSize:8.0];
//        self.lastYearLab.sd_layout.leftSpaceToView(self.rookieYearLab, 0).centerYEqualToView(self.contentView).heightIs(40).widthIs(KSceenW / 10);
//        self.lastYearLab.layer.masksToBounds = YES;
//        self.lastYearLab.layer.borderColor = Gray.CGColor;
//        self.lastYearLab.layer.borderWidth = 0.5;
        
        
        self.birthDateLab = [[UILabel alloc]init];
        [self.contentView addSubview:self.birthDateLab];
        self.birthDateLab.textColor = TextColor;
        self.birthDateLab.textAlignment = NSTextAlignmentCenter;
        self.birthDateLab.font = [UIFont systemFontOfSize:8.0];
        self.birthDateLab.sd_layout.leftSpaceToView(self.rookieYearLab, 0).centerYEqualToView(self.contentView).heightIs(40).widthIs(KSceenW / 7);
        self.birthDateLab.layer.masksToBounds = YES;
        self.birthDateLab.layer.borderColor = Gray.CGColor;
        self.birthDateLab.layer.borderWidth = 0.5;
        
//        self.positionLab = [[UILabel alloc]init];
//        [self.contentView addSubview:self.positionLab];
//        self.positionLab.textColor = TextColor;
//        self.positionLab.textAlignment = NSTextAlignmentCenter;
//        self.positionLab.font = [UIFont systemFontOfSize:8.0];
//        self.positionLab.sd_layout.leftSpaceToView(self.birthDateLab, 0).centerYEqualToView(self.contentView).heightIs(40).widthIs(KSceenW / 10);
//        self.positionLab.layer.masksToBounds = YES;
//        self.positionLab.layer.borderColor = Gray.CGColor;
//        self.positionLab.layer.borderWidth = 0.5;
        
        self.statusLab = [[UILabel alloc]init];
        [self.contentView addSubview:self.statusLab];
        self.statusLab.textColor = TextColor;
        self.statusLab.textAlignment = NSTextAlignmentCenter;
        self.statusLab.font = [UIFont systemFontOfSize:8.0];
        self.statusLab.sd_layout.leftSpaceToView(self.birthDateLab, 0).centerYEqualToView(self.contentView).heightIs(40).widthIs(KSceenW / 7);
        self.statusLab.layer.masksToBounds = YES;
        self.statusLab.layer.borderColor = Gray.CGColor;
        self.statusLab.layer.borderWidth = 0.5;
        
        
    }
    
    return self;
    
}

- (void)setModel:(SYJPlayerModel *)model{
    
    _model = model;
    
    self.nameLab.text = model.firstName;
//    self.teamLab.text = model.team;
//    self.positionLab.text = model.position;
    self.statusLab.text = model.status;
    self.uniformNumberLab.text = model.uniformNumber;
    self.birthDateLab.text = [model.birthDate substringToIndex:8];
    self.heightLab.text = model.height;
    self.weightLab.text = model.weight;
    self.rookieYearLab.text = model.rookieYear;
//    self.lastYearLab.text = model.lastYear;
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
