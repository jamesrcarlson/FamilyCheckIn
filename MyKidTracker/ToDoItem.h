//
//  ToDoItem.h
//  MyKidTracker
//
//  Created by James Carlson on 8/27/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Family, Location, User;

@interface ToDoItem : NSManagedObject

@property (nonatomic, retain) NSNumber * completed;
@property (nonatomic, retain) NSDate * dueDate;
@property (nonatomic, retain) NSString * assignedFamily;
@property (nonatomic, retain) NSString * itemDescription;
@property (nonatomic, retain) NSString * itemTitle;
@property (nonatomic, retain) NSString * locationName;
@property (nonatomic, retain) User *userForItem;
@property (nonatomic, retain) Family *familyForItem;
@property (nonatomic, retain) Location *itemLocation;

@end
