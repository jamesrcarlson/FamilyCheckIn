//
//  LocationsTableViewController.m
//  MyKidTracker
//
//  Created by James Carlson on 8/26/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import "LocationsTableViewController.h"
#import "LocationController.h"
#import "LocationDeatilsTableViewController.h"

@interface LocationsTableViewController ()

@end

@implementation LocationsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
     self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    NSLog([NSString stringWithFormat:@"%lu",(unsigned long)[LocationController sharedInstance].locations.count]);
    return [LocationController sharedInstance].locations.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Location *location = [LocationController sharedInstance].locations[indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"locationsCell" forIndexPath:indexPath];
    
    cell.textLabel.text = location.locationTitle;
    cell.detailTextLabel.text = location.locationSnippet;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Location *location = [LocationController sharedInstance].locations[indexPath.row];
    [self.delegate userDidSelectLocation:location.locationTitle withLocation:location.longitude latitude:location.latitude];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        Location *location = [LocationController sharedInstance].locations[indexPath.row];
        [[LocationController sharedInstance]removeLocation:location];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"locationDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        LocationDeatilsTableViewController *details = segue.destinationViewController;
        Location *location = [LocationController sharedInstance].locations[indexPath.row];
        details.locationDetail = location;
    }
}


@end
