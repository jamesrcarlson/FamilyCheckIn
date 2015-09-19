//
//  LocalToDoItemsTableViewController.m
//  FamilyCheckIn
//
//  Created by James Carlson on 9/18/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import "LocalToDoItemsTableViewController.h"
#import "ToDoItemController.h"
#import "ToDoListDetailViewTableViewController.h"
#import "CheckInController.h"

@interface LocalToDoItemsTableViewController ()

@property (strong, nonatomic) Location *theLocation;
@property (strong, nonatomic) NSMutableArray *items;
@property (strong, nonatomic) NSMutableArray *completedItems;

@end

@implementation LocalToDoItemsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.items = [NSMutableArray new];
    CheckInController *checkin = [CheckInController new];
    self.theLocation = checkin.atLocation;
    
    for (ToDoItem *todo in self.theLocation.toDoLists) {
        if (todo.itemIsCompleted == NO) {
            [self.items addObject:todo];
        }else if (todo.itemIsCompleted == YES){
            [self.completedItems addObject:todo];
        }
    }
    self.clearsSelectionOnViewWillAppear = YES;
    
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return @"Items need completed";
    }else {
        return @"Completed items";
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"localItemCells" forIndexPath:indexPath];
    if (indexPath.section == 0) {
        ToDoItem *item = self.items[indexPath.row];
        cell.textLabel.text = item.itemTitle;
        cell.detailTextLabel.text = item.itemDescription;
        cell.backgroundColor = [UIColor redColor];
    }
    if (indexPath.section == 1) {
        ToDoItem *item = self.completedItems[indexPath.row];
        cell.textLabel.text = item.itemTitle;
        cell.detailTextLabel.text = item.itemDescription;
        cell.backgroundColor = [UIColor greenColor];
    }
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"itemDetails"]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        ToDoListDetailViewTableViewController *details = segue.destinationViewController;
        
        ToDoItem *toDo = self.items[indexPath.row];
        details.toDoItemDetail = toDo;
    }
}

@end
