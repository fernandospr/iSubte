//
//  ISBannerTwoViewController.m
//  iSubte
//
//  Created by Fernando Sproviero on 7/15/15.
//  Copyright (c) 2015 FS. All rights reserved.
//

#import "ISBannerTwoViewController.h"

@interface ISBannerTwoViewController()

@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation ISBannerTwoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.button setTitle:self.lineName forState:UIControlStateNormal];
}

- (IBAction)actionOne:(id)sender
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:self.button.titleLabel.text
                                                        message:nil
                                                       delegate:nil
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil];
    [alertView show];
}

- (IBAction)actionTwo:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
