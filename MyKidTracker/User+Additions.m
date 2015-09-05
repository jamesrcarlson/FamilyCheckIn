//
//  User+Additions.m
//  MyKidTracker
//
//  Created by James Carlson on 8/27/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import "User+Additions.h"

@implementation User (Additions)

- (BOOL)isParent {
    return self.userRole.boolValue;
}

- (void)setIsParent:(BOOL)isParent {
    self.userRole = @(isParent);
}

- (BOOL)isCheckedIn {
    return self.currentlyCheckedIn.boolValue;
}

- (void)setIsCheckedIn:(BOOL)isCheckedIn {
    self.currentlyCheckedIn = @(isCheckedIn);
}

- (BOOL)isTheActiveUser {
    return self.activeUser.boolValue;
}

- (void)setIsTheActiveUser:(BOOL)isTheActiveUser {
    self.activeUser = @(isTheActiveUser);
}

@end
