//
//  CheckOut+Additions.m
//  FamilyCheckIn
//
//  Created by James Carlson on 9/13/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import "CheckOut+Additions.h"

@implementation CheckOut (Additions)

-(BOOL)yesWasSynced {
    return self.wasSynced.boolValue;
}
-(void)setYesWasSynced:(BOOL)yesWasSynced {
    self.wasSynced = @(yesWasSynced);
}
@end
