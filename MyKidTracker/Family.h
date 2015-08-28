//
//  Family.h
//  MyKidTracker
//
//  Created by James Carlson on 8/27/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ToDoItem, User;

@interface Family : NSManagedObject

@property (nonatomic, retain) NSString * familyName;
@property (nonatomic, retain) NSSet *toDoList;
@property (nonatomic, retain) User *user;
@end

@interface Family (CoreDataGeneratedAccessors)

- (void)addToDoListObject:(ToDoItem *)value;
- (void)removeToDoListObject:(ToDoItem *)value;
- (void)addToDoList:(NSSet *)values;
- (void)removeToDoList:(NSSet *)values;

@end
