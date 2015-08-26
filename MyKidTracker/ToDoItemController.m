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

- (ToDoItem *)createToDoItemWithTitle:(NSString *)title details:(NSString *)description locationName:(NSString *)location familyName:(NSString *)familyName dueDate:(NSDate *)date isComplete:(Boolean *)completed {
    
    ToDoItem *toDo = [NSEntityDescription insertNewObjectForEntityForName:@"ToDoItem" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    toDo.itemTitle = title;
    toDo.itemDescription = description;
    toDo.locationName = location;
    toDo.family = familyName;
    toDo.dueDate = date;
    toDo.completed = [NSNumber numberWithBool:completed];
    
    return toDo;
    
}

- (NSArray *)user {
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"User"];
    
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

- (void)removeEntry:(ToDoItem *)toDo {
    [toDo.managedObjectContext deleteObject:toDo];
}

@end
