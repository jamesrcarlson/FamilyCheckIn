//
//  FamilyController.m
//  MyKidTracker
//
//  Created by James Carlson on 8/28/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import "FamilyController.h"
#import "Stack.h"
#import "NetworkController.h"

@implementation FamilyController

+ (FamilyController *)sharedInstance {
    static FamilyController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [FamilyController new];
    });
    return sharedInstance;
}

- (Family *)createFamilyWithName:(NSString *)familyName {
    Family *aFamily = [NSEntityDescription insertNewObjectForEntityForName:@"Family" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    aFamily.familysName = familyName;
    
    [[NetworkController manager]POST:@"families/" parameters:familyName success:^(AFHTTPRequestOperation * __nonnull task, id __nonnull success) {
        //do something
    } failure:^(AFHTTPRequestOperation * __nonnull task, NSError * __nonnull error) {
        //do something
    }];
    [self saveToPersistentStorage];
    return aFamily;
}
- (NSArray *)families {
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Family"];
    
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

- (void)removeFamily:(Family *)theFamily {
    [theFamily.managedObjectContext deleteObject:theFamily];
    [self save];
}


@end
