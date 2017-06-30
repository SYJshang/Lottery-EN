//
//  CPArenaTableViewCell.m
//  彩票2
//
//  Created by 张涛 on 2017/4/15.
//  Copyright © 2017年 1. All rights reserved.
//

#import "CPArenaTableViewCell.h"

@interface CPArenaTableViewCell()

//@property (nonatomic, weak) UIImageView *pic;
//@property (nonatomic, weak) UILabel *title;
//@property (nonatomic, weak) UILabel *contentLab;
//@property (nonatomic, weak) UIView *lineBottom;
////@property (nonatomic, weak) UIButton *commentButton;
////@property (nonatomic, weak) UIButton *praiseButton;
//@property (nonatomic, weak) UILabel *authorLabel;
//@property (nonatomic, weak) UILabel *dateLabel;
////@property (nonatomic, weak) UILabel *enrollLab;

@end

@implementation CPArenaTableViewCell


+ (instancetype)cellWithTableView:(UITableView *)tableView{
    
    static NSString *cellID = @"CPArenaTableViewCell";
    CPArenaTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[CPArenaTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    return cell;
    
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        UIView *contentView = self.contentView;

        UIImageView *pic = [[UIImageView alloc] init];
        pic.contentMode = UIViewContentModeScaleToFill;
        self.pic = pic;
        [contentView addSubview:pic];
        self.pic.sd_layout.leftSpaceToView(self.contentView, 10).topSpaceToView(self.contentView, 5).heightIs(60).widthIs(60);
        self.pic.image = [UIImage imageNamed:@"头像"];
        self.pic.layer.masksToBounds = YES;
        self.pic.layer.cornerRadius = 30;
        self.pic.layer.borderColor = Gray.CGColor;
        self.pic.layer.borderWidth = 0.5;

        
        UILabel *title = [[UILabel alloc] init];
//        title.text = @"中奖啦中奖啦！！！！";
        title.textAlignment = NSTextAlignmentLeft;
        title.textColor = [UIColor blackColor];
        title.font = fontSize(scaleWithSize(17));
        [contentView addSubview:title];
        self.title = title;
        self.title.sd_layout.leftSpaceToView(self.pic, 5).topSpaceToView(self.contentView, 8).heightIs(20).widthIs(100);
        
        UILabel *dateLabel = [[UILabel alloc] init];
        dateLabel.textColor = Color(160, 160, 160, 1);
        dateLabel.textAlignment = NSTextAlignmentCenter;
        dateLabel.font = fontSize(scaleWithSize(13));
        dateLabel.text = @"2016年8月13日";
        [contentView addSubview:dateLabel];
        self.dateLabel = dateLabel;
        self.dateLabel.sd_layout.rightSpaceToView(self.contentView, 5).leftSpaceToView(self.title, 5).heightIs(20).centerYEqualToView(self.title);
        
        UILabel *contentLab = [[UILabel alloc]init];
        contentLab.textColor = [UIColor grayColor];
        contentLab.font = fontSize(scaleWithSize(16));
        contentLab.numberOfLines = 2;
        [contentView addSubview:contentLab];
        self.contentLab = contentLab;
        self.contentLab.sd_layout.leftSpaceToView(self.pic, 5).topSpaceToView(self.title, 0).heightIs(30).rightSpaceToView(self.contentView, 5);
        
        UIView *lineBottom = [[UIView alloc] init];
        lineBottom.backgroundColor = Gray;//Color(200, 199, 204, 1);
        [contentView addSubview:lineBottom];
        self.lineBottom = lineBottom;
        self.lineBottom.sd_layout.leftSpaceToView(self.contentView, 20).topSpaceToView(self.pic, 5).heightIs(1).rightSpaceToView(self.contentView, 20);
        
        UIButton *commentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [commentBtn setImage:[UIImage imageNamed:@"comment"] forState:UIControlStateNormal];
        [commentBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        commentBtn.titleLabel.font = fontSize(scaleWithSize(15));
        [self.contentView addSubview:commentBtn];
        self.commentBtn = commentBtn;
        self.commentBtn.sd_layout.leftSpaceToView(self.contentView, 60).topSpaceToView(self.lineBottom,5).heightIs(20).widthIs(40);
        
        UIButton *favoriteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [favoriteBtn setImage:[UIImage imageNamed:@"favorite"] forState:UIControlStateNormal];
        [favoriteBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        favoriteBtn.titleLabel.font = fontSize(scaleWithSize(14));
        [favoriteBtn addTarget:self action:@selector(praiseClick) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:favoriteBtn];
        self.favoriteBtn = favoriteBtn;
        self.favoriteBtn.sd_layout.rightSpaceToView(self.contentView, 60).topSpaceToView(self.lineBottom,5).heightIs(20).widthIs(40);

        
        UIView *line = [[UIView alloc]init];
        line.backgroundColor = Gray;//Color(200, 199, 204, 1);
        [self.contentView addSubview:line];
        self.line = line;
        self.line.sd_layout.leftSpaceToView(self.contentView, 10).rightSpaceToView(self.contentView, 10).bottomSpaceToView(self.contentView, 1).heightIs(1);
        
        UIView *line2 = [[UIView alloc]init];
        line2.backgroundColor = Gray;//Color(200, 199, 204, 1);
        [self.contentView addSubview:line2];
        self.line2 = line2;
        self.line2.sd_layout.centerXEqualToView(self.contentView).topSpaceToView(self.lineBottom, 0).bottomSpaceToView(self.line, 0).widthIs(1);

        
//            [self layoutViewFrame];
    }
    
    return self;
}

- (void)layoutViewFrame{
    
    
    [_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(scaleWithSize(8));
        make.left.mas_equalTo(scaleWithSize(16));
        make.right.equalTo(self.contentView).offset(scaleWithSize(-16));
    }];
    
    [_pic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(scaleWithSize(22));
        make.top.equalTo(_title.mas_bottom).offset(scaleWithSize(12.5));
        make.size.mas_equalTo(CGSizeMake(scaleWithSize(40), scaleWithSize(40)));
    }];
    
    [_contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_pic.mas_right).offset(scaleWithSize(13.5));
        make.top.mas_equalTo(_title.mas_bottom).offset(scaleWithSize(13));
        make.right.mas_equalTo(scaleWithSize(-16));
    }];
    CGFloat width = screen_width / 2;
    [_commentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@0);
        make.top.mas_equalTo(_pic.mas_bottom).offset(scaleWithSize(16));
        make.width.mas_equalTo(width);
        //        make.height.mas_equalTo(scaleWithSize(15));
    }];
    
    [_favoriteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@0);
        make.top.mas_equalTo(_pic.mas_bottom).offset(scaleWithSize(16));
        make.width.mas_equalTo(width);
        //        make.height.mas_equalTo(scaleWithSize(15));
    }];
    
    [_line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@0);
        make.bottom.mas_equalTo(_commentBtn.mas_top);
        make.size.mas_equalTo(CGSizeMake(screen_width, 1));
    }];
    [_line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@0);
        make.top.mas_equalTo(_commentBtn.mas_bottom);
        make.size.mas_equalTo(CGSizeMake(screen_width, 1));
    }];
    
    [_line3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(width);
        make.top.mas_equalTo(_line.mas_bottom);
        make.bottom.mas_equalTo(_line2.mas_top);
        make.width.mas_equalTo(1);
    }];
//    [_descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(_title.mas_bottom).offset(scaleWithSize(11));
//        make.left.equalTo(_pic.mas_right).offset(scaleWithSize(11));
//        make.right.equalTo(self.contentView).offset(scaleWithSize(-18));
//    }];
    
    //    CGFloat vWidth = (SCREEN_SIZE.width - 32) / 3;
//    [_authorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(_pic.mas_left);
//        make.top.equalTo(_pic.mas_bottom).offset(scaleWithSize(20));
//        make.width.lessThanOrEqualTo(@150);
//    }];
//    
//    [_dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.mas_equalTo(_contentLab.mas_right);
//        make.top.mas_equalTo(_authorLabel.mas_top);
//        make.width.lessThanOrEqualTo(@150);
//    }];
//    [_praiseButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.mas_equalTo(_descLabel.mas_right);
//        make.width.lessThanOrEqualTo(@(scaleWithSize(150)));
//        //        make.width.mas_equalTo(scaleWithSize(80));
//        make.top.equalTo(_dateLabel);
//    }];
//    
//    [_commentButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.equalTo(_praiseButton.mas_left).offset(scaleWithSize(-18.5));
//        make.width.lessThanOrEqualTo(@(scaleWithSize(150)));
//        //        make.width.mas_equalTo(scaleWithSize(80));
//        make.top.equalTo(_dateLabel);
//    }];
//    
    [_lineBottom mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_title.mas_left);
        make.right.equalTo(_title.mas_right);
        make.height.mas_equalTo(1);
        make.bottom.equalTo(self.contentView);
    }];
    
//    [_enrollLab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.equalTo(_descLabel.mas_right);
//        make.width.lessThanOrEqualTo(@150);
//        make.top.equalTo(_dateLabel);
//    }];
    
}

- (void)praiseClick {
    if (_isFavorite) {
        [_favoriteBtn setImage:[UIImage imageNamed:@"favorite"] forState:UIControlStateNormal];
        [SVProgressHUD showSuccessWithStatus:@"Cancel the collection success"];
        
    }else{
        [_favoriteBtn setImage:[UIImage imageNamed:@"favorite_selected"] forState:UIControlStateNormal];
        [SVProgressHUD showSuccessWithStatus:@"collection success"];
    }
    _isFavorite = !_isFavorite;
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
