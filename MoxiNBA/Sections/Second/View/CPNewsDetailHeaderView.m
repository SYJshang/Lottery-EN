//
//  CPNewsDetailHeaderView.m
//  inrtest
//
//  Created by 张涛 on 2017/5/10.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import "CPNewsDetailHeaderView.h"
#import "CPNewsDetailWebView.h"

@interface CPNewsDetailHeaderView()<WKNavigationDelegate>

@property (nonatomic, strong) UILabel *titleLab;

@property (nonatomic, strong) UILabel *dateLab;

@property (nonatomic, strong) UILabel *authorLab;

@property (nonatomic, strong) UIImageView *coverPic;

@property (nonatomic, strong) CPNewsDetailWebView *datailWebView;

//@property (nonatomic, )


@end

@implementation CPNewsDetailHeaderView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.frame = frame;
        
        _titleLab = [[UILabel alloc]init];
        _titleLab.font = fontSize(scaleWithSize(18));
        _titleLab.numberOfLines = 2;
        [self addSubview:_titleLab];
        
        _coverPic = [[UIImageView alloc]init];
        _coverPic.contentMode = UIViewContentModeScaleToFill;
        [self addSubview:_coverPic];
        
        _dateLab = [[UILabel alloc]init];
        _dateLab.font = fontSize(scaleWithSize(14));
        _dateLab.textColor = Color(193, 193, 193, 1);
        [self addSubview:_dateLab];
        
        _authorLab = [[UILabel alloc]init];
        _authorLab.font = fontSize(scaleWithSize(14));
        _authorLab.textColor = Color(193, 193, 193, 1);
        [self addSubview:_authorLab];
        
        CPNewsDetailWebView *datailWebView = [[CPNewsDetailWebView alloc]init];
        datailWebView.navigationDelegate = self;
        datailWebView.scrollView.scrollEnabled = NO;
        datailWebView.scrollView.contentSize = CGSizeZero;
        [self addSubview:datailWebView];
        self.datailWebView = datailWebView;
        
        [self layoutWithFrame];
    }
    return self;
}

- (void)layoutWithFrame {
    
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(scaleWithSize(16));
        make.right.mas_equalTo(scaleWithSize(-16));
        make.top.mas_equalTo(scaleWithSize(10));
    }];
    
    [_coverPic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_titleLab.mas_left);
        make.right.mas_equalTo(_titleLab.mas_right);
        make.top.mas_equalTo(_titleLab.mas_bottom).offset(scaleWithSize(10));
        make.height.mas_equalTo(scaleWithSize(150));
    }];
    
    [_datailWebView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_coverPic.mas_bottom).offset(scaleWithSize(10));
        make.left.mas_equalTo(scaleWithSize(0));
        make.right.mas_equalTo(scaleWithSize(0));
        make.bottom.mas_equalTo(_dateLab.mas_top).offset(scaleWithSize(-5));
    }];
    
    [_dateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_titleLab.mas_left);
        make.bottom.mas_equalTo(self.mas_bottom).offset(scaleWithSize(-10));
        make.width.mas_lessThanOrEqualTo(scaleWithSize(200));
        
    }];
    
    [_authorLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(_titleLab.mas_right);
        make.bottom.mas_equalTo(_dateLab.mas_bottom);
        make.width.mas_lessThanOrEqualTo(scaleWithSize(150));
    }];
    
    
}

- (void)setModel:(ITNewsModel *)model{
    _model = model;
    
    _titleLab.text = _model.title;
    [_coverPic sd_setImageWithURL:[NSURL URLWithString:_model.imageurl]];
    _dateLab.text = _model.strTime;
    _authorLab.text = _model.author;
    
    _datailWebView.html = _model.content;
    CGFloat webViewY = scaleWithSize(20);
    self.datailWebView.frame = CGRectMake(scaleWithSize(-16), webViewY, SCREEN_SIZE.width, scaleWithSize(20));
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error{
    [SVProgressHUD showErrorWithStatus:@"Failure"];
}

#pragma mark 页面加载完成之后调用
-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    __weak typeof(self) weakSelf = self;
    [webView evaluateJavaScript:@"document.body.scrollHeight" completionHandler:^(id _Nullable height, NSError * _Nullable error) {
        CGFloat webViewHeight = [height floatValue];
        CGRect frame = weakSelf.datailWebView.frame;
        frame.size = CGSizeMake(SCREEN_SIZE.width, webViewHeight);
        weakSelf.datailWebView.frame = frame;
        if ([self.delegate respondsToSelector:@selector(updateViewSize:)]) {
            [self.delegate updateViewSize:webViewHeight];
        }
    }];
}

#pragma mark 页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation
{
    [SVProgressHUD showErrorWithStatus:@"Failure"];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
