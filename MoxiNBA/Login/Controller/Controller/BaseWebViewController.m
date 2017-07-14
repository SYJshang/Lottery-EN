//
//  BaseWebViewController.m
//  Domino
//
//  Created by Jack.wang on 16/8/4.
//  Copyright © 2016年 jack.wang. All rights reserved.
//

#import "BaseWebViewController.h"
//#import "WebViewController.h"
//#import "MemuDetailViewController.h"



@interface BaseWebViewController ()

@end

@implementation BaseWebViewController

- (id)initWithUrlStr:(NSString *)url
{
    self = [super init];
    if (self) {
        self.urlString = url;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
   // [self addsubViews];
    self.isLoginView = NO;
    
    [super viewWillAppear:animated];
}

- (void)addsubViews{
    
    NSURL *url = [[NSURL alloc]initWithString:self.urlString];
    UIWebView *webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, K_FRAME_VIEW_ORIGIN_Y, K_FRAME_BASE_WIDTH, K_FRAME_BASE_HEIGHT-K_FRAME_VIEW_ORIGIN_Y)];
//    [webView setBackgroundColor:[Utils colorFromHexRGB:@"f4f4f4"]];
    [webView setDelegate:self];
    // 当前顶层窗口
    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    // 添加到窗口
    [window addSubview:webView];
//    [self.view addSubview:webView];
    [webView loadRequest:[NSURLRequest requestWithURL:url]];
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
//    [self.view setBackgroundColor:[Utils colorFromHexRGB:@"d91d36"]];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    UILongPressGestureRecognizer *lpgr = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:nil];
//    lpgr.delegate = self;
    lpgr.delaysTouchesBegan = YES;
    [self.view addGestureRecognizer:lpgr];
    self.longPressPan = lpgr;
    self.longPressPan.minimumPressDuration = 0.3;
//    [self addsubViews];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
//    [self showHint:@"加载中..."];
}

- (void)webViewDidFinishLoad:(UIWebView *)web{
//    [self hideHud];
}

-(void)webView:(UIWebView*)webView  DidFailLoadWithError:(NSError*)error{
    
    NSLog(@"DidFailLoadWithError");
}


@end
