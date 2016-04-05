//
//  RequestManager.h
//  PDFtest
//
//  Created by Dragos on 3/29/16.
//  Copyright © 2016 Tellence. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface RequestManager : NSObject
@property(nonatomic,strong) AFHTTPSessionManager* sessionManager;
@property(nonatomic,strong) AFJSONRequestSerializer* serializer;
+(RequestManager*)instance;


-(void)createUserWithEmail:(NSString*)mail password:(NSString*)pass isAdmin:(BOOL)isAdmin;

@end
