//
//  Family.h
//  MyKidTracker
//
//  Created by James Carlson on 8/22/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Child, NSManagedObject, PrimaryUser, ToDoItem;

@interface Family : NSManagedObject

@property (nonatomic, retain) NSString * familyName;
@property (nonatomic, retain) PrimaryUser *user;
@property (nonatomic, retain) NSSet *children;
@property (nonatomic, retain) NSSet *toDoList;
@property (nonatomic, retain) NSSet *parents;
@end

@interface Family (CoreDataGeneratedAccessors)

- (void)addChildrenObject:(Child *)value;
- (void)removeChildrenObject:(Child *)value;
- (void)addChildren:(NSSet *)values;
- (void)removeChildren:(NSSet *)values;

- (void)addToDoListObject:(ToDoItem *)value;
- (void)removeToDoListObject:(ToDoItem *)value;
- (void)addToDoList:(NSSet *)values;
- (void)removeToDoList:(NSSet *)values;

- (void)addParentsObject:(NSManagedObject *)value;
- (void)removeParentsObject:(NSManagedObject *)value;
- (void)addParents:(NSSet *)values;
- (void)removeParents:(NSSet *)values;

@end
