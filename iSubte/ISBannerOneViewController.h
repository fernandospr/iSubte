//
//  ISBannerOneViewController.h
//  iSubte
//
//  Created by Fernando Sproviero on 7/15/15.
//  Copyright (c) 2015 FS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ISBannerProtocol.h"

@interface ISBannerOneViewController : UIViewController<ISBannerProtocol>

@property (copy, nonatomic) NSString *lineName;

@end
