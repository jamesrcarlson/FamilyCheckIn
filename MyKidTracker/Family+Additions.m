//
//  Family+Additions.m
//  FamilyCheckIn
//
//  Created by James Carlson on 9/13/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import "Family+Additions.h"

@implementation Family (Additions)

-(BOOL)hasSynced {
    return self.synced.boolValue;
}
-(void)setHasSynced:(BOOL)hasSynced {
    self.synced = @(hasSynced);
}
@end
