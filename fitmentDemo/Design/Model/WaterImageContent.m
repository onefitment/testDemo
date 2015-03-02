//
//  WaterImageContent.m
//  fitmentDemo
//
//  Created by 朱恪帅 on 14/11/30.
//  Copyright (c) 2014年 zks. All rights reserved.
//

#import "WaterImageContent.h"
#import "ContentImages.h"


@implementation WaterImageContent
- (id)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.width = [dict[@"width"] intValue];
        self.height = [dict[@"height"] intValue];
        self.oldcid = [dict[@"oldcid"] intValue];
        self.title = dict[@"title"];
        self.uid = [dict[@"uid"] intValue];
        self.likenum = [dict[@"likenum"] intValue];
        self.filename = dict[@"filename"];
        self.caseid = [dict[@"caseid"] intValue];
        self.commentnum = [dict[@"commentnum"] intValue];
        NSArray *contents = dict[@"imgs"];
        self.images = [NSMutableArray arrayWithCapacity:[contents count]];
        if (contents) {
            for (NSDictionary *contentImage in contents) {
                ContentImages *images = [[ContentImages alloc] initWithDict:contentImage];
                [self.images addObject:images];
            }
        }
        
        
    }
    return self;
}
@end
