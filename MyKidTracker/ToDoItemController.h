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
@property (strong, nonatomic) ToDoItem *needsDone;

+ (ToDoItemController *)sharedInstance;

- (ToDoItem *)createToDoItemWithTitle:(NSString *)title details:(NSString *)description location:(Location *)itemLocation familyName:(Family *)familyName assignedUser:(User *)user dueDate:(NSDate *)date isCompleted:(BOOL)done synced:(BOOL)synced;
- (void)save;
- (void)removeToDoItem:(ToDoItem *)toDo;

@end
