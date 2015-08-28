//
//  User.h
//  MyKidTracker
//
//  Created by James Carlson on 8/27/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CheckIn, Child, Family, Parent, ToDoItem;

@interface User : NSManagedObject

@property (nonatomic, retain) NSString * familyName;
@property (nonatomic, retain) NSString * userEmail;
@property (nonatomic, retain) NSString * userFirstName;
@property (nonatomic, retain) NSString * userLastName;
@property (nonatomic, retain) NSNumber * userPhoneNumber;
@property (nonatomic, retain) NSData * userPhoto;
@property (nonatomic, retain) NSString * userRole;
@property (nonatomic, retain) NSSet *checkIns;
@property (nonatomic, retain) NSSet *children;
@property (nonatomic, retain) Family *myFamily;
@property (nonatomic, retain) NSSet *parents;
@property (nonatomic, retain) NSSet *toDoList;
@end

@interface User (CoreDataGeneratedAccessors)

- (void)addCheckInsObject:(CheckIn *)value;
- (void)removeCheckInsObject:(CheckIn *)value;
- (void)addCheckIns:(NSSet *)values;
- (void)removeCheckIns:(NSSet *)values;

- (void)addChildrenObject:(Child *)value;
- (void)removeChildrenObject:(Child *)value;
- (void)addChildren:(NSSet *)values;
- (void)removeChildren:(NSSet *)values;

- (void)addParentsObject:(Parent *)value;
- (void)removeParentsObject:(Parent *)value;
- (void)addParents:(NSSet *)values;
- (void)removeParents:(NSSet *)values;

- (void)addToDoListObject:(ToDoItem *)value;
- (void)removeToDoListObject:(ToDoItem *)value;
- (void)addToDoList:(NSSet *)values;
- (void)removeToDoList:(NSSet *)values;

@end
