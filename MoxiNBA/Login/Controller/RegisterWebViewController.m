//
//  RegisterWebViewController.m
//  Domino
//
//  Created by fred on 16/10/21.
//  Copyright © 2016年 jack.wang. All rights reserved.
//

#import "RegisterWebViewController.h"

@interface RegisterWebViewController ()

@end

@implementation RegisterWebViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.urlString = [NSString stringWithFormat:@"%@/#/register?%@",K_APP_BASE_URL,[Utils urlStringAddress:@""]];
    NSLog(@"cart:%@+++++",self.urlString);
    [self addsubViews];
    
    // Do any additional setup after loading the view.
}

- (void)addsubViews{
    
    NSURL *url = [[NSURL alloc]initWithString:self.urlString];
    UIWebView *webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, K_FRAME_HEAD_HEIGHT, K_FRAME_BASE_WIDTH, K_FRAME_BASE_HEIGHT-K_FRAME_HEAD_HEIGHT)];
    [webView setBackgroundColor:[Utils colorFromHexRGB:@"f4f4f4"]];
    [webView setDelegate:self];
    [self.view addSubview:webView];
    [webView loadRequest:[NSURLRequest requestWithURL:url]];
}

- (NSString *)getFirstStr {
    return [NSString stringWithFormat:@"%@/#/register?%@",K_APP_BASE_URL,[Utils urlStringAddress:@""]];
}

@end
