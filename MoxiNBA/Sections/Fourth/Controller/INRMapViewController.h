//
//  INRMapViewController.h
//  inrtest
//
//  Created by 张涛 on 2017/4/18.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import "INRTestBaseViewController.h"

@interface INRMapViewController : INRTestBaseViewController

@property (nonatomic, strong) NSString *nameStr;

@property (nonatomic, strong) NSString *address;

@property (nonatomic, assign) CLLocationCoordinate2D coorDinate;

@end
