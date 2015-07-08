//
//  ISSubwayStatusClient.h
//  iSubte
//
//  Created by Fernando Sproviero on 7/8/15.
//  Copyright (c) 2015 FS. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ISSubwayStatusClient <NSObject>

- (void)subwayStatusesWithSuccessBlock:(void (^)(NSArray *subways))successBlock // Array of ISSubwayStatus
                            errorBlock:(void (^)(NSError *error))errorBlock;

@end
