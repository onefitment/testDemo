//
//  ContentImages.h
//  fitmentDemo
//
//  Created by 朱恪帅 on 14/11/30.
//  Copyright (c) 2014年 zks. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContentImages : NSObject
@property (nonatomic,strong)NSString *imageTittle;
@property (nonatomic,strong)NSString *filename;
@property (nonatomic,assign) int width;
@property (nonatomic,assign) int height;
@property (nonatomic,assign) int commentnum;
@property (nonatomic,assign) int oldcid;
@property (nonatomic,assign) int likenum;
- (id)initWithDict:(NSDictionary *)dict;
@end
