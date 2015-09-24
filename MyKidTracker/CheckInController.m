//
//  CheckInController.m
//  MyKidTracker
//
//  Created by James Carlson on 8/20/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import "CheckInController.h"
#import "Stack.h"
#import "UserController.h"
#import "NetworkController.h"

@implementation CheckInController

+ (CheckInController *)sharedInstance {
    static CheckInController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [CheckInController new];
    });
    return sharedInstance;
}

- (CheckIn *)createCheckInWithLocation:(Location *)location user:(User *)userName locationName:(NSString *)locationName checkInDate:(NSDate *)date synced:(BOOL)synced{
    
    CheckIn *checkIn = [NSEntityDescription insertNewObjectForEntityForName:@"CheckIn" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    checkIn.checkInLocation = location;
    checkIn.primaryUser = userName;
    checkIn.primaryUser.isCheckedIn = YES;
    checkIn.locationName = locationName;
    checkIn.date = date;
    
    NSDictionary *dictionary = @{
                                 
                                 };
    [[NetworkController manager]POST:@"locations/" parameters:dictionary success:^(AFHTTPRequestOperation * __nonnull task, id __nonnull success) {
        //do something
    } failure:^(AFHTTPRequestOperation * __nonnull task, NSError * __nonnull error) {
        //do something
    }];
    [self saveToPersistentStorage];
    
    return checkIn;
}

- (NSArray *)checkins {
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"CheckIn"];
    
    NSArray *fetchedObjects = [[Stack sharedInstance].managedObjectContext executeFetchRequest:fetchRequest error:nil];
    
    return fetchedObjects;
}

#pragma mark - Update

- (void)save {
    [self saveToPersistentStorage];
}

- (void)saveToPersistentStorage {
    [[Stack sharedInstance].managedObjectContext save:nil];
}

#pragma mark - Delete

- (void)removeCheckinItem:(CheckIn *)checkIn {
    [checkIn.managedObjectContext deleteObject:checkIn];
    [self save];
}

@end
