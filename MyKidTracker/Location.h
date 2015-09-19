//
//  Location.h
//  FamilyCheckIn
//
//  Created by James Carlson on 9/18/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CheckIn, CheckOut, Family, ToDoItem;

@interface Location : NSManagedObject

@property (nonatomic, retain) NSString * address;
@property (nonatomic, retain) NSNumber * gotSynced;
@property (nonatomic, retain) NSString * latitude;
@property (nonatomic, retain) NSString * locationSnippet;
@property (nonatomic, retain) NSString * locationTitle;
@property (nonatomic, retain) NSString * longitude;
@property (nonatomic, retain) NSNumber * radius;
@property (nonatomic, retain) NSNumber * locationID;
@property (nonatomic, retain) NSSet *checkIns;
@property (nonatomic, retain) CheckOut *checkouts;
@property (nonatomic, retain) NSSet *familysForLocation;
@property (nonatomic, retain) NSSet *toDoLists;
@end

@interface Location (CoreDataGeneratedAccessors)

- (void)addCheckInsObject:(CheckIn *)value;
- (void)removeCheckInsObject:(CheckIn *)value;
- (void)addCheckIns:(NSSet *)values;
- (void)removeCheckIns:(NSSet *)values;

- (void)addFamilysForLocationObject:(Family *)value;
- (void)removeFamilysForLocationObject:(Family *)value;
- (void)addFamilysForLocation:(NSSet *)values;
- (void)removeFamilysForLocation:(NSSet *)values;

- (void)addToDoListsObject:(ToDoItem *)value;
- (void)removeToDoListsObject:(ToDoItem *)value;
- (void)addToDoLists:(NSSet *)values;
- (void)removeToDoLists:(NSSet *)values;

@end
