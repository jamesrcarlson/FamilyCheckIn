//
//  TheUser+Additions.m
//  FamilyCheckIn
//
//  Created by James Carlson on 9/5/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import "TheUser+Additions.h"

@implementation TheUser (Additions)

- (BOOL)theUserIsParent {
    return self.theUserRole.boolValue;
}

- (void)setTheUserIsParent:(BOOL)theUserIsParent {
    self.theUserRole = @(theUserIsParent);
}

- (BOOL)theUserIsCheckedIn {
    return self.theUserIsCheckedIn.boolValue;
}

- (void)setTheUserIsCheckedIn:(BOOL)theUserIsCheckedIn {
    self.theUserIsCheckedIn = @(theUserIsCheckedIn);
}

@end
