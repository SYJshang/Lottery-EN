//
//  BaseViewController.h
//  Domino
//
//  Created by jack.wang on 16/6/26.
//  Copyright © 2016年 jack.wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController{
    UITapGestureRecognizer *tapGestureRecognizer;
}

@property (nonatomic,retain)  UIView    *headView;

@property (nonatomic,retain)  UILabel   *titleLab;

@property (nonatomic,strong)  NSDictionary  *orderDic;


- (void)getStateOrder;
- (void)hideStateOrder;

-(void)createHeaderView:(NSString *)title;
-(void)createHeaderViewWithBackButton:(NSString *)title;
-(void)backBtnAction;
-(void)backBtnActionWithOutRootView;
-(void)backBtnActionWithOutAnimated;
-(void)changeViewHeightForkeyBoardWillShow:(UIView*)view;
- (void)changeViewHeightForKeyBoardWillHide:(UIView*)view;


@end
