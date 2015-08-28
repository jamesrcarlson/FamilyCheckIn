//
//  ChildController.m
//  MyKidTracker
//
//  Created by James Carlson on 8/20/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import "ChildController.h"
#import "Stack.h"

@implementation ChildController

+ (ChildController *)sharedInstance {
    static ChildController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [ChildController new];
    });
    return sharedInstance;
}

- (Child *)createChildWithFamilyName:(NSString *)family firstname:(NSString *)firstname lastName:(NSString *)lastName emailAddress:(NSString *)email phoneNumber:(NSNumber *)number{
    
    Child *child = [NSEntityDescription insertNewObjectForEntityForName:@"Child" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    child.familyName = family;
    child.firstName = firstname;
    child.lastName = lastName;
    child.emailAddress = email;
    child.phoneNumber = number;
    
    [self saveToPersistentStorage];
    
    return child;
}

#pragma mark - Read

- (NSArray *)children {
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Child"];
    
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

- (void)removeChild:(Child *)child {
    [child.managedObjectContext deleteObject:child];
    [self save];
}

@end
