//
//  WaterList.m
//  fitmentDemo
//
//  Created by 朱恪帅 on 14/11/30.
//  Copyright (c) 2014年 zks. All rights reserved.
//

#import "WaterList.h"
#import "WaterImageContent.h"

@implementation WaterList
- (id)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.status = [dict[@"status"] intValue];
        self.title = dict[@"title"];
        NSArray *constArray = dict[@"content"];
        self.waterImages = [NSMutableArray arrayWithCapacity:constArray.count];
        if (constArray) {
            for (NSDictionary *dict in constArray) {
                WaterImageContent *imageContent = [[WaterImageContent alloc] initWithDict:dict];
                [self.waterImages addObject:imageContent];
            }
        }
        
    }
    return self;
}

@end
