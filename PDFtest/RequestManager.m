//
//  RequestManager.m
//  PDFtest
//
//  Created by Dragos on 3/29/16.
//  Copyright © 2016 Tellence. All rights reserved.
//

#define URL_BASE @"https://blue-homelabs.rhcloud.com"
#define URL_CREATE_USER @"https://blue-homelabs.rhcloud.com/api/users"

#import "RequestManager.h"

@implementation RequestManager



-(id)init
{
    if (self = [super init]) {
        [self setupSession];
    }
    
    return self;
}


+(RequestManager*)instance
{
    static RequestManager* httpClient = nil;
    static dispatch_once_t onceDispatch;
    dispatch_once(&onceDispatch, ^{
        httpClient = [[RequestManager alloc] init];
    });
    return httpClient;
}


-(void)setupSession
{
    NSURLSessionConfiguration* config = [NSURLSessionConfiguration defaultSessionConfiguration];
    _sessionManager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:config];
    
    _serializer = [AFJSONRequestSerializer serializer];
    [_serializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    _sessionManager.requestSerializer = _serializer;
    
}


-(void)createUserWithEmail:(NSString*)mail password:(NSString*)pass isAdmin:(BOOL)isAdmin
{
    
    NSMutableDictionary* parameters = [NSMutableDictionary new];
    
    [parameters setObject:mail forKey:@"email"];
    [parameters setObject:pass forKey:@"password"];
    [parameters setValue:[NSNumber numberWithBool:isAdmin] forKey:@"is_profile_admin"];

    [_sessionManager POST:URL_CREATE_USER parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"RESPONSE -> %@", responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"Error %@",error);
    }];
    

}


@end
