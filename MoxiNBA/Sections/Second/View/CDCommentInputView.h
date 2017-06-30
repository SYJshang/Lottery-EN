//
//  CDCommentInputView.h
//  caidaIOS
//
//  Created by 田亮 on 17/2/28.
//  Copyright © 2017年 上海房之钥信息技术有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CDCommentInputViewDelegate <NSObject>

@optional
- (void)sendButtonDidClick:(UIButton *)button;

@end

@interface CDCommentInputView : UIView

- (instancetype)initWithDelegate:(id)delegate;
@property (nonatomic, weak) id<CDCommentInputViewDelegate> delegate;
@property (nonatomic, copy) NSString *placeHolderText;
@property (nonatomic, weak) UITextView *textView;
- (void)changeDidViewSize:(CGRect)boardFrame;
- (void)changeDidViewSize;

@end
