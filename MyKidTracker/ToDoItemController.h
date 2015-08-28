//
//  ToDoItemController.h
//  MyKidTracker
//
//  Created by James Carlson on 8/20/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ToDoItem+Additions.m"

@interface ToDoItemController : NSObject

@property (strong, nonatomic) NSArray *toDoLists;

+ (ToDoItemController *)sharedInstance;

- (ToDoItem *)createToDoItemWithTitle:(NSString *)title details:(NSString *)description location:(Location *)location familyName:(Family *)familyName dueDate:(NSDate *)date isComplete:(BOOL)completed;

- (void)removeToDoItem:(ToDoItem *)toDo;

@end
