//
//  SYJMyCenterVC.m
//  MoxiNBA
//
//  Created by 尚勇杰 on 2017/7/13.
//  Copyright © 2017年 尚勇杰. All rights reserved.
//

#import "SYJMyCenterVC.h"
#import "SYJLotteryCollectionCell.h"
#import "SYJPersonCell.h"
#import "CPChangeUserInfoViewController.h"
#import "ForgetViewController.h"
#import "SYJSettingController.h"
#import "LTMyLottoryNumTableViewController.h"
#import "ITKaiJiangViewController.h"
#import "SYJInfoVC.h"

@interface SYJMyCenterVC ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) NSArray *arrList;
@property (nonatomic, strong) NSArray *imgList;

@property (nonatomic, strong) CPUserInfoModel *model;


@end

@implementation SYJMyCenterVC

- (NSArray *)imgList{
    
    if (_imgList == nil) {
        _imgList = @[@"签到",@"信息1",@"密码1",@"账户",@"积分",@"收藏1",@"开奖结果",@"设置1"];
    }
    return _imgList;
}

- (NSArray *)arrList{
    
    if (_arrList == nil) {
        _arrList = @[@"签到",@"个人信息",@"更改密码",@"账户信息",@"积分详情",@"我的收藏",@"开奖信息",@"设置"];
    }
    
    return _arrList;
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UICollectionViewFlowLayout * layout = [UICollectionViewFlowLayout new];
    layout.sectionInset = UIEdgeInsetsZero;
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    
    self.collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.view addSubview:self.collectionView];
    
    [self.collectionView registerClass:[SYJPersonCell class] forCellWithReuseIdentifier:@"cell"];
    [self.collectionView registerClass:[SYJLotteryCollectionCell class] forCellWithReuseIdentifier:@"cell1"];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    [self getUserInfo];
    [self getSorce];
    
    
    // Do any additional setup after loading the view.
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)getUserInfo {
    NSString *phoneNum = [[gobalConfig getInstance] phonenumber];
    NSString *url = [NSString stringWithFormat: @"https://h1055.com/user/userInfo.htmls?phonenumber=%@", phoneNum];
    [[CPNetWorkRequest sharedClient]get:url parame:nil success:^(id object) {
        if ([object[@"errorcode"] isEqualToString:@"0"]) {
            CPUserInfoModel *model = [CPUserInfoModel mj_objectWithKeyValues:object[@"result"]];
            self.model = model;
            [self.collectionView reloadData];
        }
    } failure:^(NSError *err) {
        
    }];
}

- (void)getSorce{
    NSString *url = [NSString stringWithFormat: @"https://h1055.com/user/userSign.htmls"];
    [[CPNetWorkRequest sharedClient]get:url parame:nil success:^(id object) {
        if ([object[@"errorcode"] isEqualToString:@"0"]) {
//            CPUserInfoModel *model = [CPUserInfoModel mj_objectWithKeyValues:object[@"result"]];
//            self.model = model;
//            [self.collectionView reloadData];
        }
    } failure:^(NSError *err) {
        
    }];
}


#pragma mark - Delegate && DataSouce

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        SYJPersonCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
        cell.nameLab.text = self.model.username;
        [cell.imgHeader sd_setImageWithURL:[NSURL URLWithString:self.model.imgpath] placeholderImage:[UIImage imageNamed:@"头像"]];
        cell.sorceBtn.text = @"当前积分:0";
        return cell;
    }else{
        SYJLotteryCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell1" forIndexPath:indexPath];
        cell.lotteryName.text = self.arrList[indexPath.row];
        cell.img.image = [UIImage imageNamed:self.imgList[indexPath.row]];
        return cell;
    }
    
    
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    switch (section) {
        case 1:
            return 0.5;
    }
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    switch (section) {
        case 1:
            return 0.5;
    }
    return 0;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    switch (section) {
        case 0: return UIEdgeInsetsMake(0, 0, 0, 0);
            //        case 1: return UIEdgeInsetsMake(6, 0, 12, 0);
        case 1: return UIEdgeInsetsMake(0, 0, 61, 0);
    }
    return UIEdgeInsetsZero;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:  return CGSizeMake(kScreenWidth, 200);
        case 1:{
            CGFloat w = (kScreenWidth - 1 )/ 3.;
            return  CGSizeMake(w, w + 15);
        }
        default: return CGSizeZero;
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    switch (section) {
        case 1:
            return CGSizeMake(kScreenWidth, 30);
        default:
            return CGSizeZero;
    }
}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]){
        UICollectionReusableView * head = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
        
        UILabel *title = [head viewWithTag:1000];
        if (!title) {
            title = [[UILabel alloc]initWithFrame:CGRectMake(13, 5, 200, 25)];
            title.tag = 1000;
            title.font = [UIFont systemFontOfSize:13];
            title.text = @"个人信息";
            title.textColor = [UIColor colorWithWhite:0.5 alpha:1];
            
            [head addSubview:title];
        }
        return head;
    }else{
        return nil;
    }
}


#pragma mark -  data source
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return 1;
        case 1:
            return self.arrList.count;
        default:
            return 0;
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        
        switch (indexPath.row) {
            case 0:{
                
            SYJLotteryCollectionCell * cell = (SYJLotteryCollectionCell *)[collectionView cellForItemAtIndexPath:indexPath];
            cell.lotteryName.text = @"已签到";
            [SVProgressHUD showSuccessWithStatus:@"签到成功"];

        }
                break;
            case 1:
                [self.navigationController pushViewController:[CPChangeUserInfoViewController new] animated:YES];

                break;
            case 2:
                [self.navigationController pushViewController:[ForgetViewController new] animated:YES];
                break;
            case 3:{
                SYJInfoVC *vc = [[SYJInfoVC alloc]init];
                vc.str = @"当前暂无中奖等信息，快去多去下注吧~~\n这里马上就会多起来的！！！";
                [self.navigationController pushViewController:vc animated:YES];
                break;
                
            }
            case 4:{
                SYJInfoVC *vc = [[SYJInfoVC alloc]init];
                vc.str = @"当前暂无积分详情\n快去签到做任务吧！";
                [self.navigationController pushViewController:vc animated:YES];
                break;
                
            }
                break;
            case 5:
                [self.navigationController pushViewController:[LTMyLottoryNumTableViewController new] animated:YES];

                break;
            case 6:
                [self.navigationController pushViewController:[ITKaiJiangViewController new] animated:YES];
                break;
            case 7:
                [self.navigationController pushViewController:[SYJSettingController new] animated:YES];

                break;

            default:
                break;
        }
        
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
