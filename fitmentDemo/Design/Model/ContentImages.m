//
//  ContentImages.m
//  fitmentDemo
//
//  Created by 朱恪帅 on 14/11/30.
//  Copyright (c) 2014年 zks. All rights reserved.
//

#import "ContentImages.h"

@implementation ContentImages
- (id)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        _imageTittle = dict[@"title"];
        _filename = dict[@"filename"];
        _width = [dict[@"width"] intValue];
        _height = [dict[@"height"] intValue];
        _commentnum = [dict[@"commentnum"] intValue];
        _oldcid = [dict[@"oldcid"] intValue];
        _likenum = [dict[@"likenum"] intValue];;
    }
    return self;
}
@end
