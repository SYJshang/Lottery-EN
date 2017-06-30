//
//  HomeTableViewCell.m
//  Domino
//
//  Created by Jason chen on 2017/3/13.
//  Copyright © 2017年 jack.wang. All rights reserved.
//

#import "ITBaoGaoViewCell.h"

@implementation ITBaoGaoViewCell



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
    
    ITBaoGaoViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"bgCell"];
    
    if (cell == nil) {
        cell = [[ITBaoGaoViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"bgCell"];
    }
    return cell;
    
    
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self =[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {

        self.selectionStyle = UITableViewCellSelectionStyleNone;

        
        imageView = [[UIImageView alloc] initWithFrame:CGRectMake(6*KWidth_ScaleW, 6*KWidth_ScaleW, 128*KWidth_ScaleW, 98*KWidth_ScaleW)];
        imageView.layer.cornerRadius = 7;
        imageView.layer.masksToBounds = YES;
        [self.contentView addSubview:imageView];
        
        labelText = [[UILabel alloc] initWithFrame:CGRectMake(146*KWidth_ScaleW, 0, SCREEN_SIZE.width - 30 - 120*KWidth_ScaleW, 67*KWidth_ScaleW)];
        labelText.font = [UIFont systemFontOfSize:21*KWidth_ScaleW];
        labelText.numberOfLines = 0;
        labelText.textAlignment = NSTextAlignmentLeft;
        
        [self.contentView addSubview:labelText];
        
        labelTime = [[UILabel alloc] initWithFrame:CGRectMake(146*KWidth_ScaleW, 86*KWidth_ScaleW, SCREEN_SIZE.width - 240*KWidth_ScaleW, 22*KWidth_ScaleW)];
        labelTime.textColor = [UIColor grayColor];
        labelTime.font = [UIFont systemFontOfSize:15*KWidth_ScaleW];
        [self.contentView addSubview:labelTime];
        
//        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(scaleWithSize(16), self.contentView.frame.size.height-1, self.contentView.frame.size.width-32, 1)];
//        line.backgroundColor = Color(200, 199, 204, 1);
//        [self.contentView addSubview:line];
        
//        labelTime = [[UILabel alloc] initWithFrame:CGRectMake(screen_width - 108*KWidth_ScaleW, 86*KWidth_ScaleW, 99*KWidth_ScaleW, 23*KWidth_ScaleW)];
//        labelTime.font = [UIFont systemFontOfSize:15*KWidth_ScaleW];
//        labelTime.textAlignment = NSTextAlignmentRight;
//        [self.contentView addSubview:labelTime];
//        imageView=  [[UIImageView  alloc]initWithFrame:CGRectMake(5, 5, self.frame.size.height+30, 55)];
////        imageView.image = [UIImage imageNamed:@"homeicon"];
//        [self addSubview:imageView];
//        
//        //title
//        labelText = [[UILabel alloc]initWithFrame:CGRectMake(K_RECT_MAXX(imageView)+10, 5, K_FRAME_BASE_WIDTH/10*7, 10)];
//        labelText.font = [UIFont systemFontOfSize:14];
//        [self  addSubview:labelText];
//        
//        
//        
//        //spr
//        labelStr = [[UILabel alloc]initWithFrame:CGRectMake(K_RECT_MAXX(imageView)+10, K_RECT_MAXY(labelText), K_FRAME_BASE_WIDTH/10*7, 35)];
//        labelStr.textAlignment= NSTextAlignmentLeft;
////        labelStr.text = @"中国鼓励彩票福利彩票中国鼓励彩票福利彩票中国鼓励彩票福利彩票中国鼓励彩票";
//        labelStr.numberOfLines = 2;
//        [labelStr setTextColor:[UIColor grayColor]];
//        labelStr.font = [UIFont systemFontOfSize:11];
//        [self addSubview:labelStr];
//        //time
//        
//        labelTime = [[UILabel alloc]initWithFrame:CGRectMake(K_FRAME_BASE_WIDTH-140, K_RECT_MAXY(labelStr), 130, 10)];
//        labelTime.textAlignment= NSTextAlignmentRight;
////        labelTime.text = @"8:00";
//        [labelTime setTextColor:[UIColor grayColor]];
//        labelTime.font = [UIFont systemFontOfSize:11];
//        [self addSubview:labelTime];
//        
    }
    return self;
}
@end
