//
//  CheckIn+Additions.m
//  FamilyCheckIn
//
//  Created by James Carlson on 9/13/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import "CheckIn+Additions.h"

@implementation CheckIn (Additions)

-(BOOL)hasBeenSynced {
    return self.beenSynced.boolValue;
}

-(void)setHasBeenSynced:(BOOL)hasBeenSynced {
    self.beenSynced = @(hasBeenSynced);
}

@end
