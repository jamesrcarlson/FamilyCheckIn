//
//  CheckIn.h
//  MyKidTracker
//
//  Created by James Carlson on 8/30/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CheckOut, Location, User;

@interface CheckIn : NSManagedObject

@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSString * locationName;
@property (nonatomic, retain) Location *checkInLocation;
@property (nonatomic, retain) User *primaryUser;
@property (nonatomic, retain) CheckOut *checkout;

@end
