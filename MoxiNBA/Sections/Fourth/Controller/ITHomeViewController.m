//
//  ITHomeViewController.m
//  inrtest
//
//  Created by 张涛 on 2017/5/6.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import "ITHomeViewController.h"
#import "ITHomeTableViewCell.h"
#import "ITKaiJiangViewController.h"
#import "ITMatchDetailViewController.h"
#import "ITZhiShiViewController.h"
#import "SYJFourthController.h"
#import "ITBaoGaoViewController.h"
#import "ITNewsViewController.h"
#import "ITSelectNumberViewController.h"
#import "ITZhiShiViewController.h"
#import "SYJNBAGameController.h"
#import "SYJListCell.h"
#import "WTHomeViewController.h"

#define Kwidths  ([UIScreen mainScreen].bounds.size.width / 3)

@interface ITHomeViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *listArr;

@property (nonatomic, strong) NSMutableArray *listImgArr;


@end

@implementation ITHomeViewController

- (NSMutableArray *)listArr{
    
    if (_listArr == nil) {
        _listArr = [NSMutableArray arrayWithObjects:@"开奖结果",@"足球",@"篮球",@"球队信息",@"排列三",@"排列五",@"天气",@"彩票商店",nil];
    }
    
    return _listArr;
    
}

- (NSMutableArray *)listImgArr{
    
    if (_listImgArr == nil) {
        
        //        NSDictionary *dict = [@"":@""];
        
        _listImgArr = [NSMutableArray arrayWithObjects:@"award",@"足球",@"篮球",@"team",@"随机",@"随机1",@"weather",@"shop",nil];
    }
    
    return _listImgArr;
    
}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    self.navigationItem.titleView = [UILabel titleWithColor:[UIColor lightGrayColor] title:@"更多" font:18.0];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    NSDictionary *dicts = [[NSUserDefaults standardUserDefaults] objectForKey:@"NBALogo"];
//    self.listArr = (NSMutableArray *)[dicts allValues];
//    self.listImgArr = (NSMutableArray *)[dicts allKeys];
    
    //创建瀑布流布局
    //创建CollectionView
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KSceenW, KSceenH - 108) style:UITableViewStylePlain];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.tableView.backgroundColor = [UIColor clearColor];
    
    [self.tableView registerClass:[SYJListCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:self.tableView];

    

    // Do any additional setup after loading the view.
}


#pragma mark - table view dataSource

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 45;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.listArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SYJListCell *cell = [SYJListCell cellWithTableView:tableView];
    cell.iconImg.image = [UIImage imageNamed:self.listImgArr[indexPath.section]];
    cell.nameLab.text = self.listArr[indexPath.section];
    
    
    return cell;
}

#pragma mark - table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if (indexPath.section == 0) {
        ITKaiJiangViewController *vc = [[ITKaiJiangViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.section == 1){
        ITMatchDetailViewController *vc = [[ITMatchDetailViewController alloc]init];
        vc.type = 0;
        [self.navigationController pushViewController:vc animated:YES];
        //        }else{
        //            vc.type = 1;
        //        }
    }else if(indexPath.section == 2){
        SYJNBAGameController *vc = [[SYJNBAGameController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.section == 3){
        SYJFourthController *vc = [[SYJFourthController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.section == 4){
        ITSelectNumberViewController *vc = [[ITSelectNumberViewController alloc]init];
        //        if (indexPath.row == 0) {
        //            vc.type = 5;
        //        }else{
        vc.type = 3;
        //        }
        [self.navigationController pushViewController:vc animated:YES];
    }else if(indexPath.section == 5){
        ITSelectNumberViewController *vc = [[ITSelectNumberViewController alloc]init];
        vc.type = 5;
        [self.navigationController pushViewController:vc animated:YES];
    }else if(indexPath.section == 6){
        WTHomeViewController *vc = [[WTHomeViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }else{
        ITZhiShiViewController *vc = [[ITZhiShiViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
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
