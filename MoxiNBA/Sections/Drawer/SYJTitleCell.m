//
//  SYJTitleCell.m
//  MoxiNBA
//
//  Created by 尚勇杰 on 2017/6/26.
//  Copyright © 2017年 尚勇杰. All rights reserved.
//

#import "SYJTitleCell.h"

@implementation SYJTitleCell

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    
    static NSString *cellId = @"titleCell";
    SYJTitleCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[SYJTitleCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    return cell;
    
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor clearColor];

        self.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"渐变-2"]];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.icon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@""]];
        [self.contentView addSubview:self.icon];
        self.icon.sd_layout.leftSpaceToView(self.contentView,10).centerYEqualToView(self.contentView).widthIs(24).heightIs(24);
        
        self.nameLab = [[UILabel alloc]init];
        [self.contentView addSubview:self.nameLab];
        self.nameLab.textColor = [UIColor whiteColor];
        self.nameLab.font = [UIFont systemFontOfSize:scaleWithSize(16)];
        self.nameLab.sd_layout.leftSpaceToView(self.icon, 8).centerYEqualToView(self.contentView).heightIs(20).widthIs(140);
        
        
    }
    
    return self;
    
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
