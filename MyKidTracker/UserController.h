//
//  PrimaryUserController.h
//  MyKidTracker
//
//  Created by James Carlson on 8/20/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User+Additions.h"

@interface UserController : NSObject

@property (strong, nonatomic) NSArray *users;

+ (UserController *)sharedInstance;

- (User *)createUserWithFamily:(Family *)family firstname:(NSString *)firstname lastName:(NSString *)lastName emailAddress:(NSString *)email phoneNumber:(NSNumber *)number userRole:(BOOL)role isActiveUser:(BOOL)isActive;

- (void)removeEntry:(User *)user;

@end
