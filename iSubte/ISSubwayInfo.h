//
//  ISSubwayInfo.h
//  iSubte
//
//  Created by Fernando Sproviero on 7/15/15.
//  Copyright (c) 2015 FS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ISSubwayInfo : NSObject

- (instancetype)initWithUrlDictionary:(NSDictionary *)dictionary;
- (NSURL *)urlForLine:(NSString *)line;

@end
