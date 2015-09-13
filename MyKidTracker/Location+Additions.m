//
//  Location+Additions.m
//  FamilyCheckIn
//
//  Created by James Carlson on 9/13/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import "Location+Additions.h"

@implementation Location (Additions)

-(BOOL)hasGotSynced {
    return self.gotSynced.boolValue;
}

-(void)setHasGotSynced:(BOOL)hasGotSynced {
    self.gotSynced = @(hasGotSynced);
}

@end
