//
//  HomeTableViewCell.m
//  Domino
//
//  Created by Jason chen on 2017/3/13.
//  Copyright © 2017年 jack.wang. All rights reserved.
//

#import "HomeTableViewCell.h"

@implementation HomeTableViewCell



@synthesize labelText;
@synthesize labelStr;
@synthesize labelTime;
@synthesize imageView;
//@synthesize line;
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

+(instancetype)initWithtableView:(UITableView *)tableView{
    
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeCell"];
    
    if (cell == nil) {
        cell = [[HomeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"HomeCell"];
    }
    return cell;
    
    
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self =[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {

        imageView = [[UIImageView alloc] initWithFrame:CGRectMake(6*KWidth_ScaleW, 6*KWidth_ScaleW, 128*KWidth_ScaleW, 98*KWidth_ScaleW)];
        imageView.layer.cornerRadius = 7;
        imageView.layer.masksToBounds = YES;
        [self.contentView addSubview:imageView];
        
        labelText = [[UILabel alloc] initWithFrame:CGRectMake(146*KWidth_ScaleW, 0, screen_width - 30 - 120*KWidth_ScaleW, 67*KWidth_ScaleW)];
        labelText.font = [UIFont systemFontOfSize:21*KWidth_ScaleW];
        labelText.numberOfLines = 0;
        labelText.textAlignment = NSTextAlignmentLeft;
        
        [self.contentView addSubview:labelText];
        
        labelTime = [[UILabel alloc] initWithFrame:CGRectMake(146*KWidth_ScaleW, 86*KWidth_ScaleW, screen_width - 240*KWidth_ScaleW, 22*KWidth_ScaleW)];
        labelTime.textColor = [UIColor grayColor];
        labelTime.font = [UIFont systemFontOfSize:15*KWidth_ScaleW];
        [self.contentView addSubview:labelTime];
        
       
    }
    return self;
}
@end
