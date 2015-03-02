//
//  WaterList.h
//  fitmentDemo
//
//  Created by 朱恪帅 on 14/11/30.
//  Copyright (c) 2014年 zks. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WaterList : NSObject
@property (nonatomic,assign) int status;
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSMutableArray *waterImages;

- (id)initWithDict:(NSDictionary *)dict;
@end
