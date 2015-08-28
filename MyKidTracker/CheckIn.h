//
//  CheckIn.h
//  MyKidTracker
//
//  Created by James Carlson on 8/27/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Location, User;

@interface CheckIn : NSManagedObject

@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSString * locationName;
@property (nonatomic, retain) Location *location;
@property (nonatomic, retain) User *primaryUser;

@end
