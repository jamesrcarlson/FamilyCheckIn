//
//  CheckInController.m
//  MyKidTracker
//
//  Created by James Carlson on 8/20/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import "CheckInController.h"
#import "Stack.h"

@implementation CheckInController

+ (CheckInController *)sharedInstance {
    static CheckInController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [CheckInController new];
    });
    return sharedInstance;
}

- (CheckIn *)createCheckInWithLocationName:(NSString *)locationName checkInDate:(NSDate *)date {
    
    CheckIn *checkIn = [NSEntityDescription insertNewObjectForEntityForName:@"CheckIn" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    checkIn.locationName = locationName;
    checkIn.date = date;
    
    [self saveToPersistentStorage];
    
    return checkIn;
}

- (NSArray *)checkins {
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"User"];
    
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

- (void)removeEntry:(CheckIn *)checkIn {
    [checkIn.managedObjectContext deleteObject:checkIn];
}

@end
