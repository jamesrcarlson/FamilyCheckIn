//
//  UserListTableViewController.h
//  MyKidTracker
//
//  Created by James Carlson on 8/29/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserController.h"

@protocol selectedUserDelegate <NSObject>

- (void)userDidSelectUser:(User *)userSelected;

@end
@interface UserListTableViewController : UITableViewController

@property (strong, nonatomic) id <selectedUserDelegate> delegate;

@end
