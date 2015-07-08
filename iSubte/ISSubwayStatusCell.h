//
//  ISSubwayStatusCell.h
//  iSubte
//
//  Created by Fernando Sproviero on 7/7/15.
//  Copyright (c) 2015 FS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ISSubwayStatusCell : UITableViewCell

- (void)setLineLabelText:(NSString *)text;
- (void)setStatusLabelText:(NSString *)text;
- (void)setNameLabelText:(NSString *)text;

@end