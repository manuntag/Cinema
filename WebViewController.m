//
//  WebViewController.m
//  Cinema
//
//  Created by David Manuntag on 2015-02-04.
//  Copyright (c) 2015 David Manuntag. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURLRequest * urlRequest = [NSURLRequest requestWithURL:self.mobileURL];
    [self.webView loadRequest:urlRequest];
    
    
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
