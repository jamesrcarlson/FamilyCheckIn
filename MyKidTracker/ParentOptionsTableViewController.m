//
//  ParentOptionsTableViewController.m
//  MyKidTracker
//
//  Created by James Carlson on 8/22/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import "ParentOptionsTableViewController.h"
#import "NewLocationTableViewController.h"
#import "MasterViewController.h"
#import "CreateToDoListTableViewController.h"
#import "LocationsTableViewController.h"
#import "ToDoListsTableViewController.h"

@interface ParentOptionsTableViewController ()

@end

@implementation ParentOptionsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return 6;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 0) {
        MasterViewController *masterView = (MasterViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"MasterViewController"];
        [self.navigationController pushViewController:masterView animated:YES];
        
    }
    if (indexPath.row == 2) {
        LocationsTableViewController *locations = (LocationsTableViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"LocationsTableViewController"];
        [self.navigationController pushViewController:locations animated:YES];
    }
    if (indexPath.row == 3) {
        ToDoListsTableViewController *toDo = (ToDoListsTableViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"ToDoListsTableViewController"];
        [self.navigationController pushViewController:toDo animated:YES];
    }
    if (indexPath.row == 4) {
        CreateToDoListTableViewController *createList = (CreateToDoListTableViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"CreateToDoList"];
        [self.navigationController pushViewController:createList animated:YES];
    }
    if (indexPath.row == 5) {
        NewLocationTableViewController *newLocation = (NewLocationTableViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"NewLocation"];
        [self.navigationController pushViewController:newLocation animated:YES];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
