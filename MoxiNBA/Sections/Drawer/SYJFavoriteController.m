//
//  SYJFavoriteController.m
//  MoxiNBA
//
//  Created by 尚勇杰 on 2017/6/29.
//  Copyright © 2017年 尚勇杰. All rights reserved.
//

#import "SYJFavoriteController.h"
#import "SYJTitleCell.h"
#import "YJCache.h"

@interface SYJFavoriteController ()

@property (nonatomic, strong) NSArray *arrList;

@end

@implementation SYJFavoriteController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    self.arrList = [userDefault objectForKey:@"myCollect"];
    SYJLog(@"%@",self.arrList);
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"back1"] forState:UIControlStateNormal];
    btn.frame = CGRectMake(10, 10, 24, 24);
    [btn addTarget:self action:@selector(leftBtn) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.titleView = [UILabel titleWithColor:TextColor title:@"Favorite" font:18];
    
    NSArray *arr = self.arrList.firstObject;
    
    if (arr.count == 3) {
        [self crertView3];
    }else{
        [self crertView5];
    }
    
}

- (void)leftBtn{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}


#pragma mark - creatView
- (void)crertView3{
    
    UILabel *lab1 = [[UILabel alloc]init];
    [self.view addSubview:lab1];
    lab1.font = [UIFont fontWithName:@"Georgia-Italic" size:26];
    lab1.textColor = [UIColor purpleColor];
    lab1.textAlignment = NSTextAlignmentCenter;
    lab1.backgroundColor = [UIColor greenColor];
    lab1.frame = CGRectMake(100, 130, 100, 100);
    lab1.layer.masksToBounds = YES;
    lab1.layer.cornerRadius = 50;
    lab1.layer.borderColor = Gray.CGColor;
    lab1.layer.borderWidth = 1.0;
    
    UILabel *lab2 = [[UILabel alloc]init];
    [self.view addSubview:lab2];
    lab2.font = [UIFont fontWithName:@"Georgia-Italic" size:26];
    lab2.textColor = [UIColor whiteColor];
    lab2.textAlignment = NSTextAlignmentCenter;
    lab2.backgroundColor = [UIColor yellowColor];
    lab2.frame = CGRectMake(140, 250, 100, 100);
    lab2.layer.masksToBounds = YES;
    lab2.layer.cornerRadius = 50;
    lab2.layer.borderColor = Gray.CGColor;
    lab2.layer.borderWidth = 1.0;
    
    UILabel *lab3 = [[UILabel alloc]init];
    [self.view addSubview:lab3];
    lab3.font = [UIFont fontWithName:@"Georgia-Italic" size:26];
    lab3.textColor = [UIColor whiteColor];
    lab3.textAlignment = NSTextAlignmentCenter;
    lab3.backgroundColor = [UIColor blueColor];
    lab3.frame = CGRectMake(30, 400, 100, 100);
    lab3.layer.masksToBounds = YES;
    lab3.layer.cornerRadius = 50;
    lab3.layer.borderColor = Gray.CGColor;
    lab3.layer.borderWidth = 1.0;
    
    
    lab1.text = [NSString stringWithFormat:@"%@",self.arrList.firstObject[0]];
    lab2.text = [NSString stringWithFormat:@"%@",self.arrList.firstObject[1]];
    lab3.text = [NSString stringWithFormat:@"%@",self.arrList.firstObject[2]];
    
}

- (void)crertView5{
    
    UILabel *lab1 = [[UILabel alloc]init];
    [self.view addSubview:lab1];
    lab1.font = [UIFont fontWithName:@"Georgia-Italic" size:26];
    lab1.textColor = [UIColor purpleColor];
    lab1.textAlignment = NSTextAlignmentCenter;
    lab1.backgroundColor = [UIColor greenColor];
    lab1.frame = CGRectMake(100, 130, 100, 100);
    lab1.layer.masksToBounds = YES;
    lab1.layer.cornerRadius = 50;
    lab1.layer.borderColor = Gray.CGColor;
    lab1.layer.borderWidth = 1.0;
    
    UILabel *lab2 = [[UILabel alloc]init];
    [self.view addSubview:lab2];
    lab2.font = [UIFont fontWithName:@"Georgia-Italic" size:26];
    lab2.textColor = [UIColor whiteColor];
    lab2.textAlignment = NSTextAlignmentCenter;
    lab2.backgroundColor = [UIColor yellowColor];
    lab2.frame = CGRectMake(140, 250, 100, 100);
    lab2.layer.masksToBounds = YES;
    lab2.layer.cornerRadius = 50;
    lab2.layer.borderColor = Gray.CGColor;
    lab2.layer.borderWidth = 1.0;
    
    UILabel *lab3 = [[UILabel alloc]init];
    [self.view addSubview:lab3];
    lab3.font = [UIFont fontWithName:@"Georgia-Italic" size:26];
    lab3.textColor = [UIColor whiteColor];
    lab3.textAlignment = NSTextAlignmentCenter;
    lab3.backgroundColor = [UIColor blueColor];
    lab3.frame = CGRectMake(30, 400, 100, 100);
    lab3.layer.masksToBounds = YES;
    lab3.layer.cornerRadius = 50;
    lab3.layer.borderColor = Gray.CGColor;
    lab3.layer.borderWidth = 1.0;
    
    UILabel *lab4 = [[UILabel alloc]init];
    [self.view addSubview:lab4];
    lab4.font = [UIFont fontWithName:@"Georgia-Italic" size:26];
    lab4.textColor = [UIColor redColor];
    lab4.textAlignment = NSTextAlignmentCenter;
    lab4.backgroundColor = [UIColor darkGrayColor];
    lab4.frame = CGRectMake(200, 100, 100, 100);
    lab4.layer.masksToBounds = YES;
    lab4.layer.cornerRadius = 50;
    lab4.layer.borderColor = Gray.CGColor;
    lab4.layer.borderWidth = 1.0;
    
    UILabel *lab5 = [[UILabel alloc]init];
    [self.view addSubview:lab5];
    lab5.font = [UIFont fontWithName:@"Georgia-Italic" size:26];
    lab5.textColor = [UIColor yellowColor];
    lab5.textAlignment = NSTextAlignmentCenter;
    lab5.backgroundColor = [UIColor purpleColor];
    lab5.frame = CGRectMake(30, 270, 100, 100);
    lab5.layer.masksToBounds = YES;
    lab5.layer.cornerRadius = 50;
    lab5.layer.borderColor = Gray.CGColor;
    lab5.layer.borderWidth = 1.0;
    
    
    lab1.text = [NSString stringWithFormat:@"%@",self.arrList.firstObject[0]];
    lab2.text = [NSString stringWithFormat:@"%@",self.arrList.firstObject[1]];
    lab3.text = [NSString stringWithFormat:@"%@",self.arrList.firstObject[2]];
    lab4.text = [NSString stringWithFormat:@"%@",self.arrList.firstObject[3]];
    lab5.text = [NSString stringWithFormat:@"%@",self.arrList.firstObject[4]];

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
