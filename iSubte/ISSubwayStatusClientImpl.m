//
//  ISSubwayStatusClientImpl.m
//  iSubte
//
//  Created by Fernando Sproviero on 7/7/15.
//  Copyright (c) 2015 FS. All rights reserved.
//

#import "ISSubwayStatusClientImpl.h"
#import "AFNetworking.h"
#import "ISSubway+Serializer.h"

@interface ISSubwayStatusClientImpl()

@property (copy, nonatomic) NSString *baseUrl;

@end

@implementation ISSubwayStatusClientImpl

- (instancetype)initWithBaseUrl:(NSString *)baseUrl
{
    self = [super init];
    if (self) {
        self.baseUrl = baseUrl;
    }
    return self;
}

- (void)subwayStatusesWithSuccessBlock:(void (^)(NSArray *subways))successBlock
                            errorBlock:(void (^)(NSError *error))errorBlock {
    NSString *serviceUrl = [self.baseUrl stringByAppendingString:@"/Estado?site=Metrovias"];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:serviceUrl
      parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             NSMutableArray *results = [[NSMutableArray alloc] initWithArray:@[]];
             for (NSDictionary *subwayDictionary in responseObject) {
                 ISSubwayStatus *subway = [[ISSubwayStatus alloc] initWithDictionary:subwayDictionary];
                 [results addObject:subway];
             }
             if (successBlock) {
                 successBlock(results);
             }
         } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             if (errorBlock) {
                 errorBlock(error);
             }
         }];
}
@end
