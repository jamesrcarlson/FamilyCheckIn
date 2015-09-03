//
//  Location.h
//  MyKidTracker
//
//  Created by James Carlson on 9/2/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CheckIn, CheckOut, Family, ToDoItem;

@interface Location : NSManagedObject

@property (nonatomic, retain) NSString * address;
@property (nonatomic, retain) NSString * latitude;
@property (nonatomic, retain) NSString * locationSnippet;
@property (nonatomic, retain) NSString * locationTitle;
@property (nonatomic, retain) NSString * longitude;
@property (nonatomic, retain) NSNumber * radius;
@property (nonatomic, retain) NSSet *checkIns;
@property (nonatomic, retain) CheckOut *checkouts;
@property (nonatomic, retain) ToDoItem *toDoLists;
@property (nonatomic, retain) NSSet *family;
@end

@interface Location (CoreDataGeneratedAccessors)

- (void)addCheckInsObject:(CheckIn *)value;
- (void)removeCheckInsObject:(CheckIn *)value;
- (void)addCheckIns:(NSSet *)values;
- (void)removeCheckIns:(NSSet *)values;

- (void)addFamilyObject:(Family *)value;
- (void)removeFamilyObject:(Family *)value;
- (void)addFamily:(NSSet *)values;
- (void)removeFamily:(NSSet *)values;

@end
