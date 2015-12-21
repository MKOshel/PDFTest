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
    
}


-(void)setupBill
{
    _labelNumber.text = @"R5688TFC";
    _viewFCT.layer.borderWidth = 1.0;
    _viewFCT.layer.borderColor = [UIColor blackColor].CGColor;

}


@end
