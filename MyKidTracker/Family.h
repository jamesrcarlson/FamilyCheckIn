//
//  Family.h
//  FamilyCheckIn
//
//  Created by James Carlson on 9/12/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Location, ToDoItem, User;

@interface Family : NSManagedObject

@property (nonatomic, retain) NSString * familysName;
@property (nonatomic, retain) NSNumber * synced;
@property (nonatomic, retain) NSSet *familyLocations;
@property (nonatomic, retain) NSSet *familyUsers;
@property (nonatomic, retain) NSSet *toDoList;
@end

@interface Family (CoreDataGeneratedAccessors)

- (void)addFamilyLocationsObject:(Location *)value;
- (void)removeFamilyLocationsObject:(Location *)value;
- (void)addFamilyLocations:(NSSet *)values;
- (void)removeFamilyLocations:(NSSet *)values;

- (void)addFamilyUsersObject:(User *)value;
- (void)removeFamilyUsersObject:(User *)value;
- (void)addFamilyUsers:(NSSet *)values;
- (void)removeFamilyUsers:(NSSet *)values;

- (void)addToDoListObject:(ToDoItem *)value;
- (void)removeToDoListObject:(ToDoItem *)value;
- (void)addToDoList:(NSSet *)values;
- (void)removeToDoList:(NSSet *)values;

@end
