//
//  SYJTwoByTwoCell.m
//  MoxiNBA
//
//  Created by 尚勇杰 on 2017/6/27.
//  Copyright © 2017年 尚勇杰. All rights reserved.
//

#import "SYJTwoByTwoCell.h"

#define numWidth (KSceenW - 180) / 4

@implementation SYJTwoByTwoCell

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    
    static NSString *cellId = @"twoCell";
    SYJTwoByTwoCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[SYJTwoByTwoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    return cell;
    
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        //        self.backgroundColor = Gray;
        
        self.nameLab = [[UILabel alloc]init];
        [self.contentView addSubview:self.nameLab];
        self.nameLab.font = [UIFont fontWithName:@"Georgia-Italic" size:scaleWithSize(26)];
        self.nameLab.textColor = [UIColor purpleColor];
        self.nameLab.textAlignment = NSTextAlignmentCenter;
        self.nameLab.sd_layout.centerXEqualToView(self.contentView).topSpaceToView(self.contentView, 5).heightIs(24).widthIs(200);
        
        self.timeLab = [[UILabel alloc]init];
        [self.contentView addSubview:self.timeLab];
        self.timeLab.font = [UIFont fontWithName:@"AmericanTypewriter" size:scaleWithSize(22)];
        self.timeLab.textColor = [UIColor lightGrayColor];
        self.timeLab.textAlignment = NSTextAlignmentCenter;
        self.timeLab.sd_layout.centerXEqualToView(self.contentView).topSpaceToView(self.nameLab, 5).heightIs(24).widthIs(240);
        
        self.firstLab = [[UILabel alloc]init];
        [self.contentView addSubview:self.firstLab];
        self.firstLab.font = [UIFont fontWithName:@"AmericanTypewriter" size:scaleWithSize(16)];
        self.firstLab.backgroundColor = Gray;
        self.firstLab.textColor = [UIColor purpleColor];
        self.firstLab.textAlignment = NSTextAlignmentCenter;
        self.firstLab.sd_layout.leftSpaceToView(self.contentView, 90).topSpaceToView(self.timeLab, 10).heightIs(numWidth).widthIs(numWidth);
        self.firstLab.layer.cornerRadius = numWidth / 2;
        self.firstLab.layer.masksToBounds = YES;
        self.firstLab.layer.borderColor = [UIColor grayColor].CGColor;
        self.firstLab.layer.borderWidth = 1.0;
        
        self.secondLab = [[UILabel alloc]init];
        [self.contentView addSubview:self.secondLab];
        self.secondLab.font = [UIFont fontWithName:@"AmericanTypewriter" size:scaleWithSize(16)];
        self.secondLab.backgroundColor = Gray;
        self.secondLab.textColor = [UIColor purpleColor];
        self.secondLab.textAlignment = NSTextAlignmentCenter;
        self.secondLab.sd_layout.leftSpaceToView(self.firstLab,0).topSpaceToView(self.timeLab, 10).heightIs(numWidth).widthIs(numWidth);
        self.secondLab.layer.cornerRadius = numWidth / 2;
        self.secondLab.layer.masksToBounds = YES;
        self.secondLab.layer.borderColor = [UIColor grayColor].CGColor;
        self.secondLab.layer.borderWidth = 1.0;
        
        self.thirdLab = [[UILabel alloc]init];
        [self.contentView addSubview:self.thirdLab];
        self.thirdLab.font = [UIFont fontWithName:@"AmericanTypewriter" size:scaleWithSize(16)];
        self.thirdLab.backgroundColor = Gray;
        self.thirdLab.textColor = [UIColor purpleColor];
        self.thirdLab.textAlignment = NSTextAlignmentCenter;
        self.thirdLab.sd_layout.leftSpaceToView(self.secondLab,0).topSpaceToView(self.timeLab, 10).heightIs(numWidth).widthIs(numWidth);
        self.thirdLab.layer.cornerRadius = numWidth / 2;
        self.thirdLab.layer.masksToBounds = YES;
        self.thirdLab.layer.borderColor = [UIColor grayColor].CGColor;
        self.thirdLab.layer.borderWidth = 1.0;
        
        self.fouthLab = [[UILabel alloc]init];
        [self.contentView addSubview:self.fouthLab];
        self.fouthLab.font = [UIFont fontWithName:@"AmericanTypewriter" size:scaleWithSize(16)];
        self.fouthLab.backgroundColor = Gray;
        self.fouthLab.textColor = [UIColor purpleColor];
        self.fouthLab.textAlignment = NSTextAlignmentCenter;
        self.fouthLab.sd_layout.leftSpaceToView(self.thirdLab,0).topSpaceToView(self.timeLab, 10).heightIs(numWidth).widthIs(numWidth);
        self.fouthLab.layer.cornerRadius = numWidth / 2;
        self.fouthLab.layer.masksToBounds = YES;
        self.fouthLab.layer.borderColor = [UIColor grayColor].CGColor;
        self.fouthLab.layer.borderWidth = 1.0;
        

        
//        self.powerPlayLab = [[UILabel alloc]init];
//        [self.contentView addSubview:self.powerPlayLab];
//        self.powerPlayLab.font = [UIFont fontWithName:@"AmericanTypewriter" size:scaleWithSize(20)];
//        self.powerPlayLab.textColor = [UIColor lightGrayColor];
//        self.powerPlayLab.textAlignment = NSTextAlignmentCenter;
//        self.powerPlayLab.sd_layout.topSpaceToView(self.fouthLab, 5).leftSpaceToView(self.contentView, 40).rightSpaceToView(self.contentView, 40).heightIs(20);
        
        UIView *line = [[UIView alloc]init];
        [self.contentView addSubview:line];
        line.backgroundColor = Gray;
        line.sd_layout.leftSpaceToView(self.contentView, 60).rightSpaceToView(self.contentView, 60).topSpaceToView(self.fouthLab, 5).heightIs(0.5);
        
        self.NextTimeLab = [[UILabel alloc]init];
        [self.contentView addSubview:self.NextTimeLab];
        self.NextTimeLab.font = [UIFont fontWithName:@"AmericanTypewriter" size:scaleWithSize(16)];
        self.NextTimeLab.textColor = [UIColor lightGrayColor];
        self.NextTimeLab.textAlignment = NSTextAlignmentCenter;
        self.NextTimeLab.sd_layout.heightIs(20).topSpaceToView(line, 8).leftSpaceToView(self.contentView, 20).rightSpaceToView(self.contentView, 20);
        
        self.nextJackPot = [[UILabel alloc]init];
        [self.contentView addSubview:self.nextJackPot];
        self.nextJackPot.font = [UIFont fontWithName:@"AmericanTypewriter" size:scaleWithSize(20)];
        self.nextJackPot.textColor = TextColor;
        self.nextJackPot.textAlignment = NSTextAlignmentCenter;
        self.nextJackPot.sd_layout.heightIs(20).topSpaceToView(self.NextTimeLab, 5).leftSpaceToView(self.contentView, 20).rightSpaceToView(self.contentView, 20);
        
        UIView *line1 = [[UIView alloc]init];
        [self.contentView addSubview:line1];
        line1.backgroundColor = Gray;
        line1.sd_layout.leftSpaceToView(self.contentView, 5).rightSpaceToView(self.contentView, 5).bottomSpaceToView(self.contentView, 0.5).heightIs(0.5);
        
        UIImageView *img = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"箭头"]];
        [self.contentView addSubview:img];
        img.sd_layout.rightSpaceToView(self.contentView, 10).centerYEqualToView(self.contentView).heightIs(20).widthIs(20);
        self.backgroundColor = [UIColor clearColor];

    }
    
    return self;
    
}

- (void)setModel:(SYJAllModel *)model{
    
    _model = model;
    
    //    SYJAttIDModel *attModle = model.name;
    self.nameLab.text = [model.name.game_name uppercaseString];
    self.timeLab.text = model.name.update_time;
    NSArray *arrStr = [model.lastdraw_numbers componentsSeparatedByString:@","];
    NSArray *numberArr = [arrStr[0] componentsSeparatedByString:@"-"];
//    NSArray *lastPower = [arrStr[1] componentsSeparatedByString:@":"];
    
    self.firstLab.text = numberArr[0];
    self.secondLab.text = numberArr[1];
    self.thirdLab.text = numberArr[2];
    self.fouthLab.text = numberArr[3];
//    self.fiveLab.text = numberArr[4];
    
//    self.powerPlayLab.text = arrStr.lastObject;
    self.NextTimeLab.text = [NSString stringWithFormat:@"Next Draw Date: %@",model.nextdraw_date];
    if (NULLString(model.jackpot)) {
        self.nextJackPot.text = [NSString stringWithFormat:@"Next JACKPOT: --"];
        
    }else{
        self.nextJackPot.text = [NSString stringWithFormat:@"Next JACKPOT: $%@",model.jackpot];
        
    }}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
