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
#import "ISDetailViewController.h"
#import "ISBannerOneViewController.h"
#import "ISBannerTwoViewController.h"
#import "ISSubwayInfo.h"

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

- (ISDetailViewController *)detailViewController
{
    return [TyphoonDefinition withClass:[ISDetailViewController class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(bannerViewController)
                                                    with:[self bannerViewController]];
                              [definition injectProperty:@selector(subwayInfo)
                                                    with:[self subwayInfo]];
    }];
}

- (UIViewController<ISBannerProtocol> *)bannerViewController
{
    return [TyphoonDefinition withClass:[ISBannerTwoViewController class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition useInitializer:@selector(initWithNibName:bundle:)
                                              parameters:^(TyphoonMethod *initializer) {
                                                  [initializer injectParameterWith:@"ISBannerTwoViewController"];
                                                  [initializer injectParameterWith:[NSBundle mainBundle]];
                              }];
   }];
}

- (ISSubwayInfo *)subwayInfo
{
    return [TyphoonDefinition withClass:[ISSubwayInfo class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition useInitializer:@selector(initWithUrlDictionary:)
                                              parameters:^(TyphoonMethod *initializer) {
                                                  [initializer injectParameterWith:@{@"A":@"https://es.wikipedia.org/wiki/L%C3%ADnea_A_(Subte_de_Buenos_Aires)",
                                                                                     @"B":@"https://es.wikipedia.org/wiki/L%C3%ADnea_B_(Subte_de_Buenos_Aires)",
                                                                                     @"C":@"https://es.wikipedia.org/wiki/L%C3%ADnea_C_(Subte_de_Buenos_Aires)",
                                                                                     @"D":@"https://es.wikipedia.org/wiki/L%C3%ADnea_D_(Subte_de_Buenos_Aires)",
                                                                                     @"E":@"https://es.wikipedia.org/wiki/L%C3%ADnea_E_(Subte_de_Buenos_Aires)",
                                                                                     @"H":@"https://es.wikipedia.org/wiki/L%C3%ADnea_H_(Subte_de_Buenos_Aires)",
                                                                                     @"P":@"https://es.wikipedia.org/wiki/Premetro_(Subte_de_Buenos_Aires)",
                                                                                     @"U":@"https://es.wikipedia.org/wiki/L%C3%ADnea_Urquiza"
                                                                                     }];
                                  
                              }];
                              definition.scope = TyphoonScopeSingleton;
            }];
}

@end
