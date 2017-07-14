//
//  SYJListCell.m
//  MoxiNBA
//
//  Created by 尚勇杰 on 2017/7/10.
//  Copyright © 2017年 尚勇杰. All rights reserved.
//

#import "SYJListCell.h"

@implementation SYJListCell

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    
    static NSString *cellId = @"listCell";
    SYJListCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[SYJListCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    return cell;
    
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
//        self.backgroundColor = [UIColor clearColor];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.iconImg = [[UIImageView alloc]init];
        [self.contentView addSubview:self.iconImg];
        self.iconImg.sd_layout.leftSpaceToView(self.contentView, 8).centerYEqualToView(self.contentView).heightIs(36).widthIs(36);
        
        self.nameLab = [[UILabel alloc]init];
        [self.contentView addSubview:self.nameLab];
        self.nameLab.font = [UIFont systemFontOfSize:16];
        self.nameLab.textColor = [UIColor blackColor];
        self.nameLab.textAlignment = NSTextAlignmentLeft;
        self.nameLab.sd_layout.leftSpaceToView(self.iconImg, 10).centerYEqualToView(self.contentView).heightIs(20).widthIs(240);
        
        
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
