//
//  ViewController.m
//  PDFtest
//
//  Created by Dragos on 12/21/15.
//  Copyright © 2015 Tellence. All rights reserved.
//

#import "ViewController.h"
#import "PDFView.h"
#import "PDFCell.h"

@interface ViewController ()
{
    PDFView* pdfView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSString *newPDFName = [NSString stringWithFormat:@"%@.pdf", @"Bill"];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSString *pdfPath = [documentsDirectory stringByAppendingPathComponent:newPDFName];
    
    
    pdfView = [[[NSBundle mainBundle] loadNibNamed:@"PDFView" owner:self options:nil] objectAtIndex:0];
    
    [self setupProductsTableView];
//    
//    [self savePDF:[self generatePDF] toFile:pdfPath];
    
    // Do any additional setup after loading the view, typically from a nib.
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PDFCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.labelCount.text = [NSString stringWithFormat:@"%d",indexPath.row+1];
    
    return cell;
}


-(void)setupProductsTableView
{
    [pdfView.tableViewBIll registerNib:[UINib nibWithNibName:@"PDFCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    
    pdfView.tableViewBIll.delegate = self;
    pdfView.tableViewBIll.dataSource = self;
}


- (NSData*)generatePDF {
    NSMutableData * pdfData=[NSMutableData data];
    
    // by default, the UIKit will create a 612x792 page size (8.5 x 11 inches)
    // if you pass in CGRectZero for the size
    UIGraphicsBeginPDFContextToData(pdfData, CGRectZero,nil);
    CGContextRef pdfContext=UIGraphicsGetCurrentContext();
    
    // repeat the code between the lines for each pdf page you want to output
    // ======================================================================
    UIGraphicsBeginPDFPage();
    
    // add code to update the UI elements in the first page here
    
    // use the currently being outputed view's layer here
    [pdfView.layer renderInContext:pdfContext];
    
    // end repeat code
    // ======================================================================
    
    // finally end the PDF context.
    UIGraphicsEndPDFContext();
    
    // and return the PDF data.
    return pdfData;
}

- (IBAction)beginSendingPDF:(id)sender {
    
    pdfView.labelClient.text =[NSString stringWithFormat:@"%@ %@",pdfView.labelClient.text, _tfClient.text];
    
    [self emailPDF:[self generatePDF]];
}



- (IBAction)dropKeyboard:(UITapGestureRecognizer *)sender {
    
    [self.view endEditing:YES];
}




- (void)emailPDF:(NSData*)pdfData {
    MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
    
    picker.mailComposeDelegate = self;
    [picker setSubject:@"Factura PDF"];
    [picker addAttachmentData:pdfData mimeType:@"application/pdf"
                     fileName:[NSString stringWithFormat:@"NessusBill.pdf"]];
    [picker setMessageBody:@"Atasat gasesti factura dorita." isHTML:YES];
    
    
    [self presentViewController:picker
                       animated:YES completion:nil];
    
}



- (void)mailComposeController:(MFMailComposeViewController*)controller
          didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error {
    [self dismissViewControllerAnimated:YES completion:nil];
    if (result==MessageComposeResultSent) {
        NSLog(@"PDF sent");
    } else {
        NSLog(@"PDF send error %@",error.description);
    }
}


- (BOOL)savePDF:(NSData*)pdfData toFile:(NSString*)filePath {
    if(![pdfData writeToFile:filePath atomically:NO]){
        NSLog(@"Failed to pdf to file '%@'", filePath);
        return NO;
    }
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
