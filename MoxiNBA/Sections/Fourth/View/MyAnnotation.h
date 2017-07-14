//
//  MyAnnotation.h
//  inrtest
//
//  Created by 张涛 on 2017/4/26.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MyAnnotation : NSObject<MKAnnotation>

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *subtitle;

@end
