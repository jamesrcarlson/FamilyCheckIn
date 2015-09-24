//
//  LocationController.h
//  MyKidTracker
//
//  Created by James Carlson on 8/20/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Location+Additions.h"
#import "FamilyController.h"
#import <UIKit/UIKit.h>
@import MapKit;

@interface LocationController : NSObject

@property (strong, nonatomic) NSArray *locations;

+ (LocationController *)sharedInstance;

- (Location *)createLocationWithFamily: (Family *)family title:(NSString *)title infoSnippet:(NSString *)snippet lattitude:(NSString *)lattitude longitude:(NSString *)longitude radius:(NSNumber *)radius synced:(BOOL)synced;

- (void)removeLocation:(Location *)location;

@end
