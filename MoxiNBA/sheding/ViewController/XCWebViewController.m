//
//  XCWebViewController.m
//  彩票2
//
//  Created by 1 on 16/1/23.
//  Copyright © 2016年 1. All rights reserved.
//

#import "XCWebViewController.h"
#import "XCHelpModel.h"

@interface XCWebViewController ()<UIWebViewDelegate>

@end

@implementation XCWebViewController

- (void)setModel:(XCHelpModel *)model {

    _model = model;
}


//将View改成webView
- (void)loadView{
    
    UIWebView *webView = [[UIWebView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    self.view = webView;
}

- (void)viewDidLoad{
    
    [super viewDidLoad];
    //拿到webview
    UIWebView *webView = (UIWebView *)self.view;
    
    //加载网页
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:self.model.html withExtension:nil];
    //加载网络数据  js  = javascript
    NSURLRequest *urlre = [NSURLRequest requestWithURL:url];
    [webView loadRequest:urlre];
    
    //设置代理
    webView.delegate = self;
    
    //添加一个关闭按钮
    UIBarButtonItem *close = [[UIBarButtonItem alloc]initWithTitle:@"关闭" style:UIBarButtonItemStylePlain target:self action:@selector(closeBtn)];
    
    //添加上去
    self.navigationItem.leftBarButtonItem = close;
}


//协议方法
- (void)webViewDidFinishLoad:(UIWebView *)webView{

    //执行js 语句
    NSString *str = [NSString stringWithFormat:@"document.location.href = '#%@';",self.model.ID];
    
    [webView stringByEvaluatingJavaScriptFromString:str];
    
}

- (void) closeBtn{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
