//
//  ToDoItemController.m
//  MyKidTracker
//
//  Created by James Carlson on 8/20/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import "ToDoItemController.h"
#import "Stack.h"


@implementation ToDoItemController

+ (ToDoItemController *)sharedInstance {
    static ToDoItemController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [ToDoItemController new];
    });
    return sharedInstance;
}

- (ToDoItem *)createToDoItemWithTitle:(NSString *)title details:(NSString *)description location:(Location *)location familyName:(Family *)familyName assignedUser:(User *)user dueDate:(NSDate *)date isCompleted:(BOOL)done {
    
    ToDoItem *toDo = [NSEntityDescription insertNewObjectForEntityForName:@"ToDoItem" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    toDo.itemTitle = title;
    toDo.itemDescription = description;
    toDo.itemLocation = location;
    toDo.familyForItem = familyName;
    toDo.dueDate = date;
    toDo.itemIsCompleted = done;
    toDo.userForItem = user;
    
    [self saveToPersistentStorage];
    
    return toDo;
    
}

- (NSArray *)toDoLists {
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"ToDoItem"];
    
    NSArray *fetchedObjects = [[Stack sharedInstance].managedObjectContext executeFetchRequest:fetchRequest error:nil];
    
    return fetchedObjects;
}

#pragma mark - Update

- (void)save {
    [self saveToPersistentStorage];
}

- (void)saveToPersistentStorage {
    [[Stack sharedInstance].managedObjectContext save:nil];
}

#pragma mark - Delete

- (void)removeToDoItem:(ToDoItem *)toDo {
    [toDo.managedObjectContext deleteObject:toDo];
    [self save];
}

@end
