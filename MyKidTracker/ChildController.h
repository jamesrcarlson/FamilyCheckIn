//
//  ChildController.h
//  MyKidTracker
//
//  Created by James Carlson on 8/20/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Child.h"

@interface ChildController : NSObject

@property (strong, nonatomic) NSArray *children;

+ (ChildController *)sharedInstance;

- (Child *)createChildWithFamilyName:(NSString *)family firstname:(NSString *)firstname lastName:(NSString *)lastName emailAddress:(NSString *)email phoneNumber:(NSNumber *)number userRole:(Boolean *)role;

@end
