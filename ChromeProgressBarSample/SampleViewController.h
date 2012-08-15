//
//  SampleViewController.h
//  ChromeProgressBarSample
//
//  Created by Mario Nguyen on 01/12/11.
//  Copyright (c) 2012 Mario Nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChromeProgressBar.h"
#import "IMTWebView.h"

@interface SampleViewController : UIViewController <UITextFieldDelegate, IMTWebViewProgressDelegate> {
    
    ChromeProgressBar *chromeBar;
}

@property (strong, retain) IBOutlet UITextField *addressBox;
@property (retain, retain) IBOutlet IMTWebView  *webView;
- (IBAction)goButtonTap:(id)sender;

@end