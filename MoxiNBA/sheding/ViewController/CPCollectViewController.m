//
//  CPCollectViewController.m
//  彩票2
//
//  Created by 张涛 on 2017/4/15.
//  Copyright © 2017年 1. All rights reserved.
//

#import "CPCollectViewController.h"
#import "HomeTableViewCell.h"
//#import "UIImageView+WebCache.h"
#import "BaseDetailViewController.h"
#import "LoginViewController.h"

@interface CPCollectViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *dataArr;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation CPCollectViewController

- (NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Favorite";
    [self createViews];
    
    // Do any additional setup after loading the view.
}

- (void)createViews {
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.frame];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
    self.tableView = tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return scaleWithSize(110);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HomeTableViewCell *cell = [HomeTableViewCell initWithtableView:tableView];
    cell.labelText.text = [_dataArr[indexPath.row] objectForKey:@"title"];
    cell.labelTime.text = [_dataArr[indexPath.row] objectForKey:@"strTime"];
    cell.labelStr.text = [_dataArr[indexPath.row] objectForKey:@"description"];
    //        UIImage *imageCell =[[ UIImage alloc]init];
    NSURL *url  = [NSURL URLWithString:[_dataArr[indexPath.row] objectForKey:@"imageurl"]];
    [cell.imageView sd_setImageWithURL:url];
    //        [dataArr[indexPath.row-1] objectForKey:@"imageurl"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    BaseDetailViewController *baseView = [[BaseDetailViewController alloc]init];
    //        BaseViewController *baseView = [[baseView alloc]init];
    //        NSString *urlStr = [NSString stringWithFormat:@"%@",[dataArr[indexPath.row]objectForKey:@"url" ]] ;
    //        baseView.urlString = urlStr;
    [baseView addSubViewsWithhtmlDic:_dataArr[indexPath.row]];
    //        [baseView addSubViewsWithhtmlStr: [dataArr[indexPath.row-1] objectForKey:@"content"]];
    [self.navigationController pushViewController:baseView animated:YES];
}

-(void)getInfoData{
//    NSString *phoneNum = [[gobalConfig getInstance] phonenumber];
//    [[HttpRequestClient sharedClient] getCollection:phoneNum completion:^(int resultCode, NSString *resultMsg, NSDictionary *dataDict, NSError *error) {
//        if (![[dataDict objectForKey:@"errorcode"]  isEqualToString:@"0"]) {
//            NSString *errStr = [dataDict objectForKey:@"msg"];
//            [SVProgressHUD showWithStatus:errStr];
//            
//        }else{
//            _dataArr = [dataDict objectForKey:@"result"];
//            [self.tableView reloadData];
////            dispatch_async(dispatch_get_main_queue(), ^{
////                [self.tableView reloadData];
////            });
//            
//            
//        }
//        NSLog(@"%@",dataDict);
//    }];
//    
}

- (void)viewWillAppear:(BOOL)animated{
    [self getInfoData];


    
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
