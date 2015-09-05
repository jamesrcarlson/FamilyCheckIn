//
//  LocationController.m
//  MyKidTracker
//
//  Created by James Carlson on 8/20/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import "LocationController.h"
#import "Stack.h"

@implementation LocationController

+ (LocationController *)sharedInstance {
    static LocationController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [LocationController new];
    });
    return sharedInstance;
}

- (Location *)createLocationWithFamily: (Family *)family title:(NSString *)title infoSnippet:(NSString *)snippet lattitude:(NSString *)lattitude longitude:(NSString *)longitude radius:(NSNumber *)radius {
    
    Location *location = [NSEntityDescription insertNewObjectForEntityForName:@"Location" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    
    [location addFamilysForLocationObject:family];
    location.locationTitle = title;
    location.locationSnippet = snippet;
    location.latitude = lattitude;
    location.longitude = longitude;
    
    [self saveToPersistentStorage];
    
    UILocalNotification *locNotification = [[UILocalNotification alloc] init];
    locNotification.alertBody = @"You have arrived!";
    locNotification.regionTriggersOnce = YES;
    
    CLLocationDistance theRadius = radius.doubleValue;
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(lattitude.doubleValue, longitude.doubleValue);
    locNotification.region = [[CLCircularRegion alloc]
                              initWithCenter:coordinate
                              radius:theRadius
                              identifier:title];
    locNotification.regionTriggersOnce = NO;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:locNotification];
    
    return location;
}

#pragma mark - Read

- (NSArray *)locations {
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Location"];
    
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

- (void)removeLocation:(Location *)location {
    [location.managedObjectContext deleteObject:location];
    [self save];
}

- (void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region {
    
}

- (void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region {
    
}

@end
