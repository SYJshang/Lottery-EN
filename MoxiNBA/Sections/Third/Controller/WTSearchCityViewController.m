//
//  WTSearchCityViewController.m
//  inrtest
//
//  Created by zt on 2017/5/31.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import "WTSearchCityViewController.h"

@interface WTSearchCityViewController ()<UISearchResultsUpdating, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource>

//搜索控制器
@property (nonatomic, strong) UISearchController *searchController;
//存放tableView中显示数据的数组
@property (nonatomic, strong) NSMutableArray  *dataList;
//存放搜索列表中显示数据的数组
@property (nonatomic, strong) NSMutableArray  *searchList;

@property (nonatomic, strong) NSMutableArray  *Ids;

@property (nonatomic, strong) NSMutableArray  *searchIds;

@property (nonatomic, strong) NSMutableArray  *weather;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) UIButton *closeButton;

@property (nonatomic, weak) UIView *headerView;

@property (nonatomic, weak) UISearchBar *searchBar;

@end

@implementation WTSearchCityViewController

- (NSMutableArray *) dataList{
    if (!_dataList) {
        _dataList = [NSMutableArray array];
    }
    return _dataList;
}

- (NSMutableArray *) Ids{
    if (!_Ids) {
        _Ids = [NSMutableArray array];
    }
    return _Ids;
}

- (NSMutableArray *) searchList{
    if (!_searchList) {
        _searchList = [NSMutableArray array];
    }
    return _searchList;
}

//
//- (NSMutableArray *) weather{
//    if (!_weather) {
//        _weather = [NSMutableArray array];
//    }
//    return _weather;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setCityDatas];
    
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screen_width, 64)];
    headerView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:headerView];
    self.headerView = headerView;
    
    UIButton *closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [closeButton setImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
    closeButton.frame = CGRectMake(screen_width + 20, (headerView.frame.size.height - 32) / 2, 32, 32);
    [closeButton addTarget:self action:@selector(closeSearch:) forControlEvents:UIControlEventTouchUpInside];
    self.closeButton = closeButton;
    [headerView addSubview:closeButton];
    
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, scaleWithSize(44))];
    searchBar.searchBarStyle = UISearchBarStyleMinimal;
    UITextField *searchField = [searchBar valueForKey:@"searchField"];
    searchField.textColor = [UIColor whiteColor];
//    [searchField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    searchBar.placeholder = @"search";
    [self.headerView addSubview:searchBar];
    searchBar.delegate = self;
    self.searchBar = searchBar;
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, screen_width, screen_height - 64)];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    //初始化数组并赋值
//    self.dataList=[NSMutableArray arrayWithCapacity:100];
//    for (NSInteger i=0; i<100; i++) {
//        [self.dataList addObject:[NSString
//                                  stringWithFormat:@"%ld-FlyElephant",(long)i]];
//    }
    
//    //初始化UISearchController并为其设置属性
//    _searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
//    //设置代理对象
//    _searchController.searchResultsUpdater = self;
//    //设置搜索时，背景变暗色            _searchController.dimsBackgroundDuringPresentation = NO;
//    //设置搜索时，背景变模糊
//    _searchController.obscuresBackgroundDuringPresentation = NO;
//    //隐藏导航栏                  _searchController.hidesNavigationBarDuringPresentation = NO;
//    //设置搜索框的frame
//    _searchController.searchBar.frame = CGRectMake(self.searchController.searchBar.frame.origin.x, self.searchController.searchBar.frame.origin.y, self.searchController.searchBar.frame.size.width, 44.0);
//    //将搜索框设置为tableView的组头
//    self.tableView.tableHeaderView = self.searchController.searchBar;
    
    // Do any additional setup after loading the view.
}

#pragma mark 点击取消按钮
- (void)closeSearch:(UIButton *)button{
    [self.searchBar resignFirstResponder];
    self.searchBar.text  = @"";
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.navigationController popViewControllerAnimated:YES];
    });
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    CGFloat left = screen_width - 44;
    [UIView animateWithDuration:0.4 animations:^{
        self.searchBar.frame = CGRectMake(0, 20, left, scaleWithSize(44));
//        self.closeButton.left = left;
        self.closeButton.frame = CGRectMake(left, 26, 32, 32);
    }];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    NSPredicate *preicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[c] %@", searchText];
    //如果搜索数组中存在对象，即上次搜索的结果，则清除这些对象
    if (self.searchList!= nil) {
        [self.searchList removeAllObjects];
    }
    //通过过滤条件过滤数据
    for (NSDictionary *dic in _dataList) {
        NSArray *arr = @[dic[@"name"]];
        if ([[NSMutableArray arrayWithArray:[arr filteredArrayUsingPredicate:preicate]] count] != 0) {
            [self.searchList addObject:dic];
        }
        
    }
    
    //刷新表格
    [self.tableView reloadData];
}

- (void)setCityDatas{
//    __weak typeof(self)  weakSelf = self;
    NSString *path = [[NSBundle mainBundle] pathForResource:@"cityInfo" ofType:@"json"];
    NSData *jsonData = [NSData dataWithContentsOfFile:path options:NSDataReadingMappedIfSafe error:nil];
    NSMutableArray *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
    NSMutableArray *arr = [NSMutableArray array];
    NSDictionary *dict;
    for (int i = 0; i < dic.count; i++) {
        
//        [self.Ids addObject:dic[i][@"id"]];
        dict = @{
                 @"name": dic[i][@"name"],
                 @"id": dic[i][@"id"]
                 };
        [arr addObject:dict];
    }
    
    [self.dataList addObjectsFromArray:arr];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.searchList count];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
//    if (self.searchController.active) {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    NSArray *arr = [userDefaults objectForKey:@"weather"];
    NSMutableArray *weather = [NSMutableArray arrayWithCapacity:arr.count + 1];
    NSDictionary *dic = self.searchList[indexPath.row];
    [weather addObjectsFromArray:arr];
    [weather addObject:dic];
    [userDefaults setObject:weather forKey:@"weather"];
    [self.navigationController popViewControllerAnimated:YES];
//    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return scaleWithSize(50);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    if (self.searchList.count != 0) {
        NSDictionary *dic = self.searchList[indexPath.row];
        cell.textLabel.textColor = [UIColor darkGrayColor];
        [cell.textLabel setText:dic[@"name"]];
    }
    cell.backgroundColor = [UIColor clearColor];
    //如果搜索框被激活，就显示搜索数组的内容，否则显示数据数组的内容
//    if (self.searchController.active) {
//        [cell.textLabel setText:self.searchList[indexPath.row]];
//    }
//    else{
//        [cell.textLabel setText:self.dataList[indexPath.row]];
//    }
    return cell;
}
//
//-(void)updateSearchResultsForSearchController:(UISearchController *)searchController {
//    //获取搜索框中用户输入的字符串
//    NSString *searchString = [self.searchController.searchBar text];
//    //指定过滤条件，SELF表示要查询集合中对象，contain[c]表示包含字符串，%@是字符串内容
//    NSPredicate *preicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[c] %@", searchString];
//    //如果搜索数组中存在对象，即上次搜索的结果，则清除这些对象
//    if (self.searchList!= nil) {
//        [self.searchList removeAllObjects];g
//    }
//    //通过过滤条件过滤数据
//    self.searchList= [NSMutableArray arrayWithArray:[_dataList filteredArrayUsingPredicate:preicate]];
//    //刷新表格
//    [self.tableView reloadData];
//}

- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = YES;
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
