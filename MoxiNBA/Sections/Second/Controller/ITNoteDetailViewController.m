//
//  ITNoteDetailViewController.m
//  inrtest
//
//  Created by 张涛 on 2017/4/26.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import "ITNoteDetailViewController.h"

@interface ITNoteDetailViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation ITNoteDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"back1"] forState:UIControlStateNormal];
    btn.frame = CGRectMake(10, 10, 24, 24);
    [btn addTarget:self action:@selector(leftBtn) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.titleView = [UILabel titleWithColor:[UIColor grayColor] title:@"Release" font:scaleWithSize(24)];
    
    [self createViews];
    //    [self createRightBtn];
    // Do any additional setup after loading the view.
}
- (void)leftBtn{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}


- (void)createViews {
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.frame];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
    
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
