//
//  SYJTabBarController.m
//  MoXiDemo
//
//  Created by 尚勇杰 on 2017/5/26.
//  Copyright © 2017年 尚勇杰. All rights reserved.
//

#import "SYJTabBarController.h"
#import "SYJFirstController.h"
#import "SYJSecondController.h"
#import "SYJThirdController.h"
#import "SYJFourthController.h"
#import "SYJNavitionController.h"
#import "WTHomeViewController.h"
#import "ITHomeViewController.h"

@interface SYJTabBarController ()

@end

@implementation SYJTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //
    SYJFirstController *main = [[SYJFirstController alloc]init] ;
    //    main.view.backgroundColor = [UIColor redColor];
    [self addChildVc:main Title:@"Lotto" withTitleSize:12.0 andFoneName:@"DBLCDTempBlack" selectedImage:@"lottery" withTitleColor:TextColor unselectedImage:@"lottery1" withTitleColor:[UIColor lightGrayColor]];
    //
    SYJSecondController  *caseVC = [[SYJSecondController alloc]init];
    //    caseVC.view.backgroundColor = [UIColor grayColor];
    [self addChildVc:caseVC Title:@"News" withTitleSize:12.0 andFoneName:@"DBLCDTempBlack" selectedImage:@"news" withTitleColor:TextColor unselectedImage:@"news1" withTitleColor:[UIColor lightGrayColor]];
    //
    WTHomeViewController *fitVC = [[WTHomeViewController alloc]init];
    [self addChildVc:fitVC Title:@"Weather" withTitleSize:12.0 andFoneName:@"DBLCDTempBlack" selectedImage:@"weather" withTitleColor:TextColor unselectedImage:@"weather1" withTitleColor:[UIColor lightGrayColor]];
    
    
    ITHomeViewController *MyVC = [[ITHomeViewController alloc]init];
    //    MyVC.view.backgroundColor = [UIColor purpleColor];
    [self addChildVc:MyVC Title:@"Find" withTitleSize:12.0 andFoneName:@"HelveticaNeue-Bold" selectedImage:@"find" withTitleColor:TextColor unselectedImage:@"find1" withTitleColor:[UIColor lightGrayColor]];
    
    
    // Do any additional setup after loading the view.
}


- (void)addChildVc:(UIViewController *)childVc
             Title:(NSString *)title
     withTitleSize:(CGFloat)size
       andFoneName:(NSString *)foneName
     selectedImage:(NSString *)selectedImage
    withTitleColor:(UIColor *)selectColor
   unselectedImage:(NSString *)unselectedImage
    withTitleColor:(UIColor *)unselectColor{
    childVc.title = title;
   // 设置图片
    childVc.tabBarItem  = [childVc.tabBarItem initWithTitle:title image:[[UIImage imageNamed:unselectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    //未选中字体颜色
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:unselectColor,NSFontAttributeName:[UIFont fontWithName:foneName size:size]} forState:UIControlStateNormal];
    
    //选中字体颜色
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:selectColor,NSFontAttributeName:[UIFont fontWithName:foneName size:size]} forState:UIControlStateSelected];
    SYJNavitionController *nav = [[SYJNavitionController alloc] initWithRootViewController:childVc];
    // 添加为子控制器
    [self addChildViewController:nav];
    
    /*
     //base64加密

    NSString *str = @"134567";
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    NSString *sta = [data base64EncodedStringWithOptions:0];
    
    NSData *nsdataFromBase64String = [[NSData alloc]
                                      initWithBase64EncodedString:sta options:0];
    
    // Decoded NSString from the NSData
    NSString *base64Decoded = [[NSString alloc]
                               initWithData:nsdataFromBase64String encoding:NSUTF8StringEncoding];
     */
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
