//
//  ToDoItemController.h
//  MyKidTracker
//
//  Created by James Carlson on 8/20/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ToDoItem+Additions.h"

@interface ToDoItemController : NSObject

@property (strong, nonatomic) NSArray *toDoLists;

+ (ToDoItemController *)sharedInstance;

- (ToDoItem *)createToDoItemWithTitle:(NSString *)title details:(NSString *)description location:(Location *)location familyName:(Family *)familyName assignedUser:(User *)user dueDate:(NSDate *)date isCompleted:(BOOL)done;
- (void)save;
- (void)removeToDoItem:(ToDoItem *)toDo;

@end
