//
//  PDFView.h
//  PDFtest
//
//  Created by Dragos on 12/21/15.
//  Copyright © 2015 Tellence. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PDFView : UIView
@property (strong, nonatomic) IBOutlet UIView *viewFCT;
@property (strong, nonatomic) IBOutlet UILabel *labelNumber;
-(void)setupBill;

@end
