//
//  LTNumberPickingTableVC.m
//  Lottery
//
//  Created by Wen YanFei on 2017/6/28.
//  Copyright © 2017年 Wen YanFei. All rights reserved.
//

#import "LTNumberPickingTableVC.h"
#import "LTChosePlayRuleV.h"
#import "LTLotteryPlayMode.h"
#import "LTChoseNumTitleV.h"
#import "LTPickingBallCell.h"
#import "LTLotteryInfoMode.h"
#import "LTLotteryPlaySelectNumMode.h"
#import "LTPickingBallBottomBar.h"
#import "LTLotteryPlaySelectNumGroupMod.h"
#import "LTPickHeaderV.h"
#import "LTLotteryPickNumberCatch.h"
#import <AudioToolbox/AudioToolbox.h>

@interface LTNumberPickingTableVC ()<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic,weak)LTChosePlayRuleV *chosePlayRuleV;
@property(nonatomic,weak)UITableView *tableView;
@property(nonatomic,weak)LTLotteryPlayMode* chosePlay;
@property(nonatomic,weak)LTPickingBallBottomBar* bottomBar;
@property(nonatomic, strong)NSArray<LTLotteryPlaySelectNumMode*> *playSelectNumsList;


@property(nonatomic, weak)LTChoseNumTitleV *titleView;
@end

@implementation LTNumberPickingTableVC

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
 
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"back1"] forState:UIControlStateNormal];
    btn.frame = CGRectMake(10, 10, 24, 24);
    [btn addTarget:self action:@selector(leftBtn) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];

}

- (void)leftBtn{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupView];
}

- (void)setChosePlay:(LTLotteryPlayMode *)chosePlay{
    _chosePlay = chosePlay;
    
    NSMutableArray *mArr = [NSMutableArray array];
    for (int i = 0 ; i < chosePlay.set.count; i ++) {
        LTLotteryPlaySelectNumMode *model = [LTLotteryPlaySelectNumMode new];
        model.model = chosePlay.set[i];
        __weak typeof(self) weakSelf = self;
        [model setChaned:^{
            [weakSelf selectNumChange];
        }];
        [mArr addObject:model];
    }
    self.playSelectNumsList = mArr;
}

- (void)selectNumChange{
    long long sum = self.playSelectNumsList[0].count;
    
    for (int i = 1; i < self.playSelectNumsList.count; i ++) {
        sum *= self.playSelectNumsList[i].count;
    }
    
    self.bottomBar.count = sum;
}

- (void)setupView{
    
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc]initWithTitle:@"随机一注" style:(UIBarButtonItemStyleDone) target:self action:@selector(toBookPage)]];
    
    
    UITableView *tableV = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, KSceenW, KSceenH - 64)];
    [tableV registerClass:[LTPickingBallCell class] forCellReuseIdentifier:@"cell"];
    tableV.delegate = self;
    tableV.dataSource = self;
    tableV.tableHeaderView =  [[LTPickHeaderV alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 40)];
    [tableV setSeparatorStyle:(UITableViewCellSeparatorStyleNone)];
    tableV.estimatedRowHeight = 200;
    tableV.tableFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 49)];
    [self.view addSubview:tableV];
    self.tableView = tableV;
    self.tableView.backgroundColor = [UIColor clearColor];
    
    LTPickingBallBottomBar *bottomBar = [[LTPickingBallBottomBar alloc] initWithFrame:CGRectMake(0, KSceenH - 49 - 64, KSceenW, 49)];
    [self.view addSubview:bottomBar];
    __weak typeof(self) weakSelf = self;
    [bottomBar setComplete:^{
        [weakSelf complete];
    }];
    [bottomBar setClear:^{
        [weakSelf setChosePlay:_chosePlay];
        self.bottomBar.count = 0;
        [weakSelf.tableView reloadData];
    }];
    self.bottomBar = bottomBar;
    
    self.view.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    
    LTChosePlayRuleV * v = [[LTChosePlayRuleV alloc]initWithFrame:CGRectMake(0, 0, KSceenW, KSceenH - 108)];
    [self.view addSubview:v];
    v.alpha  = 0;
    self.chosePlayRuleV = v;
    
    [v setPlayChange:^(LTChosePlayRuleV * chosePlayRuleV){
        weakSelf.title =chosePlayRuleV.play.fullName.length > 1 ? chosePlayRuleV.play.fullName: self.lotteryInfo.title;
        [_titleView setTitle:chosePlayRuleV.play.fullName forState:(UIControlStateNormal)];
        _titleView.selected = NO;
        [UIView animateWithDuration:0.25 animations:^{
            weakSelf.chosePlayRuleV.alpha = 0;
        }];
        
        weakSelf.chosePlay = chosePlayRuleV.play;
        
        [weakSelf.tableView reloadData];
    }];
    v.lotteryInfo = self.lotteryInfo;
    
    if (v.playList.count > 1) {
        [self titleView];
    }
    
    [UIApplication sharedApplication].applicationSupportsShakeToEdit = YES;
    [self becomeFirstResponder];
}

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    
}
- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    if(motion == UIEventSubtypeMotionShake){
        [self randomPick];
    }
}

- (void)randomPick{
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    for (LTLotteryPlaySelectNumMode *model in self.playSelectNumsList) {
        NSInteger needCount = model.model.minNum;
        NSMutableArray*lessIndex = [NSMutableArray arrayWithCapacity:model.model.memberArr.count];
        for (int i = 0; i < model.model.memberArr.count; i++) {
            [lessIndex addObject:@(i)];
        }
        NSMutableArray *selectIndex = [NSMutableArray arrayWithCapacity:needCount];
        for (int i = 0; i < needCount; i++) {
            NSInteger index = arc4random_uniform(lessIndex.count);
            [selectIndex addObject:lessIndex[index]];
            [lessIndex removeObjectAtIndex:index];
        }
        model.selectIndexs = [selectIndex copy];
    }
    [self.tableView reloadData];
}

- (void)toBookPage{
    
    for (LTLotteryPlaySelectNumMode *model in self.playSelectNumsList) {
        NSInteger needCount = model.model.minNum;
        NSMutableArray*lessIndex = [NSMutableArray arrayWithCapacity:model.model.memberArr.count];
        for (int i = 0; i < model.model.memberArr.count; i++) {
            [lessIndex addObject:@(i)];
        }
        NSMutableArray *selectIndex = [NSMutableArray arrayWithCapacity:needCount];
        for (int i = 0; i < needCount; i++) {
            NSInteger index = arc4random_uniform(lessIndex.count);
            [selectIndex addObject:lessIndex[index]];
            [lessIndex removeObjectAtIndex:index];
        }
        model.selectIndexs = [selectIndex copy];
    }
    [self.tableView reloadData];
}

- (LTChoseNumTitleV *)titleView{
    if (!_titleView) {
        LTChoseNumTitleV *titleView = [[LTChoseNumTitleV alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
        [titleView setTitle:self.title forState:(UIControlStateNormal)];
        [titleView setTitle:@"选择模式" forState:(UIControlStateSelected)];
        [titleView addTarget:self action:@selector(titleClick:) forControlEvents:(UIControlEventTouchUpInside)];
        [titleView setTitleColor:[UIColor colorWithWhite:0.1 alpha:1] forState:(UIControlStateNormal)];
        [titleView setTitleColor:[UIColor colorWithWhite:0.1 alpha:1] forState:(UIControlStateSelected)];
        self.navigationItem.titleView = titleView;
        _titleView = titleView;
    }
    return  _titleView;
}

- (void)titleClick:(UIButton*)title{
    title.selected = !title.selected;
    if (title.selected)[self.view bringSubviewToFront:self.chosePlayRuleV];
    [UIView animateWithDuration:0.25 animations:^{
        self.chosePlayRuleV.alpha = title.selected? 1 : 0;
    }];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.chosePlay.set.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LTPickingBallCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.model = self.chosePlay.set[indexPath.row];
    cell.selectNum = self.playSelectNumsList[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return  self.chosePlay.set[indexPath.row].cellHeight;
}

- (void)complete{
    if (self.bottomBar.count <= 0) {
        [SVProgressHUD showErrorWithStatus:@"请至少选足\n一注号码"];
    }else{
        LTLotteryPlaySelectNumGroupMod* model = [LTLotteryPlaySelectNumGroupMod new];
        model.lotteryInfo = self.lotteryInfo;
        model.play = self.chosePlay;
        NSMutableArray *mArr = [NSMutableArray arrayWithCapacity:self.playSelectNumsList.count];
        for (int i = 0; i<self.playSelectNumsList.count; i ++) {
            [mArr addObject:[self.playSelectNumsList[i] copy]];
        }
        model.selectNums = [mArr copy];
        model.savedDate = [NSDate date];
        
        [[LTLotteryPickNumberCatch shardeCatch] addNumberGrounp:model];
        
        [SVProgressHUD showInfoWithStatus:@"当前积分不够，无法完成投注，已为你加入收藏！"];
    }
}

@end
