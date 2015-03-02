//
//  HttpTool.h
//  fitmentDemo
//
//  Created by 朱恪帅 on 14/11/30.
//  Copyright (c) 2014年 zks. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^HTTPSuccessBlock)(id JSON);
typedef void (^HTTPFailureBlock)(NSError *error);
@interface HttpTool : NSObject
+ (void)getWith:(NSString *)url parameters:(NSDictionary *)parameters success:(HTTPSuccessBlock)success failure:(HTTPFailureBlock)failure;
+ (void)postWith:(NSString *)url parameters:(NSDictionary *)parameters success:(HTTPSuccessBlock)success failure:(HTTPFailureBlock)failure;
@end
