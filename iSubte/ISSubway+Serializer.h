//
//  ISSubway+Serializer.h
//  iSubte
//
//  Created by Fernando Sproviero on 7/7/15.
//  Copyright (c) 2015 FS. All rights reserved.
//

#import "ISSubwayStatus.h"

@interface ISSubwayStatus (Serializer)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end