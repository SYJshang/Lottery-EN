//
//  LTMyLottoryNumTableViewController.m
//  Lottery
//
//  Created by Wen YanFei on 2017/6/29.
//  Copyright © 2017年 Wen YanFei. All rights reserved.
//

#import "LTMyLottoryNumTableViewController.h"
#import "LTLotteryBookCell.h"
#import "LTLotteryPlaySelectNumGroupMod.h"
#import "AppDelegate.h"
#import "LTLotteryPickNumberCatch.h"
#import "SYJTabBarController.h"

@interface LTMyLottoryNumTableViewController ()
@property (nonatomic, strong)NSArray<LTLotteryPlaySelectNumGroupMod*> *lessThrDayNums;
@property (nonatomic, strong)NSArray<LTLotteryPlaySelectNumGroupMod*> *morThanThrDayNums;
@property (nonatomic, weak)UIView *emptyView;
@end

@implementation LTMyLottoryNumTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setup];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"back1"] forState:UIControlStateNormal];
    btn.frame = CGRectMake(10, 10, 24, 24);
    [btn addTarget:self action:@selector(leftBtn) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.titleView = [UILabel titleWithColor:[UIColor whiteColor] title:@"收藏" font:18];
    
}

- (void)leftBtn{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}


-(void)toHomePage{
    [(SYJTabBarController *) self.tabBarController setSelected:0];
}

- (UIView *)emptyView{
    if (!_emptyView) {
        UIView *emptyView = [[UIView alloc]initWithFrame:CGRectMake(0, (kScreenHeight - 300)/2, kScreenWidth, 300)];
        
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake((kScreenWidth - 200)/2, 80, 200, 60)];
        btn.titleLabel.numberOfLines = 0;
        btn.layer.cornerRadius = 6;
        btn.layer.borderWidth = 2;
        [btn setTitle:@"还没有彩票记录\n马上去挑选吧" forState:(UIControlStateNormal)];
        [btn setTitleColor:TextColor forState:(UIControlStateNormal)];
        //    [btn setBackgroundColor:[UIColor whiteColor]];
        [btn addTarget:self action:@selector(toHomePage) forControlEvents:(UIControlEventTouchUpInside)];
        [emptyView addSubview:btn];
        
        [self.view addSubview:emptyView];
        _emptyView = emptyView;
    }
    return _emptyView;
}

- (void)setup{
    [self setUpData];
    
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc]initWithTitle:@"去选号" style:(UIBarButtonItemStyleDone) target:self action:@selector(toHomePage)]];
    
    [self.tableView registerClass:[LTLotteryBookCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[UITableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:@"header"];
    self.tableView.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    self.tableView.estimatedRowHeight = 80;
    
}

- (void)setUpData{
    NSArray *arrBas = [[LTLotteryPickNumberCatch shardeCatch].numberList sortedArrayUsingComparator:^NSComparisonResult(LTLotteryPlaySelectNumGroupMod*  _Nonnull obj1, LTLotteryPlaySelectNumGroupMod*  _Nonnull obj2) {
        NSTimeInterval time1 = [obj1.savedDate timeIntervalSince1970];
        NSTimeInterval time2 = [obj2.savedDate timeIntervalSince1970];
        return time1 == time2? NSOrderedSame: (time1>time2? NSOrderedAscending:NSOrderedDescending);
    }];
    
    NSInteger index = [self indexAtMorThanThrDayInNums:arrBas];
    _lessThrDayNums = [arrBas subarrayWithRange:NSMakeRange(0, index)];
    _morThanThrDayNums = [arrBas subarrayWithRange:NSMakeRange(index, arrBas.count - index)];
    
    if (arrBas.count == 0) {
        self.emptyView.hidden = NO;
    }else{
        _emptyView.hidden = YES;
    }
}

- (NSInteger)indexAtMorThanThrDayInNums:(NSArray<LTLotteryPlaySelectNumGroupMod*>*)arry{
    NSCalendar *calc = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierISO8601];
    
    NSDateComponents *now = [calc components:(NSCalendarUnitDay|NSCalendarUnitMonth|NSCalendarUnitYear) fromDate:[NSDate date]];
    
    [now setDay:now.day-3];
    NSTimeInterval thrDayAgoTimeInterval = [[calc dateFromComponents:now] timeIntervalSince1970];
    
    NSInteger i = 0;
    for (; i < arry.count; i ++) {
        NSTimeInterval day = [arry[i].savedDate timeIntervalSince1970];
        if (day < thrDayAgoTimeInterval) {
            return i;
        }
    }
    return i;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setUpData];
    [self.tableView reloadData];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _morThanThrDayNums.count>0? 2:1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return section == 0 ?_lessThrDayNums.count:_morThanThrDayNums.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return section == 0 ? 0 : 24;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return section == 0 ? (_lessThrDayNums.count > 0 ? 12 : 0): 24;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [UIView new];
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UITableViewHeaderFooterView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"header"];
    
    UILabel *titleV = [view.contentView viewWithTag:1000];
    if (!titleV) {
        titleV = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 24)];
        titleV.tag = 1000;
        titleV.text = @"三天前";
        titleV.font = [UIFont systemFontOfSize:13];
        titleV.textAlignment = NSTextAlignmentCenter;
        titleV.textColor = [UIColor colorWithWhite:0.4 alpha:1];
        [view.contentView addSubview:titleV];
        
        titleV.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1];
    }
    
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *arr = indexPath.section == 0 ?_lessThrDayNums:_morThanThrDayNums;
    
    LTLotteryBookCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    LTLotteryPlaySelectNumGroupMod *model = arr[indexPath.row];
    cell.model = model;
    cell.alpha = indexPath.section == 0 ? 1 :0.5;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray<LTLotteryPlaySelectNumGroupMod*> *arr = indexPath.section == 0 ?_lessThrDayNums:_morThanThrDayNums;
    return arr[indexPath.row].cellHeight;
}

@end
