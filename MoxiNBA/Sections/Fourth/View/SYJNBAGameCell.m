//
//  SYJNBAGameCell.m
//  MoxiNBA
//
//  Created by 尚勇杰 on 2017/6/15.
//  Copyright © 2017年 尚勇杰. All rights reserved.
//

#import "SYJNBAGameCell.h"

@implementation SYJNBAGameCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];
        
        self.homeIcon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"骑士"]];
        [self.contentView addSubview:self.homeIcon];
        self.homeIcon.sd_layout.leftSpaceToView(self.contentView, 10).centerYEqualToView(self.contentView).heightIs(45).widthIs(45);
        self.homeIcon.contentMode = UIViewContentModeScaleAspectFill;
        
        self.otherIcon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"nba3"]];
        [self.contentView addSubview:self.otherIcon];
        self.otherIcon.sd_layout.rightSpaceToView(self.contentView, 10).centerYEqualToView(self.contentView).heightIs(45).widthIs(45);
        self.otherIcon.contentMode = UIViewContentModeScaleAspectFill;

        
        self.homeName = [[UILabel alloc]init];
        [self.contentView addSubview:self.homeName];
        self.homeName.font = [UIFont fontWithName:@"Georgia-Italic" size:16.0];
        self.homeName.textAlignment = NSTextAlignmentLeft;
        self.homeName.text = @"CLE";
        self.homeName.textColor = [UIColor blackColor];
        self.homeName.sd_layout.leftSpaceToView(self.homeIcon,10).centerYEqualToView(self.contentView).heightIs(20).widthIs(50);
        
        self.otherName = [[UILabel alloc]init];
        [self.contentView addSubview:self.otherName];
        self.otherName.font = [UIFont fontWithName:@"Georgia-Italic" size:16.0];
        self.otherName.textAlignment = NSTextAlignmentRight;
        self.otherName.text = @"GSW";
        self.otherName.textColor = [UIColor blackColor];
        self.otherName.sd_layout.rightSpaceToView(self.otherIcon,10).centerYEqualToView(self.contentView).heightIs(20).widthIs(50);
        
        self.sorLab = [[UILabel alloc]init];
        [self.contentView addSubview:self.sorLab];
        self.sorLab.font = [UIFont fontWithName:@"Georgia-Italic" size:18.0];
        self.sorLab.textAlignment = NSTextAlignmentCenter;
        self.sorLab.text = @"132 - 115";
        self.sorLab.textColor = TextColor;
        self.sorLab.sd_layout.topSpaceToView(self.contentView,10).centerXEqualToView(self.contentView).heightIs(20).widthIs(100);
        
        self.time = [[UILabel alloc]init];
        [self.contentView addSubview:self.time];
        self.time.font = [UIFont fontWithName:@"Georgia-Italic" size:13.0];
        self.time.textAlignment = NSTextAlignmentCenter;
        self.time.text = @"Time Out";
        self.time.textColor = [UIColor lightGrayColor];
        self.time.sd_layout.topSpaceToView(self.otherName,0).centerXEqualToView(self.contentView).heightIs(15).widthIs(100);
        
        UIView *line = [[UIView alloc]init];
        line.backgroundColor = Gray;
        [self.contentView addSubview:line];
        line.sd_layout.leftSpaceToView(self.contentView, 5).rightSpaceToView(self.contentView, 5).bottomSpaceToView(self.contentView, 1).heightIs(1);
        
    }
    
    return self;
    
}

- (void)setModel:(SYJGameModel *)model{
    
    _model = model;
    
    NSDictionary *nbaLogo = [[NSUserDefaults standardUserDefaults] objectForKey:@"NBALogo"];
    [nbaLogo enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if ([obj isEqualToString:model.homeTeam.teamID]) {
            self.homeIcon.image = [UIImage imageNamed:key];
            SYJLog(@"----------%@",key);
        }
    }];
    
    [nbaLogo enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if ([obj isEqualToString:model.awayTeam.teamID]) {
            self.otherIcon.image = [UIImage imageNamed:key];
            SYJLog(@"----------%@",key);
        }
    }];
    self.homeName.text = model.homeTeam.teamID;
    self.otherName.text = model.awayTeam.teamID;
    
    self.sorLab.text = [NSString stringWithFormat:@"%ld - %ld",model.homeTeam.finalScore,model.awayTeam.finalScore];
    
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
