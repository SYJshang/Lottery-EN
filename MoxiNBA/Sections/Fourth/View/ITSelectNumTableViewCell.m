//
//  ITSelectNumTableViewCell.m
//  inrtest
//
//  Created by 张涛 on 2017/5/9.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import "ITSelectNumTableViewCell.h"

@interface ITSelectNumTableViewCell()

@property (nonatomic, strong) UILabel *titleLab;
@property (nonatomic, strong) UIButton *button1;
@property (nonatomic, strong) UIButton *button2;
@property (nonatomic, strong) UIButton *button3;
@property (nonatomic, strong) UIButton *button4;
@property (nonatomic, strong) UIButton *button5;
@property (nonatomic, strong) UIButton *button6;
@property (nonatomic, strong) UIButton *button7;
@property (nonatomic, strong) UIButton *button8;
@property (nonatomic, strong) UIButton *button9;
@property (nonatomic, strong) UIButton *button10;
@property (nonatomic, assign) BOOL isSelected;
@property (nonatomic, assign) NSInteger buttonTag;

@end

@implementation ITSelectNumTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *cellId = @"ITSelectNumTableViewCell";
    ITSelectNumTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[ITSelectNumTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        UILabel *titleLab = [[UILabel alloc]init];
        titleLab.font = fontSize(scaleWithSize(16));
        [self.contentView addSubview:titleLab];
        _titleLab = titleLab;
        
        _line = [[UIView alloc]init];
        _line.backgroundColor = Color(193, 193, 193, 1);
        [self.contentView addSubview:_line];
        
        _button1 = [self createButton:0];
        [self.contentView addSubview:_button1];
        
        _button2 = [self createButton:1];
        [self.contentView addSubview:_button2];
        
        _button3 = [self createButton:2];
        [self.contentView addSubview:_button3];
        
        _button4 = [self createButton:3];
        [self.contentView addSubview:_button4];
        
        _button5 = [self createButton:4];
        [self.contentView addSubview:_button5];
        
        [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(scaleWithSize(10));
            make.top.mas_equalTo(scaleWithSize(20));
            make.width.mas_lessThanOrEqualTo(scaleWithSize(80));
        }];
        
        NSArray *buttons = @[_button1, _button2, _button3, _button4, _button5];
        UIButton *lastBtn = nil;
        for (int i = 0; i < buttons.count; i++) {
            UIButton *button = buttons[i];
            [button mas_makeConstraints:^(MASConstraintMaker *make) {
                if (i == 0) {
                    make.left.mas_equalTo(titleLab.mas_right).offset(scaleWithSize(10));
                    
                }else{
                    make.left.mas_equalTo(lastBtn.mas_right).offset(scaleWithSize(10));
                }
                make.top.mas_equalTo(scaleWithSize(10));
                make.size.mas_equalTo(CGSizeMake(scaleWithSize(40), scaleWithSize(40)));
            }];
            lastBtn = buttons[i];
        }
        
        _button6 = [self createButton:5];
        [self.contentView addSubview:_button6];
        
        _button7 = [self createButton:6];
        [self.contentView addSubview:_button7];
        
        _button8 = [self createButton:7];
        [self.contentView addSubview:_button8];
        
        _button9 = [self createButton:8];
        [self.contentView addSubview:_button9];
        
        _button10 = [self createButton:9];
        [self.contentView addSubview:_button10];
        
        NSArray *buttons2 = @[_button6, _button7, _button8, _button9, _button10];
        UIButton *lastBtn2 = nil;
        for (int i = 0; i < buttons2.count; i++) {
            UIButton *button = buttons2[i];
            [button mas_makeConstraints:^(MASConstraintMaker *make) {
                if (i == 0) {
                    make.left.mas_equalTo(_button1.mas_left);
                    
                }else{
                    make.left.mas_equalTo(lastBtn2.mas_right).offset(scaleWithSize(10));
                }
                make.top.mas_equalTo(_button1.mas_bottom).offset(scaleWithSize(10));
                make.size.mas_equalTo(CGSizeMake(scaleWithSize(40), scaleWithSize(40)));
            }];
            lastBtn2 = buttons2[i];
        }
        
        [_line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.bottom.mas_equalTo(self.contentView.mas_bottom);
            make.size.mas_equalTo(CGSizeMake(screen_width, 1));
        }];
        
    }
    return self;
}

- (UIButton *)createButton: (NSInteger)title {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    button.layer.cornerRadius = scaleWithSize(20);
    [button setTitle:[NSString stringWithFormat:@"%d", title] forState:UIControlStateNormal];
    button.layer.borderWidth = 1;
    button.tag = title;
    button.layer.borderColor = [UIColor grayColor].CGColor;
    button.layer.masksToBounds = YES;
    [button setTitleColor:Color(250, 67, 67, 1) forState:UIControlStateNormal];
    button.titleLabel.font = fontSize(scaleWithSize(18));
    
    return button;
}

- (void) setIndex:(NSInteger)index{
    _index = index;
    [self setTitleText:_row];
    NSArray *buttonArr = @[_button1, _button2, _button3, _button4, _button5, _button6, _button7, _button8, _button9, _button10];
//    UIButton *button = buttonArr[_index];
//    button.backgroundColor = Color(250, 67, 67, 1);
//    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    for (int i = 0; i < buttonArr.count; i++) {
        UIButton *button = buttonArr[i];
        if (i == index) {
            button.backgroundColor = Color(250, 67, 67, 1);
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }else{
            button.backgroundColor = [UIColor whiteColor];
            [button setTitleColor:Color(250, 67, 67, 1) forState:UIControlStateNormal];
        }
    }
//    if (_isOne) {
//        for (int i = 0; i < buttonArr.count; i++) {
//            UIButton *button = buttonArr[i];
//            if (i == index) {
//                button.backgroundColor = Color(250, 67, 67, 1);
//                [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//            }else{
//                button.backgroundColor = [UIColor whiteColor];
//                [button setTitleColor:Color(250, 67, 67, 1) forState:UIControlStateNormal];
//            }
//        }
//    }else{
//        if (_isClean) {
//            for (int i = 0; i < buttonArr.count; i++) {
//                UIButton *button = buttonArr[i];
//                button.backgroundColor = [UIColor whiteColor];
//                [button setTitleColor:Color(250, 67, 67, 1) forState:UIControlStateNormal];
//                
//            }
//        }else{
//            for (int i = 0; i < buttonArr.count; i++) {
//                UIButton *button = buttonArr[i];
//                if (i == index) {
//                    button.backgroundColor = Color(250, 67, 67, 1);
//                    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//                }else{
//                    button.backgroundColor = [UIColor whiteColor];
//                    [button setTitleColor:Color(250, 67, 67, 1) forState:UIControlStateNormal];
//                }
//            }
//        }
//    }
}

- (void)click: (UIButton *)button {
    
    if ([self.delegate respondsToSelector:@selector(didButtonClick:index:)]) {
        [self.delegate didButtonClick:button.tag index:_row];
    }
//    button.backgroundColor = Color(250, 67, 67, 1);
//    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    NSArray *buttonArr = @[_button1, _button2, _button3, _button4, _button5, _button6, _button7, _button8, _button9, _button10];
//    for (int i = 0; i < buttonArr.count; i++) {
//        UIButton *btn = buttonArr[i];
//        if (i != button.tag) {
//            btn.backgroundColor = [UIColor whiteColor];
//            [btn setTitleColor:Color(250, 67, 67, 1) forState:UIControlStateNormal];
//        }
//    }
}

- (void)setTitleText: (NSInteger)row{
    if (_type == 3) {
        switch (row) {
            case 0:
                _titleLab.text = @"hundreds";
                break;
            case 1:
                _titleLab.text = @"decade";
                break;
            case 2:
                _titleLab.text = @"theUnit";
                break;
                
            default:
                break;
        }
    }else if(_type == 5){
        switch (row) {
            case 0:
                _titleLab.text = @"Myriabit";
                break;
            case 1:
                _titleLab.text = @"kilobit";
                break;
            case 2:
                _titleLab.text = @"hundreds";
                break;
            case 3:
                _titleLab.text = @"decade";
                break;
            case 4:
                _titleLab.text = @"theUnit";
                break;
                
            default:
                break;
        }
    }else{
        switch (row) {
            case 0:
                _titleLab.text = @"One";
                break;
            case 1:
                _titleLab.text = @"Two";
                break;
            case 2:
                _titleLab.text = @"Three";
                break;
            case 3:
                _titleLab.text = @"Four";
                break;
            case 4:
                _titleLab.text = @"Five";
                break;
            case 5:
                _titleLab.text = @"Six";
                break;
            case 6:
                _titleLab.text = @"Seven";
                break;
                
            default:
                break;
        }
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
