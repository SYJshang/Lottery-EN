//
//  MineDetailTableViewCell.h
//  Domino
//
//  Created by HongShun Chen on 2017/3/24.
//  Copyright © 2017年 jack.wang. All rights reserved.
//
#import "kaiJiangEntity.h"
#import <UIKit/UIKit.h>

@interface MineDetailTableViewCell : UITableViewCell


@property(nonatomic,strong)UILabel *labelText;

@property(nonatomic,strong)UILabel *labelStr;

@property(nonatomic,strong)UILabel *labelTime;

@property(nonatomic,strong)UILabel *titleName;

@property(nonatomic,strong)NSString *titleStr;
//@property(nonatomic,strong)UILabel *;

@property(nonatomic,strong)NSArray *dataArr;

+(instancetype)initWithtableView:(UITableView *)tableView Data:(kaiJiangEntity *)Entity;
@end
