//
//  ISStatusTableViewController.m
//  iSubte
//
//  Created by Fernando Sproviero on 7/7/15.
//  Copyright (c) 2015 FS. All rights reserved.
//

#import "ISStatusTableViewController.h"
#import "ISSubwayStatus.h"
#import "ISSubwayStatusCell.h"
#import "ISDetailViewController.h"

@interface ISStatusTableViewController ()

@property (strong, nonatomic) NSArray *items;

@end

@implementation ISStatusTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self configureRefreshControl];
}

- (void)configureRefreshControl
{
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self
                            action:@selector(fetchItems)
                  forControlEvents:UIControlEventValueChanged];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self fetchItems];
}

- (void)fetchItems
{
    __weak typeof(self) weakSelf = self;
    [self.statusClient subwayStatusesWithSuccessBlock:^(NSArray *subways) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        strongSelf.items = subways;
        [strongSelf.tableView reloadData];
        [strongSelf updateRefreshControlWithDate:[NSDate date]];
        [strongSelf.refreshControl endRefreshing];
    } errorBlock:^(NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

- (void)updateRefreshControlWithDate:(NSDate *)date
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MMM d, h:mm a"];
    NSString *title = [NSString stringWithFormat:@"Última actualización: %@", [formatter stringFromDate:date]];
    NSDictionary *attrsDictionary = [NSDictionary dictionaryWithObject:[UIColor blackColor]
                                                                forKey:NSForegroundColorAttributeName];
    NSAttributedString *attributedTitle = [[NSAttributedString alloc] initWithString:title attributes:attrsDictionary];
    self.refreshControl.attributedTitle = attributedTitle;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"Detail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        ISSubwayStatus *subway = self.items[indexPath.row];
        ISDetailViewController *detailViewController = segue.destinationViewController;
        detailViewController.lineName = subway.name;
    }
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
