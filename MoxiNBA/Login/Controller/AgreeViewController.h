//
//  AgreeViewController.h
//  CaiPiaoIM
//
//  Created by Jack Wang on 2017/3/30.
//  Copyright © 2017年 Jack Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AgreeViewController : UIViewController

@property(nonatomic,retain)  UIWebView  *webView;

-(void)loadDocument:(NSString *)documentName inView:(UIWebView *)webView;

@end
