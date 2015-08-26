//
//  Child.h
//  MyKidTracker
//
//  Created by James Carlson on 8/22/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CheckIn, Family, NSManagedObject, PrimaryUser, ToDoItem;

@interface Child : NSManagedObject

@property (nonatomic, retain) NSString * emailAddress;
@property (nonatomic, retain) NSString * familyName;
@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) NSNumber * phoneNumber;
@property (nonatomic, retain) NSData * profilePhoto;
@property (nonatomic, retain) NSSet *checkIns;
@property (nonatomic, retain) PrimaryUser *primaryUser;
@property (nonatomic, retain) ToDoItem *toDoList;
@property (nonatomic, retain) Family *family;
@property (nonatomic, retain) NSSet *parents;
@end

@interface Child (CoreDataGeneratedAccessors)

- (void)addCheckInsObject:(CheckIn *)value;
- (void)removeCheckInsObject:(CheckIn *)value;
- (void)addCheckIns:(NSSet *)values;
- (void)removeCheckIns:(NSSet *)values;

- (void)addParentsObject:(NSManagedObject *)value;
- (void)removeParentsObject:(NSManagedObject *)value;
- (void)addParents:(NSSet *)values;
- (void)removeParents:(NSSet *)values;

@end
