//
//  ISApplicationAssembly.m
//  iSubte
//
//  Created by Fernando Sproviero on 7/8/15.
//  Copyright (c) 2015 FS. All rights reserved.
//

#import "ISApplicationAssembly.h"
#import "ISStatusTableViewController.h"
#import "ISSubwayStatusClientImpl.h"

@implementation ISApplicationAssembly

- (id)config
{
    return [TyphoonDefinition configDefinitionWithName:@"Configuration.plist"];
}

- (ISStatusTableViewController *)statusTableViewController
{
    return [TyphoonDefinition withClass:[ISStatusTableViewController class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(statusClient) with:[self statusClient]];
                          }];
}

- (ISSubwayStatusClientImpl *)statusClient
{
    return [TyphoonDefinition withClass:[ISSubwayStatusClientImpl class]
                          configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(initWithBaseUrl:) parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:TyphoonConfig(@"api.baseUrl")];
        }];
    }];
}

@end
