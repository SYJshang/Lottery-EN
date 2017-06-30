//
//  ITKaiJiangViewController.m
//  inrtest
//
//  Created by 张涛 on 2017/4/25.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import "ITKaiJiangViewController.h"
#import "ITCaiZhongViewController.h"

@interface ITKaiJiangViewController ()

@end

@implementation ITKaiJiangViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.titleView = [UILabel titleWithColor:TextColor title:@"Award" font:18];
    [self createViews];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(20, 20, 20, 20);
    //    [self.chageButton setBackgroundColor:[UIColor redColor]];
    [btn setImage:[UIImage imageNamed:@"back1"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
}

- (void)back{
    
    [self.navigationController popViewControllerAnimated:YES];
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
    return 7;
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    
    ITCaiZhongViewController *vc = [[ITCaiZhongViewController alloc]init];
    vc.type = index;
    return vc;
}


- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    if (index == 0) {
        return @"3DBall";
    }else if (index == 1){
        return @"Excel";
    }else if (index == 2){
        return @"Color";
    }else if (index == 3){
        return @"LotteryTick";
    }else if (index == 4){
        return @"3DMachine";
    }else if (index == 5){
        return @"ArThree";
    }else{
        return @"ArFive";
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
