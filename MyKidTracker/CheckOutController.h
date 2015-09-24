//
//  CheckOutController.h
//  MyKidTracker
//
//  Created by James Carlson on 8/30/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CheckOut+Additions.h"

@interface CheckOutController : NSObject

@property (strong, nonatomic) NSArray *checkouts;

+ (CheckOutController *)sharedInstance;

- (CheckOut *)createCheckOutWithLocation:(Location *)location user:(User *)userName checkIn:(CheckIn *)theCheckin locationName:(NSString *)locationName checkOutDate:(NSDate *)date synced:(BOOL)synced;

- (void)removeCheckOutItem:(CheckOut *)checkOut;

@end
