//
//  ISSubwayStatusClient.h
//  iSubte
//
//  Created by Fernando Sproviero on 7/7/15.
//  Copyright (c) 2015 FS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ISSubwayStatusClient : NSObject

- (void)subwayStatusesWithSuccesBlockWithSuccessBlock:(void (^)(NSArray *subways))successBlock // Array of ISSubwayStatus
                                           errorBlock:(void (^)(NSError *error))errorBlock;

@end
