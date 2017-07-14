//
//  gobalConfig.h
//  Domino
//
//  Created by Jason chen on 2017/3/9.
//  Copyright © 2017年 jack.wang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface gobalConfig : NSObject


@property(nonatomic,assign) BOOL    IsLogin;

@property(nonatomic,strong)NSString *userName;

@property(nonatomic,strong)NSString *phonenumber;


+(gobalConfig *) getInstance;

-(void)clearData;

@end
