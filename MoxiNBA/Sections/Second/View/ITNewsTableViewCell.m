//
//  ITNewsTableViewCell.m
//  inrtest
//
//  Created by 张涛 on 2017/5/10.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import "ITNewsTableViewCell.h"

@interface ITNewsTableViewCell()

@property (nonatomic, strong) UILabel *titleLab;
@property (nonatomic, strong) UILabel *contentLab;
@property (nonatomic, strong) UIImageView *coverPic;
@property (nonatomic, strong) UILabel *dateLab;
@property (nonatomic, strong) UILabel *commentLab;
@property (nonatomic, strong) UILabel *praiseLab;
@property (nonatomic, strong) UIButton *commentBtn;
@property (nonatomic, strong) UIButton *favoriteBtn;
@property (nonatomic, strong) UIView *line;
@property (nonatomic, strong) UIView *line2;
@property (nonatomic, strong) UIView *line3;
@property (nonatomic, assign) BOOL isFavorite;

@end

@implementation ITNewsTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *cellId = @"ITNewsTableViewCell";
    ITNewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[ITNewsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        UIImageView *coverPic = [[UIImageView alloc]init];
        coverPic.contentMode = UIViewContentModeScaleToFill;
        [self.contentView addSubview:coverPic];
        _coverPic = coverPic;
        self.coverPic.sd_layout.leftSpaceToView(self.contentView, 5).centerYEqualToView(self.contentView).widthIs(120).heightIs(120);
        self.coverPic.layer.masksToBounds = YES;
        self.coverPic.sd_cornerRadius = @3;
        self.coverPic.layer.borderColor = Gray.CGColor;
        self.coverPic.layer.borderWidth = 0.5;
        
        
        self.titleLab = [[UILabel alloc]init];
        self.titleLab.font = fontSize(scaleWithSize(18));
        self.titleLab.textColor = [UIColor blackColor];
        [self.contentView addSubview:self.titleLab];
        self.titleLab.sd_layout.leftSpaceToView(self.coverPic, 5).rightSpaceToView(self.contentView, 10).topSpaceToView(self.contentView, 8).heightIs(20);
        
        
        UILabel *contentLab = [[UILabel alloc]init];
        contentLab.font = fontSize(scaleWithSize(15));
        contentLab.textColor = Color(0, 0, 0, 1);
        contentLab.numberOfLines = 4;
        [self.contentView addSubview:contentLab];
        _contentLab = contentLab;
        self.contentLab.sd_layout.leftSpaceToView(self.coverPic, 5).topSpaceToView(self.titleLab, 5).rightSpaceToView(self.contentView, 10).heightIs(60);
        
        
        
        UIView *line = [[UIView alloc]init];
//        line.backgroundColor = Color(200, 199, 204, 1);
        line.backgroundColor = Gray;
        [self.contentView addSubview:line];
        self.line = line;
        self.line.sd_layout.leftSpaceToView(self.coverPic, 5).rightSpaceToView(self.contentView, 10).topSpaceToView(self.contentLab, 5).heightIs(0.5);
        
        UIView *line2 = [[UIView alloc]init];
//        line2.backgroundColor = Color(200, 199, 204, 1);
        line2.backgroundColor = Gray;
        [self.contentView addSubview:line2];
        self.line2 = line2;
        self.line2.sd_layout.leftSpaceToView(self.coverPic, 5).rightSpaceToView(self.contentView, 10).bottomSpaceToView(self.contentView, 5).heightIs(0.5);
        
        UIView *line3 = [[UIView alloc]init];
//        line3.backgroundColor = Color(200, 199, 204, 1);
        line3.backgroundColor = Gray;
        [self.contentView addSubview:line3];
        self.line3 = line3;
      self.line3.sd_layout.centerXEqualToView(self.line).topSpaceToView(self.line, 0).bottomSpaceToView(self.line2, 0).widthIs(0.5);
        
        UIButton *commentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [commentBtn setImage:[UIImage imageNamed:@"comment"] forState:UIControlStateNormal];
        [commentBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        commentBtn.titleLabel.font = fontSize(scaleWithSize(15));
        [self.contentView addSubview:commentBtn];
        self.commentBtn = commentBtn;
        self.commentBtn.sd_layout.leftSpaceToView(self.coverPic,40).topSpaceToView(self.line, 6).heightIs(14).widthIs(40);
        
        
        UIButton *favoriteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [favoriteBtn setImage:[UIImage imageNamed:@"favorite"] forState:UIControlStateNormal];
        [favoriteBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        favoriteBtn.titleLabel.font = fontSize(scaleWithSize(14));
        [favoriteBtn addTarget:self action:@selector(praiseClick) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:favoriteBtn];
        self.favoriteBtn = favoriteBtn;
        self.favoriteBtn.sd_layout.rightSpaceToView(self.contentView,40).topSpaceToView(self.line, 6).heightIs(14).widthIs(40);
        
        
        
        
//        [self layoutFrame];
    }
    return self;
}


- (void)praiseClick {
    if (_isFavorite) {
        [_favoriteBtn setImage:[UIImage imageNamed:@"favorite"] forState:UIControlStateNormal];
        [SVProgressHUD showSuccessWithStatus:@"Cancel Success"];
        
    }else{
        [_favoriteBtn setImage:[UIImage imageNamed:@"favorite_selected"] forState:UIControlStateNormal];
        [SVProgressHUD showSuccessWithStatus:@"Success"];
    }
    _isFavorite = !_isFavorite;
}

- (void)setModel:(ITNewsModel *)model{
    _model = model;
    _isFavorite = NO;
    _titleLab.text = _model.title;
    [_coverPic sd_setImageWithURL:[NSURL URLWithString:_model.imageurl] placeholderImage:[UIImage imageNamed:@"图标"]];
    _contentLab.text = [self removeSymbol:_model.content];
    _dateLab.text = _model.strTime;
    [_commentBtn setTitle:[NSString stringWithFormat:@"%ld", (long)_model.commentCount] forState:UIControlStateNormal];
    
}

- (NSString *)removeSymbol: (NSString *)string {
//    string = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];  //去除掉首尾的空白字符和换行字符
    string = [string stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    return string;
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
