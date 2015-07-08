//
//  ISSubway+Serializer.m
//  iSubte
//
//  Created by Fernando Sproviero on 7/7/15.
//  Copyright (c) 2015 FS. All rights reserved.
//

#import "ISSubway+Serializer.h"

@implementation ISSubwayStatus (Serializer)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        self.name = dictionary[@"LineName"];
        self.status = dictionary[@"LineStatus"];
    }
    return self;
}

@end
