//
//  SYJDetailCell.m
//  MoxiNBA
//
//  Created by 尚勇杰 on 2017/6/27.
//  Copyright © 2017年 尚勇杰. All rights reserved.
//

#import "SYJDetailCell.h"

@implementation SYJDetailCell

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    
    static NSString *cellId = @"detCell";
    SYJDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[SYJDetailCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    return cell;
    
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.backgroundColor = [UIColor clearColor];

        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.name1Lab = [[UILabel alloc]init];
        [self.contentView addSubview:self.name1Lab];
        self.name1Lab.numberOfLines = 0;
        self.name1Lab.textColor = [UIColor lightGrayColor];
        self.name1Lab.font = [UIFont fontWithName:@"AmericanTypewriter" size:scaleWithSize(12)];
        self.name1Lab.textAlignment = NSTextAlignmentCenter;
        self.name1Lab.sd_layout.leftSpaceToView(self.contentView, 0).centerYEqualToView(self.contentView).heightIs(40).widthIs(KSceenW/ 3);
        
        self.name2Lab = [[UILabel alloc]init];
        [self.contentView addSubview:self.name2Lab];
        self.name2Lab.numberOfLines = 0;
        self.name2Lab.textColor = [UIColor lightGrayColor];
        self.name2Lab.font = [UIFont fontWithName:@"AmericanTypewriter" size:scaleWithSize(12)];
        self.name2Lab.textAlignment = NSTextAlignmentCenter;
        self.name2Lab.sd_layout.leftSpaceToView(self.name1Lab, 0).centerYEqualToView(self.contentView).heightIs(40).widthIs(KSceenW/ 3);
        
        self.name3Lab = [[UILabel alloc]init];
        [self.contentView addSubview:self.name3Lab];
        self.name3Lab.numberOfLines = 0;
        self.name3Lab.textColor = [UIColor lightGrayColor];
        self.name3Lab.font = [UIFont fontWithName:@"AmericanTypewriter" size:scaleWithSize(12)];
        self.name3Lab.textAlignment = NSTextAlignmentCenter;
        self.name3Lab.sd_layout.leftSpaceToView(self.name2Lab, 0).centerYEqualToView(self.contentView).heightIs(40).widthIs(KSceenW/ 3);
        
        UIView *line = [[UIView alloc]init];
        [self.contentView addSubview:line];
        line.backgroundColor = Gray;
        line.sd_layout.leftSpaceToView(self.contentView, 5).rightSpaceToView(self.contentView, 5).bottomSpaceToView(self.contentView, 0.5).heightIs(0.5);
        
    }
    
    return self;
    
}

- (void)setModel:(SYJMatchModel *)model{
    
    _model = model;
    self.name1Lab.text = model.match;
    self.name2Lab.text = model.prize;
    if (NULLString(model.num_winners) && !NULLString(model.odds)) {
        self.name3Lab.text = model.odds;
    }else if(!NULLString(model.num_winners) && NULLString(model.odds)){
        self.name3Lab.text = model.num_winners;
    }else{
        self.name3Lab.text = @"--";
    }
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
