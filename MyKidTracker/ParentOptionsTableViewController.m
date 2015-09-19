//
//  ParentOptionsTableViewController.m
//  MyKidTracker
//
//  Created by James Carlson on 8/22/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import "ParentOptionsTableViewController.h"
#import "NewLocationTableViewController.h"
#import "ChildrenViewController.h"
#import "CreateToDoListTableViewController.h"
#import "LocationsTableViewController.h"
#import "ToDoListsTableViewController.h"
#import "ToDoListDetailViewTableViewController.h"
#import "ToDoItemController.h"
#import "LocalToDoItemsTableViewController.h"

@interface ParentOptionsTableViewController ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation ParentOptionsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    if (section == 0) {
        UIImage *image = [UIImage imageNamed:@"download.jpeg"];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
        imageView.frame = CGRectMake(0,0, self.view.frame.size.width,200);
        
        return imageView;
    } else {
        return nil;
    }
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            ChildrenViewController *masterView = (ChildrenViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"MasterViewController"];
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
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            ToDoListDetailViewTableViewController *detailView = (ToDoListDetailViewTableViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"ToDoListDetailViewTableViewController"];
            
            detailView.toDoItemDetail = [ToDoItemController sharedInstance].needsDone;
            [self.navigationController pushViewController:detailView animated:YES];
            
        }
        if (indexPath.row == 1) {
            LocalToDoItemsTableViewController *local = (LocalToDoItemsTableViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"LocalToDoItems"];
            [self.navigationController pushViewController:local animated:YES];
        }
    }
    
}

@end
