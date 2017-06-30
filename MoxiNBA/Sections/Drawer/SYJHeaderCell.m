//
//  SYJHeaderCell.m
//  MoxiNBA
//
//  Created by 尚勇杰 on 2017/6/26.
//  Copyright © 2017年 尚勇杰. All rights reserved.
//

#import "SYJHeaderCell.h"

@implementation SYJHeaderCell

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    
    static NSString *cellId = @"headerCell";
    SYJHeaderCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[SYJHeaderCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    return cell;
    
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.backgroundColor = [UIColor clearColor];

//        self.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"渐变"]];
       
        self.iconImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"头像"]];
        [self.contentView addSubview:self.iconImg];
        
        self.iconImg.sd_layout.leftSpaceToView(self.contentView, 80).topSpaceToView(self.contentView, 10).heightIs(40).widthIs(40);
        self.iconImg.sd_cornerRadius = @20;
        
        
        self.userName = [[UILabel alloc]init];
        [self.contentView addSubview:self.userName];
        self.userName.sd_layout.centerXEqualToView(self.iconImg).widthIs(140).topSpaceToView(self.iconImg, 5).heightIs(20);
        self.userName.font = [UIFont boldSystemFontOfSize:scaleWithSize(16)];
        self.userName.textColor = [UIColor blackColor];
        self.userName.textAlignment = NSTextAlignmentCenter;
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
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
