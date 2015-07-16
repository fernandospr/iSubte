//
//  ISSubwayInfo.m
//  iSubte
//
//  Created by Fernando Sproviero on 7/15/15.
//  Copyright (c) 2015 FS. All rights reserved.
//

#import "ISSubwayInfo.h"

@interface ISSubwayInfo()

@property (strong, nonatomic) NSDictionary *urlDictionary;

@end

@implementation ISSubwayInfo

- (instancetype)initWithUrlDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        self.urlDictionary = dictionary;
    }
    return self;
}

- (NSURL *)urlForLine:(NSString *)line
{
    return [NSURL URLWithString:self.urlDictionary[line]];
}

@end
