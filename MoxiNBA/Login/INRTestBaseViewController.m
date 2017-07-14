//
//  INRTestBaseViewController.m
//  inrtest
//
//  Created by 张涛 on 16/4/18.
//  Copyright © 2016年 张涛. All rights reserved.
//

#import "INRTestBaseViewController.h"
//#import "ITJiLuViewController.h"
#import "Config.h"

@interface INRTestBaseViewController ()

@end

@implementation INRTestBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.view.frame];
    imageView.image = [UIImage imageNamed:@"渐变-2"];
    imageView.contentMode = UIViewContentModeScaleToFill;
    [self.view addSubview:imageView];
    
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, imageView.frame.size.width, imageView.frame.size.height)];
    toolbar.barStyle = UIBarStyleDefault;
    [imageView addSubview:toolbar];
    
    
    // Do any additional setup after loading the view.
}

- (void)creatNavView:(NSString *)title{
    
    UILabel *titleText = [[UILabel alloc] initWithFrame: CGRectMake(0, 0, 80, 44)];
    titleText.backgroundColor = [UIColor clearColor];
    titleText.textColor = [UIColor whiteColor];
    titleText.textAlignment = NSTextAlignmentCenter;
    [titleText setFont:fontSize(20)];
    [titleText setText:title];
    self.navigationItem.titleView = titleText;
    self.navigationController.navigationBar.barTintColor = Color(0, 177, 176, 100);
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(13, 26, 58, 30);
    leftBtn.userInteractionEnabled = NO;
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"logo"] forState:UIControlStateNormal];
    UIBarButtonItem *leftBtnItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    [self.navigationItem setLeftBarButtonItem:leftBtnItem];
    
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
