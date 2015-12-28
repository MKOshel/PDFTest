//
//  PDFCell.h
//  PDFtest
//
//  Created by Dragos on 12/24/15.
//  Copyright © 2015 Tellence. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PDFCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *labelDescr;
@property (strong, nonatomic) IBOutlet UILabel *labelUM;
@property (strong, nonatomic) IBOutlet UILabel *labelQuantity;
@property (strong, nonatomic) IBOutlet UILabel *labelPrice;
@property (strong, nonatomic) IBOutlet UILabel *labelVAT;
@property (strong, nonatomic) IBOutlet UILabel *labelCount;

@end
