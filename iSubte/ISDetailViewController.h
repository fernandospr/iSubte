//
//  ISDetailViewController.h
//  iSubte
//
//  Created by Fernando Sproviero on 7/15/15.
//  Copyright (c) 2015 FS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ISBannerProtocol.h"

@interface ISDetailViewController : UIViewController

@property (copy, nonatomic) NSString *lineName;
@property (strong, nonatomic) UIViewController<ISBannerProtocol> *bannerViewController;

@end
