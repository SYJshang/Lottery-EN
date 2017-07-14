//
//  CDCommentInputView.m
//  caidaIOS
//
//  Created by 田亮 on 17/2/28.
//  Copyright © 2017年 上海房之钥信息技术有限公司. All rights reserved.
//

#import "CDCommentInputView.h"

@interface CDCommentInputView ()<UITextViewDelegate>

@property (nonatomic, weak) UIButton *sendButton;
@property (nonatomic, weak) UILabel *placeHolderLabel;

@end

@implementation CDCommentInputView

- (instancetype)initWithDelegate:(id)delegate
{
    self = [super init];
    if (self) {
        
        self.backgroundColor = Color(220, 220, 220, 1);
        
        UITextView *textView = [[UITextView alloc] init];
        textView.delegate = delegate;
        textView.layer.cornerRadius = 4.0f;
        textView.returnKeyType = UIReturnKeySend;
        [self addSubview:textView];
        self.textView = textView;
        
        UIButton *sendButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [sendButton setTitle:@"send" forState:UIControlStateNormal];
        [sendButton.titleLabel setFont:fontSize(scaleWithSize(14.0f))];
        [sendButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [sendButton setBackgroundColor:Color(250, 67, 67, 1)];
        [sendButton addTarget:self action:@selector(sendButtonCLick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:sendButton];
        sendButton.layer.cornerRadius = 4.0f;
        self.sendButton = sendButton;
        
        UILabel *placeHolderLabel = [[UILabel alloc] init];
        placeHolderLabel.text = @"say something";
        placeHolderLabel.textColor = Color(230, 230, 230, 1);
        placeHolderLabel.font = fontSize(scaleWithSize(14));
        placeHolderLabel.userInteractionEnabled = NO;
        [textView addSubview:placeHolderLabel];
        self.placeHolderLabel = placeHolderLabel;
        
        self.delegate = delegate;
        
        [self layoutViews];
    }
    return self;
}

- (void)changeDidViewSize{
    self.height = MIN(80, MAX(40, self.textView.contentSize.height));
}

- (void)changeDidViewSize:(CGRect)boardFrame{
    [self changeDidViewSize];
    CGFloat contentHeight = MIN(80, self.textView.contentSize.height);
    CGFloat ty = MAX(0, contentHeight - 40);
    CGFloat endTy = - (boardFrame.size.height + 40 + ty);
    self.transform = CGAffineTransformMakeTranslation(0, endTy);
    self.placeHolderLabel.hidden = (self.textView.text.length > 0);
}

- (void)setPlaceHolderText:(NSString *)placeHolderText{
    self.placeHolderLabel.text = [placeHolderText copy];
    self.placeHolderLabel.hidden = (self.textView.text.length > 0);
}

- (void)layoutViews{
    
    self.frame = CGRectMake(0, SCREEN_SIZE.height, SCREEN_SIZE.width, 40);
    
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(6);
        make.top.mas_equalTo(6);
        make.bottom.mas_equalTo(-6);
        make.right.equalTo(self.sendButton.mas_left).offset(-10);
    }];
    
    [self.placeHolderLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(5);
        make.centerY.equalTo(self);
    }];
    
    [self.sendButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(80);
        make.height.lessThanOrEqualTo(@30);
        make.top.equalTo(self.textView);
        make.right.equalTo(self).offset(-6);
    }];
    
}
- (void)setHeight:(CGFloat)height {
    [self setFrame:CGRectMake(CGRectGetMinX(self.frame), CGRectGetMinY(self.frame),
                              CGRectGetWidth(self.frame), height)];
}

- (void)sendButtonCLick:(UIButton *)button{
    if ([self.delegate respondsToSelector:@selector(sendButtonDidClick:)]) {
        [self.delegate sendButtonDidClick:button];
    }else{
        
        [SVProgressHUD showErrorWithStatus:@"error"];
    }
}

@end
