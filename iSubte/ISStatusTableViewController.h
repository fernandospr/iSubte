//
//  ISStatusTableViewController.h
//  iSubte
//
//  Created by Fernando Sproviero on 7/7/15.
//  Copyright (c) 2015 FS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ISSubwayStatusClient.h"
#import "ISDetailViewController.h"

@protocol ISDetailControllerProvider

- (ISDetailViewController *)detailViewController;

@end

@interface ISStatusTableViewController : UITableViewController

@property (strong, nonatomic) id<ISSubwayStatusClient> statusClient;
@property (strong, nonatomic) id<ISDetailControllerProvider> detailControllerProvider;

@end
