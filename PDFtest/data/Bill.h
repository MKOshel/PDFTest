//
//  Bill.h
//  PDFtest
//
//  Created by Dragos on 3/31/16.
//  Copyright © 2016 Tellence. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Profile.h"
#import "Carrier.h"
#import "Composer.h"
#import "ProductQuantity.h"


@interface Bill : NSObject

@property(nonatomic,strong) Composer* composer;
@property(nonatomic,strong) Profile* vendor;
@property(nonatomic,strong) Profile* client;
@property(nonatomic,strong) Carrier* carrier;
@property(nonatomic,strong) NSArray* products;
@property(nonatomic,strong) NSString* status;
@property(nonatomic,strong) NSString* billSeries;
@property(nonatomic,strong) NSDate* date;
@property(nonatomic,strong) NSDate* dateDue;
@property(nonatomic,readwrite) short vat;

@end
