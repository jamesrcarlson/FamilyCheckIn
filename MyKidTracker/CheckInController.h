//
//  CheckInController.h
//  MyKidTracker
//
//  Created by James Carlson on 8/20/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CheckIn+Additions.h"

@interface CheckInController : NSObject

@property (strong, nonatomic) NSArray *checkins;
@property (strong, nonatomic) Location *atLocation;

+ (CheckInController *)sharedInstance;

- (CheckIn *)createCheckInWithLocation:(Location *)location user:(User *)userName locationName:(NSString *)locationName checkInDate:(NSDate *)date synced:(BOOL)synced;
- (void)save;
- (void)removeCheckinItem:(CheckIn *)checkIn;

@end
