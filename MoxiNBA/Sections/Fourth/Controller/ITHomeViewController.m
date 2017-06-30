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
#import "SYJCollectionFlowLayout.h"
#import "SYJLotteryCollectionCell.h"
#import "SYJNBAGameController.h"

#define Kwidths  ([UIScreen mainScreen].bounds.size.width / 3)

@interface ITHomeViewController ()<UICollectionViewDataSource, SYJCollectionFlowLayoutDelegate,UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) NSMutableArray *listArr;

@property (nonatomic, strong) NSMutableArray *listImgArr;


@end

@implementation ITHomeViewController

- (NSMutableArray *)listArr{
    
    if (_listArr == nil) {
        _listArr = [NSMutableArray arrayWithObjects:@"Award",@"FootBall",@"Basketball",@"TeamInfo",@"ArThree",@"ArFive",@"LotteryShop",nil];
    }
    
    return _listArr;
    
}

- (NSMutableArray *)listImgArr{
    
    if (_listImgArr == nil) {
        
        //        NSDictionary *dict = [@"":@""];
        
        _listImgArr = [NSMutableArray arrayWithObjects:@"award",@"足球",@"篮球",@"team",@"随机",@"随机1",@"shop",nil];
    }
    
    return _listImgArr;
    
}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    self.navigationItem.titleView = [UILabel titleWithColor:[UIColor grayColor] title:@"Find" font:18.0];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    NSDictionary *dicts = [[NSUserDefaults standardUserDefaults] objectForKey:@"NBALogo"];
//    self.listArr = (NSMutableArray *)[dicts allValues];
//    self.listImgArr = (NSMutableArray *)[dicts allKeys];
    
    //创建瀑布流布局
    SYJCollectionFlowLayout *layout = [[SYJCollectionFlowLayout alloc]init];
    layout.delegate = self;
    
    //创建CollectionView
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, KSceenW, KSceenH - 108) collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    
    self.collectionView = collectionView;
    
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.collectionView];
    self.collectionView.backgroundColor = [UIColor clearColor];

    
    [self.collectionView registerClass:[SYJLotteryCollectionCell class] forCellWithReuseIdentifier:@"cell"];

    // Do any additional setup after loading the view.
}


#pragma mark - <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.listArr.count;
    SYJLog(@"%ld",self.listArr.count);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    SYJLotteryCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.img.image = [UIImage imageNamed:self.listImgArr[indexPath.row]];
    cell.lotteryName.text = self.listArr[indexPath.row];
    
    return cell;
}




#pragma mark - <CYXWaterFlowLayoutDelegate>
- (CGFloat)waterflowLayout:(SYJCollectionFlowLayout *)waterflowLayout heightForItemAtIndex:(NSUInteger)index itemWidth:(CGFloat)itemWidth
{
    return KSceenW / 3;
}

- (CGFloat)rowMarginInWaterflowLayout:(SYJCollectionFlowLayout *)waterflowLayout
{
    return 0;
}

- (CGFloat)columnCountInWaterflowLayout:(SYJCollectionFlowLayout *)waterflowLayout
{
    return 3;
}

- (UIEdgeInsets)edgeInsetsInWaterflowLayout:(SYJCollectionFlowLayout *)waterflowLayout
{
    return UIEdgeInsetsMake(5,5,5,5);
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    //    SYJLotteryCollectionCell *cell = (SYJLotteryCollectionCell *)[self coll];
//    SYJLotteryCollectionCell *cell = (SYJLotteryCollectionCell *)[self collectionView:self.collectionView cellForItemAtIndexPath:indexPath];
    
    if (indexPath.row == 0) {
        ITKaiJiangViewController *vc = [[ITKaiJiangViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 1){
        ITMatchDetailViewController *vc = [[ITMatchDetailViewController alloc]init];
        vc.type = 0;
        [self.navigationController pushViewController:vc animated:YES];
//        }else{
//            vc.type = 1;
//        }
    }else if(indexPath.row == 2){
        SYJNBAGameController *vc = [[SYJNBAGameController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 3){
        SYJFourthController *vc = [[SYJFourthController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 4){
        ITSelectNumberViewController *vc = [[ITSelectNumberViewController alloc]init];
//        if (indexPath.row == 0) {
//            vc.type = 5;
//        }else{
            vc.type = 3;
//        }
        [self.navigationController pushViewController:vc animated:YES];
    }else if(indexPath.row == 5){
        ITSelectNumberViewController *vc = [[ITSelectNumberViewController alloc]init];
        vc.type = 5;
        [self.navigationController pushViewController:vc animated:YES];
    }else if(indexPath.row == 6){
        ITZhiShiViewController *vc = [[ITZhiShiViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }



    
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(Kwidths, Kwidths);
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
