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

-(User *)createUserWithFamily:(Family *)family firstname:(NSString *)firstname lastName:(NSString *)lastName emailAddress:(NSString *)email phoneNumber:(NSNumber *)number userID:(NSNumber *)iD userPhoto:(NSData *)photo userRole:(BOOL)role isCheckedIn:(BOOL)checkedIn userSynced:(BOOL)synced;

-(User *)createActiveUserWithFamily:(Family *)family firstname:(NSString *)firstname lastName:(NSString *)lastName emailAddress:(NSString *)email phoneNumber:(NSNumber *)number userID:(NSNumber *)iD userPhoto:(NSData *)photo userRole:(BOOL)role userSynced:(BOOL)synced;

- (void)removeEntry:(User *)user;

@end
