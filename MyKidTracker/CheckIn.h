//
//  CheckIn.h
//  MyKidTracker
//
//  Created by James Carlson on 8/22/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Child, Location, PrimaryUser;

@interface CheckIn : NSManagedObject

@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSString * locationName;
@property (nonatomic, retain) Child *child;
@property (nonatomic, retain) Location *location;
@property (nonatomic, retain) PrimaryUser *primaryUser;

@end