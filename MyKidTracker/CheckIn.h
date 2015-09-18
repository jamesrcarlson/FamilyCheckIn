//
//  CheckIn.h
//  FamilyCheckIn
//
//  Created by James Carlson on 9/18/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CheckOut, Location, User;

@interface CheckIn : NSManagedObject

@property (nonatomic, retain) NSNumber * beenSynced;
@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSString * locationName;
@property (nonatomic, retain) NSNumber * checkInID;
@property (nonatomic, retain) Location *checkInLocation;
@property (nonatomic, retain) CheckOut *checkout;
@property (nonatomic, retain) User *primaryUser;

@end
