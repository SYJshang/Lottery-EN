//
//  ITTeamInfoViewController.m
//  inrtest
//
//  Created by 张涛 on 2017/5/4.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import "ITTeamInfoViewController.h"
#import "ITInfoViewController.h"

@interface ITTeamInfoViewController ()

@end

@implementation ITTeamInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Zone";
    self.view.backgroundColor = [UIColor whiteColor];
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
//    self.menu = 37;
    self.progressHeight = 5;
    self.menuViewStyle = WMMenuViewStyleLine;
    self.bounces = YES;
}

- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController{
    return 3;
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    
    ITInfoViewController *vc = [[ITInfoViewController alloc]init];
    vc.row = index;
    return vc;
}


- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    if (index == 0) {
        return @"Spanish";
    }else if (index == 1) {
        return @"German";
    }else{
        return @"PremierLeague";
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
