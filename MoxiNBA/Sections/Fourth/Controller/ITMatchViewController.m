//
//  ITMatchViewController.m
//  inrtest
//
//  Created by 张涛 on 2017/5/4.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import "ITMatchViewController.h"
#import "ITMatchDetailViewController.h"

@interface ITMatchViewController ()

@end

@implementation ITMatchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Match";
    [self createViews];
    // Do any additional setup after loading the view.
}
- (void)createViews{
    self.menuItemWidth = SCREEN_SIZE.width / 4;
    self.progressWidth = SCREEN_SIZE.width/ 4 - 30;
    self.titleSizeSelected = 17;
    self.titleSizeNormal = 17;
    self.postNotification = YES;
    self.progressColor = Color(211, 59, 50, 1);
    self.menuHeight = 37;
    self.progressHeight = 5;
    self.menuViewStyle = WMMenuViewStyleLine;
    self.bounces = YES;
}

- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController{
    return 2;
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    
    ITMatchDetailViewController *vc = [[ITMatchDetailViewController alloc]init];
    vc.type = index;
    return vc;
}


- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    if (index == 0) {
        return @"Football";
    }else {
        return @"Basketball";
    }
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
