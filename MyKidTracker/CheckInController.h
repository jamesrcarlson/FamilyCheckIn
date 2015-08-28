//
//  CheckInController.h
//  MyKidTracker
//
//  Created by James Carlson on 8/20/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CheckIn.h"

@interface CheckInController : NSObject

@property (strong, nonatomic) NSArray *checkins;

+ (CheckInController *)sharedInstance;

- (CheckIn *)createCheckInWithLocationName:(NSString *)locationName checkInDate:(NSDate *)date;

- (void)removeCheckinItem:(CheckIn *)checkIn;

@end
