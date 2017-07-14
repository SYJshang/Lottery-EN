//
//  BaseViewController.m
//  Domino
//
//  Created by jack.wang on 16/6/26.
//  Copyright © 2016年 jack.wang. All rights reserved.
//

#import "BaseViewController.h"
#import "AppDelegate.h"
//#import "Order.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

@synthesize headView;
@synthesize titleLab;
@synthesize orderDic;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self addKeyBoardHide:YES];
    [self.tabBarController.navigationController setNavigationBarHidden:YES];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
      [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(NSIntegerMin, NSIntegerMin) forBarMetrics:UIBarMetricsDefault];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(jumpToMe) name:@"JumpToMe" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(jumpTo) name:@"JumpTo" object:nil];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
//    [self.view setBackgroundColor:[Utils colorFromHexRGB:@"f4f4f4"]];
}


#pragma mark - 获取购物车消息
//- (void)getStateOrder {
//
//    [[HttpRequestClient sharedClient] getStartOrdering:^(int resultCode, NSString *resultMsg, NSDictionary *dataDict, NSError *error) {
//        NSLog(@"dataDict:%@",dataDict);
//        if (![dataDict isKindOfClass:[NSNull class]] && resultCode == 0) {
//            int num = [dataDict[@"ProductCount"] intValue];
//            if (num > 0) {
//                AppDelegate *appdel = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//                [appdel.tabController.msNum setHidden:NO];
//                [appdel.tabController.msNum setText:[NSString stringWithFormat:@"%d",num]];
//            } else {
//                [self hideStateOrder];
//            }
//        }
//    }];
//    
//}
//
//- (void)hideStateOrder {
//    AppDelegate *appdel = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//    [appdel.tabController.msNum setHidden:YES];
//}

#pragma mark -

- (void)createHeaderView:(NSString *)title {
    headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, K_FRAME_BASE_WIDTH, K_FRAME_VIEW_ORIGIN_Y)];
    [headView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:headView];
    
    titleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, K_FRAME_HEAD_HEIGHT, K_FRAME_BASE_WIDTH, K_FRAME_NAVIGATION_BAR_HEIGHT)];
    [titleLab setBackgroundColor:[UIColor clearColor]];
    [titleLab setText:title];
    [titleLab setTextColor:[UIColor blackColor]];
    [titleLab setTextAlignment:NSTextAlignmentCenter];
    [titleLab setFont:[UIFont systemFontOfSize:18]];
    [headView addSubview:titleLab];
}

#pragma mark -
-(void)addLeftBackButton{
    UIButton *backbutton  = [UIButton buttonWithType:UIButtonTypeCustom];
    [backbutton setFrame:CGRectMake(0, K_FRAME_HEAD_HEIGHT+(K_FRAME_NAVIGATION_BAR_HEIGHT-30)/2, 30, 30)];
    [backbutton setImage:[UIImage imageNamed:@"backicon"] forState:UIControlStateNormal];
    [backbutton addTarget:self action:@selector(backBtnAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.headView addSubview:backbutton];
}

#pragma mark - 
-(void)createHeaderViewWithBackButton:(NSString *)title{
    [self createHeaderView:title];
    [self addLeftBackButton];
}

-(CGFloat)getHeightWithView:(UIView*)view{
    return view.frame.origin.y+view.frame.size.height;
}

#pragma mark -
#pragma mark button action
-(void)backBtnAction{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)backBtnActionWithOutAnimated {
    [self.navigationController popViewControllerAnimated:NO];
}

#pragma mark - junpto
//
//- (void)jumpTo {
//    if ([GlobalsConfig shareInstance].jumpTo) {
//        int pageNum = [[GlobalsConfig shareInstance].jumpTo[@"tab"] intValue];
//        NSString *page = [GlobalsConfig shareInstance].jumpTo[@"page"];
//        if (page.length > 0) {
//            [[GlobalsConfig shareInstance] setIsJump:YES];
//        }
//        [self.navigationController popToRootViewControllerAnimated:NO];
//        AppDelegate *appdel = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//        [appdel.tabController didSelectedIndex:pageNum];
//    }
//}



#pragma mark -
#pragma mark keyboard
-(void)addKeyBoardHide:(BOOL)isAdd{
    
    if (isAdd) {
        tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHide:)];
        //设置成NO表示当前控件响应后会传播到其他控件上，默认为YES。
        tapGestureRecognizer.cancelsTouchesInView = NO;
        //将触摸事件添加到当前view
        [self.view addGestureRecognizer:tapGestureRecognizer];
        
    }else{
        if (tapGestureRecognizer) {
            [self.view removeGestureRecognizer:tapGestureRecognizer];
        }
    }
}

//键盘退下
-(void)keyboardHide:(UITapGestureRecognizer*)tap{
//    [self.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view endEditing:YES];
}

#pragma mark -
#pragma mark 键盘高度

-(void)changeViewHeightForkeyBoardWillShow:(UIView*)view{
    if (K_FRAME_BASE_HEIGHT-[self getHeightWithView:view] < 116) {
        float height = K_FRAME_BASE_HEIGHT-[self getHeightWithView:view] - 116;
        [self.view setFrame:CGRectMake(0, height, self.view.frame.size.width, self.view.frame.size.height)];
    }
}

- (void)changeViewHeightForKeyBoardWillHide:(UIView*)view{
    [self.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
}

#pragma mark -
#pragma mark memory

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"JumpTo" object:nil];
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
