//
//  ITSelectNumberViewController.m
//  inrtest
//
//  Created by 张涛 on 2017/5/9.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import "ITSelectNumberViewController.h"
#import "ITSelectNumTableViewCell.h"

@interface ITSelectNumberViewController ()<UITableViewDelegate, UITableViewDataSource, ITSelectNumTableViewCellDelegate>

@property (nonatomic, strong) NSMutableArray *numArr;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) BOOL isOne;
@property (nonatomic, assign) NSInteger touchCount;

@end

@implementation ITSelectNumberViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createViews];
    self.navigationItem.titleView = [UILabel titleWithColor:TextColor title:@"Radom" font:18];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(20, 20, 20, 20);
    //    [self.chageButton setBackgroundColor:[UIColor redColor]];
    [btn setImage:[UIImage imageNamed:@"back1"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    // Do any additional setup after loading the view.
}

- (void)back{
    
    [self.navigationController popViewControllerAnimated:YES];
}


- (NSMutableArray *)numArr{
    if (!_numArr) {
        _numArr = [NSMutableArray array];
    }
    return _numArr;
}

- (void) createViews {
    
    if (_type == 5) {
        _numArr = [NSMutableArray arrayWithObjects:@"0", @"0", @"0", @"0", @"0", nil];
    }else if (_type == 3){
        _numArr = [NSMutableArray arrayWithObjects:@"0", @"0", @"0", nil];
    }else{
        _numArr = [NSMutableArray arrayWithObjects:@"0", @"0", @"0", @"0", @"0", @"0", @"0", nil];
    }
    
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, screen_width, screen_height - 114)];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.rowHeight = scaleWithSize(140);
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screen_width, scaleWithSize(40))];
    tableView.tableHeaderView = headerView;
    
    UIView *line = [[UIView alloc]init];
    line.backgroundColor = Color(193, 193, 193, 1);
    [headerView addSubview:line];
    
    UIButton *selectNum = [UIButton buttonWithType:UIButtonTypeCustom];
    [selectNum setTitle:@"random" forState:UIControlStateNormal];
    selectNum.backgroundColor = [UIColor grayColor];
    [selectNum addTarget:self action:@selector(selectNumbers) forControlEvents:UIControlEventTouchUpInside];
    selectNum.titleLabel.font = fontSize(scaleWithSize(16));
    selectNum.layer.cornerRadius = 5;
    selectNum.layer.masksToBounds = YES;
//    [selectNum setTitleColor:Color(193, 193, 193, 1) forState:UIControlStateNormal];
    [headerView addSubview:selectNum];
    
    [selectNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(scaleWithSize(-20));
        make.centerY.equalTo(headerView.mas_centerY);
        make.width.mas_lessThanOrEqualTo(scaleWithSize(100));
        make.height.mas_equalTo(scaleWithSize(25));
    }];
    
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.bottom.mas_equalTo(headerView.mas_bottom);
        make.size.mas_equalTo(CGSizeMake(screen_width, 1));
    }];
    
    UIView *bottomView = [[UIView alloc]init];
    bottomView.backgroundColor = Color(250, 67, 67, 1);
    [self.view addSubview:bottomView];
    
    UIButton *confirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [confirmBtn setTitle:@"Favorite" forState:UIControlStateNormal];
    confirmBtn.titleLabel.font = fontSize(scaleWithSize(16));
    confirmBtn.layer.cornerRadius = 5;
    [confirmBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    confirmBtn.backgroundColor = [UIColor whiteColor];
    [confirmBtn addTarget:self action:@selector(collectNumbers) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:confirmBtn];
    
    UIButton *cleanUpBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [cleanUpBtn setTitle:@"Zero" forState:UIControlStateNormal];
    cleanUpBtn.layer.borderColor = [UIColor blackColor].CGColor;
    cleanUpBtn.layer.borderWidth = 0.5;
    cleanUpBtn.layer.cornerRadius = 5;
    cleanUpBtn.layer.masksToBounds = YES;
    [cleanUpBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    cleanUpBtn.titleLabel.font = fontSize(scaleWithSize(16));
    cleanUpBtn.backgroundColor = [UIColor whiteColor];
    [cleanUpBtn addTarget:self action:@selector(cleanUpNumbers) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:cleanUpBtn];
    
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@0);
        make.bottom.mas_equalTo(self.view.mas_bottom);
        make.size.mas_equalTo(CGSizeMake(screen_width, scaleWithSize(50)));
    }];
    
    [confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(scaleWithSize(-16));
        make.centerY.mas_equalTo(bottomView.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(scaleWithSize(60), scaleWithSize(30)));
    }];
    
    [cleanUpBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(scaleWithSize(16));
        make.centerY.mas_equalTo(bottomView.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(scaleWithSize(60), scaleWithSize(30)));
    }];
    
}

- (void)selectNumbers {
    
//    [_numArr removeAllObjects];
    
    __weak typeof(self) weakSelf = self;
    for (int i = 0; i < _numArr.count; i++) {
        NSInteger random = arc4random() % 10;
        id randomNum = @(random);
        [weakSelf.numArr replaceObjectAtIndex:i withObject:randomNum];
    }
//    [self.tableView reloadData];
    for (int i = 0; i < _numArr.count; i++) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(i * 0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:i inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
        });
    }
}

- (void)collectNumbers {
    if (_numArr.count) {
        NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
        NSMutableArray *arr = [NSMutableArray array];
        [arr addObject:_numArr];
        [userDefault setObject:arr forKey:@"myCollect"];
        [userDefault synchronize];
        [SVProgressHUD showSuccessWithStatus:@"Success"];
    }else{
        [SVProgressHUD showErrorWithStatus:@"Select First！"];
    }
    
}

- (void)didButtonClick:(NSInteger)number index:(NSInteger)index{
    id numberId = @(number);
    _isOne = YES;
//    _number = number;
//    NSIndexPath *indexPath=[NSIndexPath indexPathForRow:index inSection:0];
//    [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationNone];
    __weak typeof(self)  weakSelf = self;
//    NSMutableArray *arr = [NSMutableArray arrayWithObjects:@"0", @"0", @"0", @"0", @"0", nil];
    [weakSelf.numArr replaceObjectAtIndex:index withObject:numberId];
//    [weakSelf.numArr addObjectsFromArray:arr];
    [weakSelf.tableView reloadData];
    
}

- (void)cleanUpNumbers {
    if (_type == 3) {
        _numArr = [NSMutableArray arrayWithObjects:@"0", @"0", @"0", nil];
    }else{
        _numArr = [NSMutableArray arrayWithObjects:@"0", @"0", @"0", @"0", @"0", nil];
    }
    
//    [_numArr removeAllObjects];
    [self.tableView reloadData];
//    for (int i = 0; i < _numArr.count; i++) {
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(i * 0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:i inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
//        });
//    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _numArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ITSelectNumTableViewCell *cell = [ITSelectNumTableViewCell cellWithTableView:tableView];
    cell.delegate = self;
    NSInteger index = [_numArr[indexPath.row] integerValue];
    cell.row = indexPath.row;
    cell.type = _type;
    cell.index = index;
//    cell.isClean = !_numArr.count;
    
//    if (_isOne) {
////        cell.index = _number;
//    }else{
//        if (_numArr.count) {
//            NSInteger index = [_numArr[indexPath.row] integerValue];
//            
//            cell.index = index;
//        }else{
//            
//            cell.index = 0;
//        }
//    }
    if (indexPath.row == _numArr.count - 1) {
        cell.line.hidden = YES;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
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
