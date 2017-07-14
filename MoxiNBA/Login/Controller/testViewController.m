//
//  testViewController.m
//  Domino
//
//  Created by Jason chen on 2017/3/9.
//  Copyright © 2017年 jack.wang. All rights reserved.
//

#import "testViewController.h"

@interface testViewController ()

@end

@implementation testViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIWebView *webview  =[[UIWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    NSURL *url = [NSURL URLWithString:@"http://www.jb51.net/article/78869.htm"];
    NSURLRequest *requestUrl = [NSURLRequest requestWithURL:url];
    [webview loadRequest:requestUrl];
    [self.view addSubview:webview];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
