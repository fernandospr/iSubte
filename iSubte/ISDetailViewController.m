//
//  ISDetailViewController.m
//  iSubte
//
//  Created by Fernando Sproviero on 7/15/15.
//  Copyright (c) 2015 FS. All rights reserved.
//

#import "ISDetailViewController.h"
#import "UIViewController+Container.h"

@interface ISDetailViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIView *bannerContainerView;

@end

@implementation ISDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.google.com.ar"]];
    [self.webView loadRequest:request];
    [self configureBannerViewController];
}

- (void)configureBannerViewController
{
    [self.bannerViewController setLineName:self.lineName];
    [self containerAddChildViewController:self.bannerViewController toContainerView:self.bannerContainerView useAutolayout:YES];
}

@end
