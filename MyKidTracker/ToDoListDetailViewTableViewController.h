//
//  ToDoListDetailViewTableViewController.h
//  MyKidTracker
//
//  Created by James Carlson on 9/2/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserController.h"
#import "FamilyController.h"
#import "ToDoItemController.h"

@interface ToDoListDetailViewTableViewController : UITableViewController

@property (strong, nonatomic) User *toDoUser;
@property (strong, nonatomic) Family *toDoFamily;
@property (strong, nonatomic) ToDoItem *toDoItemDetail;

@end
