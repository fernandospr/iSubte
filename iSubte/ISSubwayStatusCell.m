//
//  ISSubwayStatusCell.m
//  iSubte
//
//  Created by Fernando Sproviero on 7/7/15.
//  Copyright (c) 2015 FS. All rights reserved.
//

#import "ISSubwayStatusCell.h"

@interface ISSubwayStatusCell()

@property (weak, nonatomic) IBOutlet UILabel *lineLabel;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIView *statusIndicatorView;

@end

@implementation ISSubwayStatusCell

- (void)setLineLabelText:(NSString *)text
{
    self.lineLabel.text = text;
}

- (void)setStatusLabelText:(NSString *)text
{
    self.statusLabel.text = text;
    if ([@"Normal" isEqualToString:text]) {
        self.statusLabel.textColor = [UIColor colorWithRed:0.000f green:0.639f blue:0.039f alpha:1.00f];
    } else {
        self.statusLabel.textColor = [UIColor colorWithRed:1.000f green:0.000f blue:0.000f alpha:1.00f];
    }
    self.statusIndicatorView.backgroundColor = self.statusLabel.textColor;
}

- (void)setNameLabelText:(NSString *)text
{
    self.nameLabel.text = text;
    UIColor *color = [ISSubwayStatusCell subwayColors][text];
    if (color != nil) {
        self.nameLabel.backgroundColor = color;
    } else {
        self.nameLabel.backgroundColor = [UIColor blackColor];
    }
}

+ (NSDictionary *)subwayColors
{
    static NSDictionary *colors = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        colors = @{
                   @"A": [UIColor colorWithRed:0.000f green:0.678f blue:0.886f alpha:1.00f],
                   @"B": [UIColor colorWithRed:1.000f green:0.000f blue:0.000f alpha:1.00f],
                   @"C": [UIColor colorWithRed:0.000f green:0.392f blue:0.718f alpha:1.00f],
                   @"D": [UIColor colorWithRed:0.000f green:0.518f blue:0.420f alpha:1.00f],
                   @"E": [UIColor colorWithRed:0.482f green:0.000f blue:0.506f alpha:1.00f],
                   @"H": [UIColor colorWithRed:1.000f green:0.804f blue:0.000f alpha:1.00f],
                   @"P": [UIColor colorWithRed:1.000f green:0.733f blue:0.000f alpha:1.00f],
                   @"U": [UIColor colorWithRed:1.000f green:0.376f blue:0.000f alpha:1.00f]
                   };
    });
    
    return colors;
}

@end
