//
//  LocationController.h
//  MyKidTracker
//
//  Created by James Carlson on 8/20/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Location.h"

@interface LocationController : NSObject

@property (strong, nonatomic) NSArray *locations;

+ (LocationController *)sharedInstance;

- (Location *)createLocationWithFamily: (NSString *)family title:(NSString *)title infoSnippet:(NSString *)snippet lattitude:(NSString *)lattitude longitude:(NSString *)longitude radius:(NSNumber *)radius ;

- (void)removeEntry:(Location *)location;

//- (void)addCheckInsObject:(NSManagedObject *)value; // these were created by the computer in the modelObject
//- (void)removeCheckInsObject:(NSManagedObject *)value;
//- (void)addCheckIns:(NSSet *)values;
//- (void)removeCheckIns:(NSSet *)values;

@end