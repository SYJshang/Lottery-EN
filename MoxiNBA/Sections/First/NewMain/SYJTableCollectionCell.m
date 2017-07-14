//
//  SYJTableCollectionCell.m
//  LotterySecond
//
//  Created by 尚勇杰 on 2017/6/6.
//  Copyright © 2017年 尚勇杰. All rights reserved.
//

#import "SYJTableCollectionCell.h"
#import "SYJCollectionFlowLayout.h"
#import "SYJLotSelectCell.h"
#import "LTLotteryInfoMode.h"
#import "LTLotteryManager.h"

#define Kwidths  ([UIScreen mainScreen].bounds.size.width / 3)

@interface SYJTableCollectionCell ()<UICollectionViewDataSource, SYJCollectionFlowLayoutDelegate,UICollectionViewDelegate>

@property (nonatomic, strong) NSMutableArray *listImgArr;

@property(nonatomic,strong) NSArray *lotteryOrder;



@end



@implementation SYJTableCollectionCell



- (NSArray *)lotteryOrder{
    if (_lotteryOrder == nil) {
        _lotteryOrder = @[@"ssq",@"dlt",@"3d",@"pls",@"plw", @"qxc", @"qlc", @"qqs", @"anh"];
    }
    return _lotteryOrder;
}




- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        //创建瀑布流布局
        SYJCollectionFlowLayout *layout = [[SYJCollectionFlowLayout alloc]init];
        layout.delegate = self;
        
        //创建CollectionView
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, KSceenW, KSceenW + 45) collectionViewLayout:layout];
        collectionView.backgroundColor = [UIColor whiteColor];
        collectionView.dataSource = self;
        collectionView.delegate = self;
        
        [self.contentView addSubview:collectionView];
        self.collectionView = collectionView;
        
        self.collectionView.dataSource = self;
        self.collectionView.delegate = self;
        
        self.collectionView.backgroundColor = [UIColor whiteColor];
        
        [self.contentView addSubview:self.collectionView];
        
        [self.collectionView registerClass:[SYJLotSelectCell class] forCellWithReuseIdentifier:@"cell"];
        
    }
    
    return self;
}




#pragma mark - <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.lotteryOrder.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SYJLotSelectCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    NSString *key = self.lotteryOrder[indexPath.row];
    LTLotteryInfoMode *model = [LTLotteryManager lotteryInfo][key];
    
    cell.lotteryName.text = model.title;
    cell.isNoLottery.text = model.subTitle;
    [cell.img setImage:[UIImage imageNamed:model.iconName]];
    return cell;
}


#pragma mark - <CYXWaterFlowLayoutDelegate>
- (CGFloat)waterflowLayout:(SYJCollectionFlowLayout *)waterflowLayout heightForItemAtIndex:(NSUInteger)index itemWidth:(CGFloat)itemWidth
{
    return KSceenW / 3 + 15;
}

- (CGFloat)rowMarginInWaterflowLayout:(SYJCollectionFlowLayout *)waterflowLayout
{
    return 0;
}

- (CGFloat)columnCountInWaterflowLayout:(SYJCollectionFlowLayout *)waterflowLayout
{
    return 3;
}

//- (UIEdgeInsets)edgeInsetsInWaterflowLayout:(SYJCollectionFlowLayout *)waterflowLayout
//{
//    return UIEdgeInsetsMake(0,0,0,0);
//}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    //通知代理
    if ([self.delegate respondsToSelector:@selector(index:)]) {
        [self.delegate index:indexPath.row];
    }

    
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(Kwidths, Kwidths);
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
