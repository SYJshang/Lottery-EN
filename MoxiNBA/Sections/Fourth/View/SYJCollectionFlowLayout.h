//
//  SYJCollectionFlowLayout.h
//  MoXiDemo
//
//  Created by 尚勇杰 on 2017/6/1.
//  Copyright © 2017年 尚勇杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SYJCollectionFlowLayout;

@protocol SYJCollectionFlowLayoutDelegate <NSObject>
@required
- (CGFloat)waterflowLayout:(SYJCollectionFlowLayout *)waterflowLayout heightForItemAtIndex:(NSUInteger)index itemWidth:(CGFloat)itemWidth;

@optional
- (CGFloat)columnCountInWaterflowLayout:(SYJCollectionFlowLayout *)waterflowLayout;
- (CGFloat)columnMarginInWaterflowLayout:(SYJCollectionFlowLayout *)waterflowLayout;
- (CGFloat)rowMarginInWaterflowLayout:(SYJCollectionFlowLayout *)waterflowLayout;
- (UIEdgeInsets)edgeInsetsInWaterflowLayout:(SYJCollectionFlowLayout *)waterflowLayout;
@end


@interface SYJCollectionFlowLayout : UICollectionViewFlowLayout

@property (nonatomic, weak) id<SYJCollectionFlowLayoutDelegate> delegate;

@end
