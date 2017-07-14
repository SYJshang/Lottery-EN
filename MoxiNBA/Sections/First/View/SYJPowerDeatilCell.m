//
//  SYJPowerDeatilCell.m
//  MoxiNBA
//
//  Created by 尚勇杰 on 2017/6/27.
//  Copyright © 2017年 尚勇杰. All rights reserved.
//

#import "SYJPowerDeatilCell.h"

#define numWidth (KSceenW - 100) / 6

@implementation SYJPowerDeatilCell

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    
    static NSString *cellId = @"detailCell";
    SYJPowerDeatilCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[SYJPowerDeatilCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
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
        self.firstLab.sd_layout.leftSpaceToView(self.contentView, 50).topSpaceToView(self.timeLab, 10).heightIs(numWidth).widthIs(numWidth);
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
        
        self.fiveLab = [[UILabel alloc]init];
        [self.contentView addSubview:self.fiveLab];
        self.fiveLab.font = [UIFont fontWithName:@"AmericanTypewriter" size:scaleWithSize(16)];
        self.fiveLab.backgroundColor = Gray;
        self.fiveLab.textColor = [UIColor purpleColor];
        self.fiveLab.textAlignment = NSTextAlignmentCenter;
        self.fiveLab.sd_layout.leftSpaceToView(self.fouthLab,0).topSpaceToView(self.timeLab, 10).heightIs(numWidth).widthIs(numWidth);
        self.fiveLab.layer.cornerRadius = numWidth / 2;
        self.fiveLab.layer.masksToBounds = YES;
        self.fiveLab.layer.borderColor = [UIColor grayColor].CGColor;
        self.fiveLab.layer.borderWidth = 1.0;
        
        self.sixLab = [[UILabel alloc]init];
        [self.contentView addSubview:self.sixLab];
        self.sixLab.font = [UIFont fontWithName:@"AmericanTypewriter" size:scaleWithSize(16)];
        self.sixLab.backgroundColor = TextColor;
        self.sixLab.textColor = [UIColor purpleColor];
        self.sixLab.textAlignment = NSTextAlignmentCenter;
        self.sixLab.sd_layout.leftSpaceToView(self.fiveLab,0).topSpaceToView(self.timeLab, 10).heightIs(numWidth).widthIs(numWidth);
        self.sixLab.layer.cornerRadius = numWidth / 2;
        self.sixLab.layer.masksToBounds = YES;
        self.sixLab.layer.borderColor = [UIColor grayColor].CGColor;
        self.sixLab.layer.borderWidth = 1.0;
        
        self.powerPlayLab = [[UILabel alloc]init];
        [self.contentView addSubview:self.powerPlayLab];
        self.powerPlayLab.font = [UIFont fontWithName:@"AmericanTypewriter" size:scaleWithSize(20)];
        self.powerPlayLab.textColor = [UIColor lightGrayColor];
        self.powerPlayLab.textAlignment = NSTextAlignmentCenter;
        self.powerPlayLab.sd_layout.topSpaceToView(self.fiveLab, 5).leftSpaceToView(self.contentView, 40).rightSpaceToView(self.contentView, 40).heightIs(20);
        
        
        self.nextJackPot = [[UILabel alloc]init];
        [self.contentView addSubview:self.nextJackPot];
        self.nextJackPot.font = [UIFont fontWithName:@"AmericanTypewriter" size:scaleWithSize(20)];
        self.nextJackPot.textColor = TextColor;
        self.nextJackPot.textAlignment = NSTextAlignmentCenter;
        self.nextJackPot.sd_layout.heightIs(20).topSpaceToView(self.powerPlayLab, 5).leftSpaceToView(self.contentView, 20).rightSpaceToView(self.contentView, 20);
        
        UIView *line1 = [[UIView alloc]init];
        [self.contentView addSubview:line1];
        line1.backgroundColor = Gray;
        line1.sd_layout.leftSpaceToView(self.contentView, 5).rightSpaceToView(self.contentView, 5).bottomSpaceToView(self.contentView, 0.5).heightIs(0.5);
        self.backgroundColor = [UIColor clearColor];

    }
    
    return self;
    
}

- (void)setModel:(SYJDetailPowerModel *)model{
    
    _model = model;
    self.nameLab.text = [model.gameName uppercaseString];
    NSString *date = [NSString stringWithFormat:@"%@,%@",[self getTheDayOfTheWeekByDateString:model.date],model.date];
    self.timeLab.text = [date uppercaseString];
    NSArray *arrStr = [model.lastDrawNumbers componentsSeparatedByString:@","];
    NSArray *numberArr = [arrStr[0] componentsSeparatedByString:@"-"];
    NSArray *lastPower = [arrStr[1] componentsSeparatedByString:@":"];
    
    self.firstLab.text = numberArr[0];
    self.secondLab.text = numberArr[1];
    self.thirdLab.text = numberArr[2];
    self.fouthLab.text = numberArr[3];
    self.fiveLab.text = numberArr[4];
    self.sixLab.text = lastPower.lastObject;
    
    self.powerPlayLab.text = arrStr.lastObject;
    self.nextJackPot.text = [NSString stringWithFormat:@"Next JACKPOT: $%@",model.nextJackpot];

    
}

-(NSString *)getTheDayOfTheWeekByDateString:(NSString *)dateString{
    
    NSDateFormatter *inputFormatter=[[NSDateFormatter alloc]init];
    
    [inputFormatter setDateFormat:@"yyyy-MM-dd"];
    
    NSDate *formatterDate=[inputFormatter dateFromString:dateString];
    
    NSDateFormatter *outputFormatter=[[NSDateFormatter alloc]init];
    
    [outputFormatter setDateFormat:@"EEEE-MMMM-d"];
    
    NSString *outputDateStr=[outputFormatter stringFromDate:formatterDate];
    
    NSArray *weekArray=[outputDateStr componentsSeparatedByString:@"-"];
    
    return [weekArray objectAtIndex:0];
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
