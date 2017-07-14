//
//  SYJInfoVC.m
//  MoxiNBA
//
//  Created by 尚勇杰 on 2017/7/13.
//  Copyright © 2017年 尚勇杰. All rights reserved.
//

#import "SYJInfoVC.h"

@interface SYJInfoVC ()

@end

@implementation SYJInfoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *name = [[UILabel alloc]init];
    [self.view addSubview:name];
    name.font = [UIFont systemFontOfSize:18.0];
    name.textColor = [UIColor blackColor];
    name.numberOfLines = 0;
    name.textAlignment = NSTextAlignmentCenter;
    name.sd_layout.centerXEqualToView(self.view).centerYEqualToView(self.view).heightIs(80).widthIs(240);
    name.text = self.str;
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"back1"] forState:UIControlStateNormal];
    btn.frame = CGRectMake(10, 10, 24, 24);
    [btn addTarget:self action:@selector(leftBtn) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.titleView = [UILabel titleWithColor:[UIColor whiteColor] title:@"详情" font:18];
    
}

- (void)leftBtn{
    
    [self.navigationController popViewControllerAnimated:YES];
    
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
