//
//  PDFView.m
//  PDFtest
//
//  Created by Dragos on 12/21/15.
//  Copyright © 2015 Tellence. All rights reserved.
//

#import "PDFView.h"

@implementation PDFView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animat/Users/dragos/Desktop/PDFtest/PDFtest/PDFView.mion.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-(void)awakeFromNib
{

    [self setupBill];
}


-(void)setupBill
{
    self.layer.borderColor = [UIColor blackColor].CGColor;
    self.layer.borderWidth = 1.0;
    
    _labelNumber.text = @"Serie FCT nr: R5688TFC";
    NSDateFormatter* df = [[NSDateFormatter alloc]init];
    [df setDateFormat:@"dd.MM.yyyy"];
    _labelDate.text =[NSString stringWithFormat:@"%@%@",@"Data: ",[df stringFromDate:[NSDate date]]];
    
    _viewFCT.layer.borderWidth = 1.0;
    _viewFCT.layer.borderColor = [UIColor blackColor].CGColor;
    
    _viewServices.layer.borderColor = [UIColor blackColor].CGColor;
    _viewServices.layer.borderWidth = 1.0;
    _viewSignature.layer.borderColor = [UIColor blackColor].CGColor;
    _viewSignature.layer.borderWidth = 1.0;
    

}


@end
