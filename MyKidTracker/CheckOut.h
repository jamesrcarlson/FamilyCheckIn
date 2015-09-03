//
//  CheckOut.h
//  MyKidTracker
//
//  Created by James Carlson on 8/30/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CheckIn, Location, User;

@interface CheckOut : NSManagedObject

@property (nonatomic, retain) NSString * locationName;
@property (nonatomic, retain) NSDate * checkoutTime;
@property (nonatomic, retain) Location *checkoutLocation;
@property (nonatomic, retain) User *userCheckout;
@property (nonatomic, retain) CheckIn *checkIn;

@end
