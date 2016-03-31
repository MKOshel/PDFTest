//
//  Profile.h
//  PDFtest
//
//  Created by Dragos on 3/31/16.
//  Copyright © 2016 Tellence. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Profile : NSObject

@property(nonatomic, readwrite) BOOL is_self; // if yes profile is vendor otherwise client
@property(nonatomic, strong) NSString* name;
@property(nonatomic, strong) NSString* address;
@property(nonatomic, strong) NSString* bank;
@property(nonatomic, strong) NSString* cif;
@property(nonatomic, strong) NSString* email;
@property(nonatomic, strong) NSString* iban;
@property(nonatomic, strong) NSString* city;

@end
