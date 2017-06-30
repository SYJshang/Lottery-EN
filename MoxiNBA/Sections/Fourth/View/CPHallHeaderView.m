//
//  CPHallHeaderView.m
//  彩票2
//
//  Created by 张涛 on 2017/4/14.
//  Copyright © 2017年 1. All rights reserved.
//

#import "CPHallHeaderView.h"
#import "SDCycleScrollView.h"

@interface CPHallHeaderView()<SDCycleScrollViewDelegate>

@property (nonatomic, weak) SDCycleScrollView *cycleScrollView;
@property (nonatomic, strong) UIButton *button1;

@end

@implementation CPHallHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.frame = frame;
        //创建轮播图
        CGRect frame = CGRectMake(0, 0, SCREEN_SIZE.width, scaleWithSize(163));
        SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:frame delegate:self placeholderImage:nil];
        cycleScrollView.autoScrollTimeInterval = 5;
        cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
        self.cycleScrollView = cycleScrollView;
        [self addSubview:cycleScrollView];
        
        UIView *grayView = [[UIView alloc]init];
        grayView.frame = CGRectMake(0, CGRectGetMaxY(_cycleScrollView.frame), SCREEN_SIZE.width, scaleWithSize(30));
        
        UIView *iconView = [[UIView alloc]init];
        iconView.backgroundColor =  Color(250, 64, 64, 1);
        [grayView addSubview:iconView];
        
        [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(scaleWithSize(16));
            make.centerY.mas_equalTo(grayView.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(scaleWithSize(6), scaleWithSize(16)));
        }];
        
        UILabel *likeLab = [[UILabel alloc]init];
        likeLab.text = @"猜你喜欢";
        likeLab.font = [UIFont systemFontOfSize:scaleWithSize(13) weight:UIFontWeightThin];
        [grayView addSubview:likeLab];
        [likeLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(iconView.mas_right).offset(scaleWithSize(5));
            make.centerY.mas_equalTo(grayView.mas_centerY);
            make.width.mas_lessThanOrEqualTo(150);
        }];
        
        UIView *line = [[UIView alloc]init];
        line.backgroundColor = Color(200, 199, 204, 1);
        [grayView addSubview:line];
        
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@0);
            make.bottom.mas_equalTo(grayView.mas_bottom);
            make.size.mas_equalTo(CGSizeMake(SCREEN_SIZE.width, 1));
        }];
        
        [self addSubview:grayView];
        
        UIButton *likeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        likeBtn.tag = 3;
        [likeBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [likeBtn setImage:[UIImage imageNamed:@"likeIcon"] forState:UIControlStateNormal];
        [self addSubview:likeBtn];
        [likeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@0);
            make.top.equalTo(grayView.mas_bottom);
            make.size.mas_equalTo(CGSizeMake(SCREEN_SIZE.width, scaleWithSize(100)));
        }];
        
        UIView *grayView2 = [self createIntervalView];
        [self addSubview:grayView2];
        
        [grayView2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self);
            make.height.mas_equalTo(scaleWithSize(20));
            make.top.equalTo(likeBtn.mas_bottom).offset(scaleWithSize(10));
        }];
        
        UIButton *button1 = [self createBtn:@"开奖信息" subTitle:@"查询开奖信息" imageName:@"kaijiangxinxi" tag:0];
        [self addSubview:button1];
        UIButton *button2 = [self createBtn:@"球队资料" subTitle:@"掌握球队信息" imageName:@"球队资料" tag:1];
        [self addSubview:button2];
        UIButton *button3 = [self createBtn:@"资讯" subTitle:@"易友中奖必看" imageName:@"3" tag:2];
        [self addSubview:button3];
        UIButton *button4 = [self createBtn:@"附近票点" subTitle:@"发现最近投注站" imageName:@"附近票点icon" tag:3];
        [self addSubview:button4];
        UIButton *button5 = [self createBtn:@"排列5" subTitle:@"暂停销售" imageName:@"彩票课堂" tag:4];
        [self addSubview:button5];
        UIButton *button6 = [self createBtn:@"排列3" subTitle:@"暂停销售" imageName:@"2" tag:5];
        [self addSubview:button6];
        UIButton *button7 = [self createBtn:@"七星彩" subTitle:@"暂停销售" imageName:@"4" tag:6];
        [self addSubview:button7];
        UIButton *button8 = [self createBtn:@"3D" subTitle:@"暂停销售" imageName:@"玩法技巧" tag:7];
        [self addSubview:button8];
        UIButton *button9 = [self createBtn:@"快乐8" subTitle:@"即将开放，敬请期待" imageName:@"玩法技巧" tag:8];
        [self addSubview:button9];
        UIButton *button10 = [self createBtn:@"七乐彩" subTitle:@"即将开放，敬请期待" imageName:@"玩法技巧" tag:5];
        [self addSubview:button10];
        
        [button1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.top.mas_equalTo(grayView2.mas_bottom).offset(scaleWithSize(10));
            make.width.mas_equalTo(SCREEN_SIZE.width /2);
            make.height.mas_equalTo(scaleWithSize(77));
        }];
        [button2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(0);
            make.top.mas_equalTo(button1.mas_top);
            make.width.mas_equalTo(SCREEN_SIZE.width /2);
            make.height.mas_equalTo(scaleWithSize(77));
        }];
        [button3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.top.mas_equalTo(button1.mas_bottom).offset(scaleWithSize(10));
            make.width.mas_equalTo(SCREEN_SIZE.width /2);
            make.height.mas_equalTo(scaleWithSize(77));
        }];
        [button4 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(0);
            make.top.mas_equalTo(button3.mas_top);
            make.width.mas_equalTo(SCREEN_SIZE.width /2);
            make.height.mas_equalTo(scaleWithSize(77));
        }];
        [button5 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.top.mas_equalTo(button3.mas_bottom).offset(scaleWithSize(10));
            make.width.mas_equalTo(SCREEN_SIZE.width /2);
            make.height.mas_equalTo(scaleWithSize(77));
        }];
        [button6 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(0);
            make.top.mas_equalTo(button5.mas_top);
            make.width.mas_equalTo(SCREEN_SIZE.width /2);
            make.height.mas_equalTo(scaleWithSize(77));
        }];
        [button7 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.top.mas_equalTo(button5.mas_bottom).offset(scaleWithSize(10));
            make.width.mas_equalTo(SCREEN_SIZE.width /2);
            make.height.mas_equalTo(scaleWithSize(77));
        }];
        [button8 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(0);
            make.top.mas_equalTo(button7.mas_top);
            make.width.mas_equalTo(SCREEN_SIZE.width /2);
            make.height.mas_equalTo(scaleWithSize(77));
        }];
        [button9 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.top.mas_equalTo(button7.mas_bottom).offset(scaleWithSize(10));
            make.width.mas_equalTo(SCREEN_SIZE.width /2);
            make.height.mas_equalTo(scaleWithSize(77));
        }];
        [button10 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(0);
            make.top.mas_equalTo(button9.mas_top);
            make.width.mas_equalTo(SCREEN_SIZE.width /2);
            make.height.mas_equalTo(scaleWithSize(77));
        }];
        
    }
    return self;
}

- (UIButton *)createBtn: (NSString *)title  subTitle: (NSString *)subTitle imageName: (NSString *)imageName  tag: (NSInteger) tag {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.tag = tag;
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.image = [UIImage imageNamed:imageName];
    [button addSubview:imageView];
    
    UILabel *titleLab = [[UILabel alloc]init];
    titleLab.font = [UIFont systemFontOfSize:scaleWithSize(13.5) weight:UIFontWeightRegular];
    titleLab.textColor = Color(73, 73, 73, 1);
    titleLab.text = title;
    [button addSubview:titleLab];
    
    UILabel *subTitleLab = [[UILabel alloc]init];
    subTitleLab.font = [UIFont systemFontOfSize:scaleWithSize(11) weight:UIFontWeightRegular];
    subTitleLab.text = subTitle;
    subTitleLab.textColor = Color(166, 166, 166, 1);
    [button addSubview:subTitleLab];
    
    UIView *line = [[UIView alloc]init];
    line.backgroundColor = Color(238, 238, 238, 1);
    [button addSubview:line];
    
    if (tag == 1 || tag == 3 || tag == 5) {
        UIView *line2 = [[UIView alloc]init];
        line2.backgroundColor = Color(238, 238, 238, 1);
        [button addSubview:line2];
        
        [line2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@0);
            make.centerY.mas_equalTo(button.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(1, scaleWithSize(50)));
        }];
    }
    
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@0);
        make.bottom.mas_equalTo(button.mas_bottom);
        make.size.mas_equalTo(CGSizeMake(SCREEN_SIZE.width, 1));
    }];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(scaleWithSize(16));
        make.top.mas_equalTo(15);
        //            make.top.equalTo(button1.mas_bottom).offset(30.0f);
        make.size.mas_equalTo(CGSizeMake(scaleWithSize(47), scaleWithSize(47)));
    }];
    
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(subTitleLab.mas_left);
        //            make.top.equalTo(imageView.mas_top).offset(scaleWithSize(8.5));
        make.bottom.equalTo(imageView.mas_centerY).offset(scaleWithSize(-3));
        //            make.size.mas_equalTo(CGSizeMake(80, 15));
        make.width.lessThanOrEqualTo(@150);
    }];
    [subTitleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imageView.mas_right).offset([self scaleSize:18]);
        //            make.bottom.equalTo(imageView.mas_bottom).offset(scaleWithSize(-5));
        make.top.equalTo(imageView.mas_centerY).offset(scaleWithSize(3));
        make.right.equalTo(button.mas_right);
        //            make.height.equalTo(@15);
        //            make.width.lessThanOrEqualTo(@100);
    }];
    //        UIButton *button5 = [self createBtn];//[self createBtn:@"校友信息" subTitle:@"网络招聘商机" imageName:@"xiaoyouicon" tag:4];
    
    return button;
    
}

//创建间隔
- (UIView *) createIntervalView {
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = Color(238, 238, 238, 1);
    return view;
}

- (CGFloat)scaleSize:(CGFloat)s{
    return s * (SCREEN_SIZE.width / 375);
}

#pragma mark 点击图片轮播器
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    if ([self.delegate respondsToSelector:@selector(didSelectItem:)]) {
        [self.delegate didSelectItem:index];
    }
}

- (void)buttonClick:(UIButton *)button{
    if ([self.delegate respondsToSelector:@selector(didButtonItemClick:)]) {
        [self.delegate didButtonItemClick:button];
    }
}

- (void)setImageURLStringsGroup:(NSArray *)imageURLStringsGroup{
    _cycleScrollView.imageURLStringsGroup = [imageURLStringsGroup copy];
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
