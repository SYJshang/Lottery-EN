//
//  CPFindCollectionViewController.m
//  inrtest
//
//  Created by zt on 2017/6/6.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import "CPFindCollectionViewController.h"

@interface CPFindCollectionViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation CPFindCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createViews];
    
    // Do any additional setup after loading the view.
}

- (void)createViews {
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayout.itemSize = CGSizeMake(scaleWithSize(100), scaleWithSize(150));
    flowLayout.minimumInteritemSpacing = 0;
    
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(scaleWithSize(30), scaleWithSize(10), screen_width, screen_height) collectionViewLayout:flowLayout];
    collectionView.backgroundColor = [UIColor clearColor];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellid"];
    [self.view addSubview:collectionView];
    self.collectionView = collectionView;
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 5;
}


-(CGFloat )collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section

{
    return scaleWithSize(1);
    
}
//返回每个item
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell * cell  = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellid" forIndexPath:indexPath];
//    UIImageView *imageView = [[UIImageView alloc]init];
//    imageView.contentMode = UIViewContentModeScaleToFill;
//    [cell.contentView addSubview:imageView];
    cell.layer.cornerRadius = 5;
    
//    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, cell.contentView.frame.size.width, cell.contentView.frame.size.height)];
//    toolbar.barStyle = UIBarStyleDefault;
//    toolbar.layer.cornerRadius = 5;
//    [cell.contentView addSubview:toolbar];
    
//    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(@0);
//        make.top.equalTo(@0);
//        make.size.mas_equalTo(CGSizeMake(cell.contentView.frame.size.width, cell.contentView.frame.size.height));
//    }];
    cell.backgroundColor = [UIColor blackColor];
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
