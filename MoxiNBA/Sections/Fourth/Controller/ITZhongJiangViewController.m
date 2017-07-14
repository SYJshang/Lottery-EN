//
//  ITZhongJiangViewController.m
//  inrtest
//
//  Created by 张涛 on 2017/4/25.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import "ITZhongJiangViewController.h"

@interface ITZhongJiangViewController ()

@end

@implementation ITZhongJiangViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.title = @"中奖秘籍";
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.view.frame];
    imageView.image = [UIImage imageNamed:@"zhongjiang"];
    [self.view addSubview:imageView];
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
