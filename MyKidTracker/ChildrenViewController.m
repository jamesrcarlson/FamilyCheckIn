//
//  ChildrenViewController.m
//  KidTracker
//
//  Created by James Carlson on 8/18/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import "ChildrenViewController.h"
#import "ChildCheckInViewController.h"
#import "UserController.h"

@interface ChildrenViewController ()<UISplitViewControllerDelegate>

@property NSMutableArray *objects;
@end

@implementation ChildrenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(popViewController)];
    self.navigationItem.leftBarButtonItem = addButton;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)popViewController {
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [UserController sharedInstance].users.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    User *user = [UserController sharedInstance].users[indexPath.row];
    cell.textLabel.text = user.userFirstName;
    cell.detailTextLabel.text = user.userLastName;
    
    if (user.isCheckedIn == YES) {
        cell.detailTextLabel.text = @"Checked in";
        cell.backgroundColor = [UIColor greenColor];
    } else if (user.isCheckedIn == NO) {
        cell.detailTextLabel.text = @"Not currently checked in";
        cell.backgroundColor = [UIColor redColor];
    }
    
    return cell;
}

//- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
//    // Return NO if you do not want the specified item to be editable.
//    return YES;
//}
//
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        User *user = [UserController sharedInstance].users[indexPath.row];
        [[UserController sharedInstance]removeEntry:user];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [tableView reloadData];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"childrenCheckins"]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        ChildCheckInViewController *controller = segue.destinationViewController;
        controller.anotherUser = [UserController sharedInstance].users[indexPath.row];
    }
    
}
@end
