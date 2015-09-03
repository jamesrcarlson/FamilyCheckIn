//
//  User.h
//  MyKidTracker
//
//  Created by James Carlson on 8/30/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CheckIn, CheckOut, Family, ToDoItem;

@interface User : NSManagedObject

@property (nonatomic, retain) NSString * familyName;
@property (nonatomic, retain) NSString * userEmail;
@property (nonatomic, retain) NSString * userFirstName;
@property (nonatomic, retain) NSString * userLastName;
@property (nonatomic, retain) NSNumber * userPhoneNumber;
@property (nonatomic, retain) NSData * userPhoto;
@property (nonatomic, retain) NSNumber * userRole;
@property (nonatomic, retain) NSNumber * currentlyCheckedIn;
@property (nonatomic, retain) NSSet *checkIns;
@property (nonatomic, retain) Family *myFamily;
@property (nonatomic, retain) NSSet *toDoList;
@property (nonatomic, retain) NSSet *checkouts;
@end

@interface User (CoreDataGeneratedAccessors)

- (void)addCheckInsObject:(CheckIn *)value;
- (void)removeCheckInsObject:(CheckIn *)value;
- (void)addCheckIns:(NSSet *)values;
- (void)removeCheckIns:(NSSet *)values;

- (void)addToDoListObject:(ToDoItem *)value;
- (void)removeToDoListObject:(ToDoItem *)value;
- (void)addToDoList:(NSSet *)values;
- (void)removeToDoList:(NSSet *)values;

- (void)addCheckoutsObject:(CheckOut *)value;
- (void)removeCheckoutsObject:(CheckOut *)value;
- (void)addCheckouts:(NSSet *)values;
- (void)removeCheckouts:(NSSet *)values;

@end
