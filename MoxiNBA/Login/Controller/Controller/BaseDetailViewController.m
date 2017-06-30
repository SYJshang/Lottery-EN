//
//  BaseDetailViewController.m
//  Domino
//
//  Created by HongShun Chen on 2017/3/24.
//  Copyright © 2017年 jack.wang. All rights reserved.
//

#import "UIImageView+AFNetworking.h"

#import "BaseDetailViewController.h"

@interface BaseDetailViewController ()<UIWebViewDelegate>

@property (nonatomic, assign) BOOL isFav;
@property (nonatomic, strong) UIButton *collectBtn;
@property (nonatomic, assign) NSInteger lottoryId;

@end

@implementation BaseDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"资讯详情";
    
    _isFav = NO;
    
    [self createRightBtn];
    
    self.navigationController.navigationBarHidden = NO;
    
//    self.navigationController.navigationBar.barStyle=UIBarStyleBlackOpaque;
    
//    [self.navigationController.navigationBar setBarTintColor:[Utils colorFromHexRGB:@"d91d36"]];
//    [self.navigationController.navigationBar setBarTintColor:K_NAVBAR_COLOR];
    
    self.view.backgroundColor =RGB(242, 242, 242);
    // Do any additional setup after loading the view.
}

- (void)createRightBtn {
    UIButton *collectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    collectBtn.frame = CGRectMake(0, 0, scaleWithSize(41),scaleWithSize(41));
    [collectBtn setImage:[UIImage imageNamed:@"collect_normal"] forState:UIControlStateNormal];
    [collectBtn addTarget:self action:@selector(collectClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:collectBtn];
    self.collectBtn = collectBtn;
}

- (void)judgeIsFav {
    NSString *phoneNum = [[gobalConfig getInstance] phonenumber];
    if ([phoneNum isEqualToString:@""] || phoneNum == nil) {
        
    }else{
        NSString *url = [NSString stringWithFormat:@"http://www.h1055.com/ozsuser/isCollect.htmls?phonenumber=%@&lottoryId=%d", phoneNum, _lottoryId];
        [[CPNetWorkRequest sharedClient] get:url parame:nil success:^(id object) {
            NSNumber *isFav = [object objectForKey:@"result"];
            _isFav = [isFav intValue];
            if (_isFav == 0) {
                _isFav = NO;
            }else{
                _isFav = YES;
            }
            if (_isFav) {
                [self.collectBtn setImage:[UIImage imageNamed:@"collect_selected"] forState:UIControlStateNormal];
            }else{
                [self.collectBtn setImage:[UIImage imageNamed:@"collect_normal"] forState:UIControlStateNormal];
            }

        } failure:^(NSError *err) {
            
        }];
        
//        [[HttpRequestClient sharedClient] judgeIsFav:phoneNum lottoryId:_lottoryId completion:^(int resultCode, NSString *resultMsg, NSDictionary *dataDict, NSError *error) {
//            if (![[dataDict objectForKey:@"errorcode"]  isEqualToString:@"0"]) {
//                NSString *errStr = [dataDict objectForKey:@"error"];
//                [SVProgressHUD showWithStatus:errStr];
//                
//            }else{
//                NSNumber *isFav = [dataDict objectForKey:@"result"];
//                _isFav = [isFav intValue];
//                if (_isFav == 0) {
//                    _isFav = NO;
//                }else{
//                    _isFav = YES;
//                }
//                if (_isFav) {
//                    [self.collectBtn setImage:[UIImage imageNamed:@"collect_selected"] forState:UIControlStateNormal];
//                }else{
//                    [self.collectBtn setImage:[UIImage imageNamed:@"collect_normal"] forState:UIControlStateNormal];
//                }
//                
//            }
//            NSLog(@"%@",dataDict);
//        }];
    }

}

- (void)collectClick {
    
    NSString *phoneNum = [[gobalConfig getInstance] phonenumber];
    if ([phoneNum isEqualToString:@""] || phoneNum == nil) {
        [SVProgressHUD showErrorWithStatus:@"请先登录！"];
    }else{
        _isFav = !_isFav;
        if (!_isFav) {
            [self.collectBtn setImage:[UIImage imageNamed:@"collect_normal"] forState:UIControlStateNormal];
            NSString *url = @"https://h1055.com/ozsuser/deleteCollection.htmls";
            NSDictionary *parame = @{
                                     @"phonenumber": phoneNum,
                                     @"lottoryId":@(_lottoryId)
                                     };
            [[CPNetWorkRequest sharedClient]get:url parame:parame success:^(id object) {
                if (![[object objectForKey:@"errorcode"]  isEqualToString:@"0"]) {
                    NSString *errStr = [object objectForKey:@"error"];
                    [SVProgressHUD showErrorWithStatus:errStr];
                }else{
                    [SVProgressHUD showSuccessWithStatus:@"取消收藏成功"];
                }
            } failure:^(NSError *err) {
                
            }];
//            [[HttpRequestClient sharedClient] cancelCollectArticle:phoneNum lottoryId:_lottoryId completion:^(int resultCode, NSString *resultMsg, NSDictionary *dataDict, NSError *error) {
//                if (![[dataDict objectForKey:@"errorcode"]  isEqualToString:@"0"]) {
//                    NSString *errStr = [dataDict objectForKey:@"error"];
//                    [SVProgressHUD showErrorWithStatus:errStr];
//                }else{
//                    [SVProgressHUD showSuccessWithStatus:@"取消收藏成功"];
//                }
//                NSLog(@"%@",dataDict);
//
//            }];
        }else{
            [self.collectBtn setImage:[UIImage imageNamed:@"collect_selected"] forState:UIControlStateNormal];
            NSDictionary *parame = @{
                                     @"phonenumber": phoneNum,
                                     @"lottoryId":@(_lottoryId)
                                     };
            NSString *url = @"https://www.h1055.com/ozsuser/saveCollection.htmls";
            [[CPNetWorkRequest sharedClient]get:url parame:parame success:^(id object) {
                if (![[object objectForKey:@"errorcode"]  isEqualToString:@"0"]) {
                    NSString *errStr = [object objectForKey:@"error"];
                    [SVProgressHUD showErrorWithStatus:errStr];
                }else{
                    [SVProgressHUD showSuccessWithStatus:@"取消收藏成功"];
                }
            } failure:^(NSError *err) {
                
            }];
//            [[HttpRequestClient sharedClient] collectArticle:phoneNum lottoryId:_lottoryId completion:^(int resultCode, NSString *resultMsg, NSDictionary *dataDict, NSError *error) {
//                if (![[dataDict objectForKey:@"errorcode"]  isEqualToString:@"0"]) {
//                    NSString *errStr = [dataDict objectForKey:@"error"];
//                    [SVProgressHUD showErrorWithStatus:errStr];
//                }else{
//                    [SVProgressHUD showSuccessWithStatus:@"收藏成功"];
//                    
//                }
//                NSLog(@"%@",dataDict);
//            }];
        }
    }

}

-(void)addSubViewsWithhtmlDic:(NSDictionary *)htmlDic{
//    UIWebView * webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
//    webView.delegate = self;
////    NSString *htmlString = htmlStr.Remark;//这是html格式的代码段
////    [webView loadHTMLString:htmlStr baseURL:nil];
//    [self.view addSubview:webView];
    NSString *lottoryId = [htmlDic objectForKey:@"id"];
    _lottoryId = [lottoryId integerValue];
    
    UIView *headerView=  [[UIView alloc]initWithFrame:CGRectMake(0, 64, kWidth, kHeight/6)];
    headerView.backgroundColor = [UIColor whiteColor];
    
    
    //text
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 5, kWidth-40, kHeight/9)];
    titleLabel.numberOfLines = 2;
    titleLabel.text = [NSString stringWithFormat:@"%@",[htmlDic objectForKey:@"title"]];
    [headerView addSubview:titleLabel];
    
    //time
    UILabel *timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, K_RECT_MAXY(titleLabel), kWidth-40, 15)];
    timeLabel.textColor = [UIColor lightGrayColor];
    timeLabel.font =[UIFont systemFontOfSize:11.0];
    timeLabel.text = [NSString stringWithFormat:@"%@",[htmlDic objectForKey:@"strTime"]];
    [headerView addSubview:timeLabel];
    
//    headerView.backgroundColor = [UIColor redColor];
    
    
    UIView *grayLine = [[UIView alloc] initWithFrame:CGRectMake(0, K_RECT_MAXY(headerView), K_FRAME_BASE_WIDTH, 1)];
    [grayLine setBackgroundColor:[UIColor lightGrayColor]];
    [grayLine setAlpha:0.2f];
    [grayLine.layer setShadowOffset:CGSizeMake(0, 1.0)];
    [grayLine.layer setShadowRadius:0.5];
    [self.view addSubview:grayLine];
    
    
    
    //description
    NSString *description =[NSString stringWithFormat:@"%@",[htmlDic objectForKey:@"description"]];

    UILabel *descriptionLabel  = [[UILabel alloc]initWithFrame:CGRectMake(10,K_RECT_MAXY(grayLine)+10, kWidth-20, 30*(description.length/20))];
    descriptionLabel.font = [UIFont systemFontOfSize:12.0];
    descriptionLabel.text =description;
    descriptionLabel.textAlignment = NSTextAlignmentLeft;
    descriptionLabel.numberOfLines = 20;
    [self.view addSubview:descriptionLabel];
    
    UIImageView *imageView =[[UIImageView alloc]initWithFrame:CGRectMake(10, K_RECT_MAXY(descriptionLabel)+10, kWidth-20, kHeight/4)];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@",[htmlDic objectForKey:@"imageurl"]]];
    [imageView setImageWithURL:url];
    [self.view addSubview:imageView];
    
    
    [self.view  addSubview:headerView];
    
    
}

- (void)viewWillAppear:(BOOL)animated{
    [self judgeIsFav];
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
