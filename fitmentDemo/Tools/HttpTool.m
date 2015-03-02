//
//  HttpTool.m
//  fitmentDemo
//
//  Created by 朱恪帅 on 14/11/30.
//  Copyright (c) 2014年 zks. All rights reserved.
//
#import "HttpTool.h"
#import "AFHTTPRequestOperationManager.h"

@implementation HttpTool
+ (void)getWith:(NSString *)url parameters:(NSDictionary *)parameters success:(HTTPSuccessBlock)success failure:(HTTPFailureBlock)failure
{
    [self requestWith:url parameters:parameters success:success failure:failure method:@"GET"];
}
+ (void)postWith:(NSString *)url parameters:(NSDictionary *)parameters success:(HTTPSuccessBlock)success failure:(HTTPFailureBlock)failure
{
    [self requestWith:url parameters:parameters success:success failure:failure method:@"POST"];
}

+ (void)requestWith:(NSString *)url parameters:(NSDictionary *)parameters success:(HTTPSuccessBlock)success failure:(HTTPFailureBlock)failure method:(NSString *)method
{
     AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    manager.responseSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    if ([@"GET" isEqualToString:method]) {
        [manager GET:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
            if (success == nil) return ;
            success(responseObject);
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            if (failure == nil) {
                return ;
            }
            failure(error);
        }];
    }else{
        [manager POST:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
            if (success == nil) return ;
            success(responseObject);
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            if (failure == nil) {
                return ;
            }
            failure(error);
        }];
    }
 
}
@end
