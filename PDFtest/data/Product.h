//
//  Product.h
//  PDFtest
//
//  Created by Dragos on 3/31/16.
//  Copyright © 2016 Tellence. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject

@property(nonatomic, strong) NSString* name;
@property(nonatomic, strong) NSString* UM;
@property(nonatomic, strong) NSString* currency;
@property(nonatomic, readwrite) int   price;
@property(nonatomic, readwrite) short vat;

@end
