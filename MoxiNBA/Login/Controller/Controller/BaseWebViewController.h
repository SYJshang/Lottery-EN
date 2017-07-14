//
//  BaseWebViewController.h
//  Domino
//
//  Created by Jack.wang on 16/8/4.
//  Copyright © 2016年 jack.wang. All rights reserved.
//

#import "BaseViewController.h"
//#import "BaseSubWebViewController.h"

@interface BaseWebViewController : BaseViewController<UIWebViewDelegate>

@property(nonatomic,strong)  UIWebView  *webView;

@property(nonatomic,strong)  NSString   *urlString;

@property(nonatomic,assign)  BOOL       isLoginView;

@property(nonatomic,retain)  UILongPressGestureRecognizer   *longPressPan;

- (void)addsubViews;

- (id)initWithUrlStr:(NSString *)url;

@end
