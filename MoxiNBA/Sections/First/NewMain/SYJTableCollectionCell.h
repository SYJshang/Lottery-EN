//
//  SYJTableCollectionCell.h
//  LotterySecond
//
//  Created by 尚勇杰 on 2017/6/6.
//  Copyright © 2017年 尚勇杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SYJSelectDelegate <NSObject>

- (void)index:(NSInteger)index;

@end

@interface SYJTableCollectionCell : UITableViewCell

@property (nonatomic, strong) UICollectionView *collectionView;


@property (nonatomic,weak) id<SYJSelectDelegate> delegate;



@end
