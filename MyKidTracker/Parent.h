//
//  Parent.h
//  MyKidTracker
//
//  Created by James Carlson on 8/22/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Child, Family, PrimaryUser;

@interface Parent : NSManagedObject

@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) NSString * emailAddress;
@property (nonatomic, retain) NSNumber * phoneNumber;
@property (nonatomic, retain) PrimaryUser *user;
@property (nonatomic, retain) Family *familyName;
@property (nonatomic, retain) NSSet *children;
@end

@interface Parent (CoreDataGeneratedAccessors)

- (void)addChildrenObject:(Child *)value;
- (void)removeChildrenObject:(Child *)value;
- (void)addChildren:(NSSet *)values;
- (void)removeChildren:(NSSet *)values;

@end
