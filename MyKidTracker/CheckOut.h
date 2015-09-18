//
//  CheckOut.h
//  FamilyCheckIn
//
//  Created by James Carlson on 9/18/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CheckIn, Location, User;

@interface CheckOut : NSManagedObject

@property (nonatomic, retain) NSDate * checkoutTime;
@property (nonatomic, retain) NSString * locationName;
@property (nonatomic, retain) NSNumber * wasSynced;
@property (nonatomic, retain) NSNumber * checkOutID;
@property (nonatomic, retain) CheckIn *checkIn;
@property (nonatomic, retain) Location *checkoutLocation;
@property (nonatomic, retain) User *userCheckout;

@end
