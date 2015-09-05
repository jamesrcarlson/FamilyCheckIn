//
//  User+Additions.h
//  MyKidTracker
//
//  Created by James Carlson on 8/27/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import "User.h"

@interface User (Additions)

@property (nonatomic, assign) BOOL isParent;
@property (nonatomic, assign) BOOL isCheckedIn;
@property (nonatomic, assign) BOOL isTheActiveUser;

@end
