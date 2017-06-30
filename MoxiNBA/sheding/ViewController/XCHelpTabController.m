//
//  XCHelpTabController.m
//  彩票2
//
//  Created by 1 on 16/1/23.
//  Copyright © 2016年 1. All rights reserved.
//

#import "XCHelpTabController.h"
#import "XCHelpModel.h"
#import "XCWebViewController.h"
#import "SYJNavitionController.h"

@interface XCHelpTabController ()

@property (strong,nonatomic) NSArray *helpModelArr;

@end

@implementation XCHelpTabController

//懒加载
- (NSArray *)helpModelArr{
    
    if(_helpModelArr == nil){
        
        //获取json文件
        NSString *path  = [[NSBundle mainBundle]pathForResource:@"help" ofType:@"json"];
        
        //将json转化为nsdata
        NSData *data = [NSData dataWithContentsOfFile:path];
        
        NSArray *jsonArr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        NSMutableArray *arrM = [NSMutableArray array];
        
        for (NSDictionary *dict in jsonArr) {
            
            XCHelpModel *model = [XCHelpModel helpWithDict:dict];
            
            [arrM addObject:model];
        }
        
        _helpModelArr = arrM;
    }
    
    return _helpModelArr;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.helpModelArr.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //获取数据
    XCHelpModel *model = self.helpModelArr[indexPath.row];
    
    static NSString *ID = @"help";
    
    //创建cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if(cell == nil){
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    //设置数据
    cell.textLabel.text = model.title;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    XCHelpModel *model = self.helpModelArr[indexPath.row];
    
    XCWebViewController *webView = [[XCWebViewController alloc]init];
    
    webView.model = model;
    
    SYJNavitionController *nav = [[SYJNavitionController alloc]initWithRootViewController:webView];
    

    [self presentViewController:nav animated:YES completion:nil];
}

@end
