//
//  ToDoListsTableViewController.m
//  MyKidTracker
//
//  Created by James Carlson on 8/27/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import "ToDoListsTableViewController.h"
#import "ToDoItemController.h"
#import "ToDoListDetailViewTableViewController.h"

@interface ToDoListsTableViewController ()

@end

@implementation ToDoListsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    [self.tableView reloadData];
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
    return [ToDoItemController sharedInstance].toDoLists.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"toDoListCell" forIndexPath:indexPath];
    
    ToDoItem *toDo = [ToDoItemController sharedInstance].toDoLists[indexPath.row];
    cell.textLabel.text = toDo.itemTitle;
    cell.detailTextLabel.text = toDo.itemDescription;
    if (toDo.itemIsCompleted == YES) {
        cell.backgroundColor = [UIColor greenColor];
    }
    if (toDo.itemIsCompleted == NO) {
        cell.backgroundColor = [UIColor redColor];
    }
    
    return cell;
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        ToDoItem *todo = [ToDoItemController sharedInstance].toDoLists[indexPath.row];
        [[ToDoItemController sharedInstance]removeToDoItem:todo];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"toDoDetail"]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        ToDoListDetailViewTableViewController *details = segue.destinationViewController;
        
        ToDoItem *toDo = [ToDoItemController sharedInstance].toDoLists[indexPath.row];
        details.toDoItemDetail = toDo;
    }
}

@end
