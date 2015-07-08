//
//  ISStatusTableViewController.m
//  iSubte
//
//  Created by Fernando Sproviero on 7/7/15.
//  Copyright (c) 2015 FS. All rights reserved.
//

#import "ISStatusTableViewController.h"
#import "ISSubwayStatus.h"
#import "ISSubwayStatusClient.h"
#import "ISSubwayStatusCell.h"

@interface ISStatusTableViewController ()

@property (strong, nonatomic) NSArray *items;

@end

@implementation ISStatusTableViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self fetchItems];
}

- (void)fetchItems
{
    ISSubwayStatusClient *statusClient = [[ISSubwayStatusClient alloc] init];
    __weak typeof(self) weakSelf = self;
    [statusClient subwayStatusesWithSuccesBlockWithSuccessBlock:^(NSArray *subways) {
        __strong typeof(self) strongSelf = weakSelf;
        strongSelf.items = subways;
        [strongSelf.tableView reloadData];
    } errorBlock:^(NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ISSubwayStatusCell *cell = [tableView dequeueReusableCellWithIdentifier:@"StatusCell" forIndexPath:indexPath];
    
    ISSubwayStatus *subway = self.items[indexPath.row];
    [cell setNameLabelText:subway.name];
    [cell setStatusLabelText:subway.status];
    [cell setLineLabelText:[@"Línea " stringByAppendingString:subway.name]];
    
    return cell;
}

@end
