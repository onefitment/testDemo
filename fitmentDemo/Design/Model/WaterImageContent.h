//
//  WaterImageContent.h
//  fitmentDemo
//
//  Created by 朱恪帅 on 14/11/30.
//  Copyright (c) 2014年 zks. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WaterImageContent : NSObject
@property (nonatomic,assign) int width;
@property (nonatomic,assign) int height;
@property (nonatomic,assign) int oldcid;
@property (nonatomic,strong) NSString *title;
@property (nonatomic,assign) int uid;
@property (nonatomic,assign) int likenum;
@property (nonatomic,strong) NSString *filename;
@property (nonatomic,assign) int caseid;
@property (nonatomic,assign) int commentnum;
@property (nonatomic,strong)NSMutableArray *images;

- (id)initWithDict:(NSDictionary *)dict;
@end
