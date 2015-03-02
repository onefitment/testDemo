//
//  NSString+zks.m
//  fitmentDemo
//
//  Created by 朱恪帅 on 14/12/2.
//  Copyright (c) 2014年 zks. All rights reserved.
//

#import "NSString+zks.h"

@implementation NSString (zks)
- (NSString *)imageAppend
{
    //获取文件的扩展名
    NSString *ext = [self pathExtension];
    //删除文件后的扩展名
    NSString *imageName = [self stringByDeletingPathExtension];
    //在文件头处拼接http://pic.to8to.com
    imageName = [@"pic.to8to.com" stringByAppendingString:imageName];
    imageName = [imageName stringByAppendingString:@"_r"];
    return [imageName stringByAppendingPathExtension:ext];
    
}
@end
