//
//  ITSelectNumTableViewCell.h
//  inrtest
//
//  Created by 张涛 on 2017/5/9.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol  ITSelectNumTableViewCellDelegate<NSObject>

@optional

- (void)didButtonClick: (NSInteger)number index:(NSInteger)index;

@end

@interface ITSelectNumTableViewCell : UITableViewCell

+ (instancetype)cellWithTableView: (UITableView *)tableView;

@property (nonatomic, weak) id<ITSelectNumTableViewCellDelegate> delegate;

@property (nonatomic, assign) BOOL isOne;

@property (nonatomic, strong) UIView *line;

@property (nonatomic, assign) NSInteger index;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, assign) NSInteger row;

@property (nonatomic, assign) BOOL isClean;

@end
