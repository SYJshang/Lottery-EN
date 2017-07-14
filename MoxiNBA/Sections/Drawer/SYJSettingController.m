//
//  SYJSettingController.m
//  MoxiNBA
//
//  Created by 尚勇杰 on 2017/6/29.
//  Copyright © 2017年 尚勇杰. All rights reserved.
//

#import "SYJSettingController.h"
#import "SYJTitleCell.h"
#import "YJCache.h"

@interface SYJSettingController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;


@end

@implementation SYJSettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.backgroundColor = Gray;
    [self.view addSubview:self.tableView];
    self.tableView.separatorColor = [UIColor clearColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor clearColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"back1"] forState:UIControlStateNormal];
    btn.frame = CGRectMake(10, 10, 24, 24);
    [btn addTarget:self action:@selector(leftBtn) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.titleView = [UILabel titleWithColor:[UIColor whiteColor] title:@"设置" font:18];
    
}

- (void)leftBtn{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

#pragma mark - table view dataSource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 20;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SYJTitleCell *cell = [SYJTitleCell cellWithTableView:tableView];
    if (indexPath.section == 0) {
        cell.icon.image = [UIImage imageNamed:@"版本"];
        cell.nameLab.text = @"versions";
        return cell;

    }else if(indexPath.section == 1){
        
        cell.icon.image = [UIImage imageNamed:@"清除"];
        cell.nameLab.text = @"Clear the cache";
        return cell;


    }else{
        
        return cell;
    }
    
}

#pragma mark - table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if (indexPath.section == 0) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"hint" message:@"The current version: 2.6.6" delegate:nil cancelButtonTitle:@"OKay" otherButtonTitles: nil];
        [alert show];
    }else{
        float cache = [YJCache filePath];
        NSString *str = [NSString stringWithFormat:@"%.2f Mb",cache];
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"hint" message:[NSString stringWithFormat:@"claer %@ Mb cache",str] delegate:nil cancelButtonTitle:@"Thanks" otherButtonTitles:nil];
        [alert show];
        [YJCache clearFile];
    }
    
//    kTipAlert(@"<%ld> selected...", indexPath.row);
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
