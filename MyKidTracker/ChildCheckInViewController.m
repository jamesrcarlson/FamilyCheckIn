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

@interface ChildCheckInViewController () <UISplitViewControllerDelegate>

@property NSMutableArray *objects;

@end

@implementation ChildCheckInViewController

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.splitViewController.delegate = self;
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.clearsSelectionOnViewWillAppear = NO;
        self.preferredContentSize = CGSizeMake(320.0, 600.0);
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender {
    if (!self.objects) {
        self.objects = [[NSMutableArray alloc] init];
    }
    //    [self.objects insertObject:[NSDate date] atIndex:0];
    NSString * myString = [NSString stringWithFormat:@"My New Data that was broght in:"];
    [self.objects insertObject:myString  atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}



#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [CheckInController sharedInstance].checkins.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"kidDetailCell" forIndexPath:indexPath];
    CheckIn *checkin = [CheckInController sharedInstance].checkins[indexPath.row];
    cell.textLabel.text = checkin.locationName;
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
        details.theCheckIn = [CheckInController sharedInstance].checkins[0];
        
    }
}

@end
