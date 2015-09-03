//
//  KidDetailsViewController.m
//  KidTracker
//
//  Created by James Carlson on 8/18/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import "ChildCheckInViewController.h"
#import "UserController.h"
#import "CheckInController.h"
#import "DetailsTableViewController.h"

typedef NS_ENUM(NSUInteger, TableViewsection){
    TableViewsectionCheckIn,
    TableViewsectionCheckOut
};

@interface ChildCheckInViewController () <UISplitViewControllerDelegate>

@property NSMutableArray *theCheckins;
@property NSMutableArray *theCheckOuts;

@end

@implementation ChildCheckInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    User *currentUser = self.anotherUser;
    self.theCheckins =[NSMutableArray new];
    for (CheckIn *chekin in currentUser.checkIns) {
        [self.theCheckins addObject:chekin];
    }
    self.theCheckOuts =[NSMutableArray new];
    for (CheckOut *chekout in currentUser.checkIns) {
        [self.theCheckOuts addObject:chekout];
    }
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender {
//    if (!self.objects) {
//        self.objects = [[NSMutableArray alloc] init];
//    }
//    //    [self.objects insertObject:[NSDate date] atIndex:0];
//    NSString * myString = [NSString stringWithFormat:@"My New Data that was broght in:"];
//    [self.objects insertObject:myString  atIndex:0];
//    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
//    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    TableViewsection tableViewsection = section;

    switch (tableViewsection) {
        case TableViewsectionCheckIn:
            return self.theCheckins.count;
            
        case TableViewsectionCheckOut:
            return self.theCheckOuts.count;
    }
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section {
    return 30;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    TableViewsection tableViewsection = section;
    switch (tableViewsection) {
        case TableViewsectionCheckIn:
            return @"The Check-ins";
            break;
        case TableViewsectionCheckOut:
            return @"Check-outs";
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"kidDetailCell" forIndexPath:indexPath];
    
    if (indexPath.section == TableViewsectionCheckIn) {
        cell.textLabel.text = [self.theCheckins[indexPath.row]locationName];
    }
    if (indexPath.section == TableViewsectionCheckOut) {
        cell.textLabel.text = [self.theCheckOuts[indexPath.row]locationName];
    }
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        
//        Location *location = [LocationController sharedInstance].locations[indexPath.row];
//        [[LocationController sharedInstance]removeLocation:location];
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        DetailsTableViewController *details = segue.destinationViewController;
        User *user = self.anotherUser;
        details.userDetail = user;
        details.theCheckIn = [CheckInController sharedInstance].checkins[indexPath.row];
        
    }
}

@end
