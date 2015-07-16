//
//  ISBannerOneViewController.m
//  iSubte
//
//  Created by Fernando Sproviero on 7/15/15.
//  Copyright (c) 2015 FS. All rights reserved.
//

#import "ISBannerOneViewController.h"

@interface ISBannerOneViewController()

@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation ISBannerOneViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.button setTitle:self.lineName
                 forState:UIControlStateNormal];
}

- (IBAction)action:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
