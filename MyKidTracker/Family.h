//
//  Family.h
//  MyKidTracker
//
//  Created by James Carlson on 9/2/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Location, ToDoItem, User;

@interface Family : NSManagedObject

@property (nonatomic, retain) NSString * familysName;
@property (nonatomic, retain) NSSet *toDoList;
@property (nonatomic, retain) NSSet *familyUsers;
@property (nonatomic, retain) NSSet *familyLocations;
@end

@interface Family (CoreDataGeneratedAccessors)

- (void)addToDoListObject:(ToDoItem *)value;
- (void)removeToDoListObject:(ToDoItem *)value;
- (void)addToDoList:(NSSet *)values;
- (void)removeToDoList:(NSSet *)values;

- (void)addFamilyUsersObject:(User *)value;
- (void)removeFamilyUsersObject:(User *)value;
- (void)addFamilyUsers:(NSSet *)values;
- (void)removeFamilyUsers:(NSSet *)values;

- (void)addFamilyLocationsObject:(Location *)value;
- (void)removeFamilyLocationsObject:(Location *)value;
- (void)addFamilyLocations:(NSSet *)values;
- (void)removeFamilyLocations:(NSSet *)values;

@end
