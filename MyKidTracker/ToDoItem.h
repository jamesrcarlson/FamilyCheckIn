//
//  ToDoItem.h
//  MyKidTracker
//
//  Created by James Carlson on 8/27/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Child, Family, Location, User;

@interface ToDoItem : NSManagedObject

@property (nonatomic, retain) NSString * completed;
@property (nonatomic, retain) NSDate * dueDate;
@property (nonatomic, retain) NSString * family;
@property (nonatomic, retain) NSString * itemDescription;
@property (nonatomic, retain) NSString * itemTitle;
@property (nonatomic, retain) NSString * locationName;
@property (nonatomic, retain) Child *child;
@property (nonatomic, retain) Family *familyName;
@property (nonatomic, retain) Location *location;
@property (nonatomic, retain) User *primaryUser;

@end
