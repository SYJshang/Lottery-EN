//
//  HomeTableViewCell.h
//  Domino
//
//  Created by Jason chen on 2017/3/13.
//  Copyright © 2017年 jack.wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeTableViewCell : UITableViewCell


@property(nonatomic,strong)UILabel *labelText;

@property(nonatomic,strong)UILabel *labelStr;

@property(nonatomic,strong)UILabel *labelTime;

@property(nonatomic,strong)UIImageView *imageView;



+(instancetype)initWithtableView:(UITableView *)tableView;
@end
