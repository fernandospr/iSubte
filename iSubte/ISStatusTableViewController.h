//
//  ISStatusTableViewController.h
//  iSubte
//
//  Created by Fernando Sproviero on 7/7/15.
//  Copyright (c) 2015 FS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ISSubwayStatusClient.h"

@interface ISStatusTableViewController : UITableViewController

@property (strong, nonatomic) ISSubwayStatusClient *statusClient;

@end
