//
//  CheckOutController.m
//  MyKidTracker
//
//  Created by James Carlson on 8/30/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import "CheckOutController.h"
#import "Stack.h"
#import "UserController.h"
#import "CheckInController.h"
#import "NetworkController.h"

@implementation CheckOutController

+ (CheckOutController *)sharedInstance {
    static CheckOutController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [CheckOutController new];
    });
    return sharedInstance;
}

- (CheckOut *)createCheckOutWithLocation:(Location *)location user:(User *)userName checkIn:(CheckIn *)theCheckin locationName:(NSString *)locationName checkOutDate:(NSDate *)date synced:(BOOL)synced{
    
    CheckOut *checkOut = [NSEntityDescription insertNewObjectForEntityForName:@"CheckOut" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    checkOut.checkoutLocation = location;
    checkOut.userCheckout = userName;
    checkOut.userCheckout.isCheckedIn = NO;
    checkOut.checkIn = theCheckin;
    checkOut.locationName = locationName;
    checkOut.checkoutTime = date;
    theCheckin.checkout = checkOut;
    [[CheckInController sharedInstance]save];

    if (synced == NO) {
        NSDictionary *dictionary = @{
                                     
                                     };
        [[NetworkController manager]POST:@"locations/" parameters:dictionary success:^(AFHTTPRequestOperation * __nonnull task, id __nonnull success) {
            //do something
        } failure:^(AFHTTPRequestOperation * __nonnull task, NSError * __nonnull error) {
            //do something
        }];
    }
    
    [self saveToPersistentStorage];
    
    return checkOut;
}



- (NSArray *)checkouts {
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"CheckOut"];
    
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

- (void)removeCheckOutItem:(CheckOut *)checkOut {
    [checkOut.managedObjectContext deleteObject:checkOut];
    [self save];
}

@end
