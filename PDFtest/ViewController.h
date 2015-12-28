//
//  ViewController.h
//  PDFtest
//
//  Created by Dragos on 12/21/15.
//  Copyright © 2015 Tellence. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface ViewController : UIViewController <MFMailComposeViewControllerDelegate,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *tfClient;

@end

