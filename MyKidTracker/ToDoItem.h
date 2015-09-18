//
//  ToDoItem.h
//  FamilyCheckIn
//
//  Created by James Carlson on 9/18/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Family, Location, User;

@interface ToDoItem : NSManagedObject

@property (nonatomic, retain) NSString * assignedFamily;
@property (nonatomic, retain) NSNumber * completed;
@property (nonatomic, retain) NSDate * dueDate;
@property (nonatomic, retain) NSString * itemDescription;
@property (nonatomic, retain) NSString * itemTitle;
@property (nonatomic, retain) NSString * locationName;
@property (nonatomic, retain) NSNumber * syncedAlready;
@property (nonatomic, retain) NSNumber * toDoItemID;
@property (nonatomic, retain) Family *familyForItem;
@property (nonatomic, retain) Location *itemLocation;
@property (nonatomic, retain) User *userForItem;

@end
