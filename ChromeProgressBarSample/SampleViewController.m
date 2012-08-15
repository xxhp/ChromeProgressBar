//
//  SampleViewController.m
//  ChromeProgressBarSample
//
//  Created by Mario Nguyen on 01/12/11.
//  Copyright (c) 2012 Mario Nguyen. All rights reserved.
//

#import "SampleViewController.h"

@implementation SampleViewController

@synthesize addressBox, webView;

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidUnload {
    [self setAddressBox:nil];
    [self setWebView:nil];
    chromeBar = nil;
    
    // Release any retained subviews of the main view.
    [super viewDidUnload];
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


- (void)webView:(IMTWebView *)_webView didReceiveResourceNumber:(int)resourceNumber totalResources:(int)totalResources {
    //Set progress value
    [chromeBar setProgress:((float)resourceNumber) / ((float)totalResources) animated:NO];

    //Reset resource count after finished
    if (resourceNumber == totalResources) {
        _webView.resourceCount = 0;
        _webView.resourceCompletedCount = 0;
    }
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self loadRequest];
    return YES;
}

- (IBAction)goButtonTap:(id)sender {
    [self loadRequest];    
}


- (void)loadRequest {
    if (chromeBar) {
        UIView* subview = (UIView*)chromeBar;
        [subview removeFromSuperview];
    }
    
    chromeBar = [[ChromeProgressBar alloc] initWithFrame:CGRectMake(0.0f, 50.0f, self.view.bounds.size.width, 4.0f)];
    
    [self.view addSubview:chromeBar];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString: [NSString stringWithFormat:@"http://%@", addressBox.text]]]];
    [chromeBar release];
    [addressBox resignFirstResponder];
}

- (void)dealloc {
    [addressBox release];
    [webView release];
    [super dealloc];
}

@end
