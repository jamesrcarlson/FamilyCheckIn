//
//  User.m
//  FamilyCheckIn
//
//  Created by James Carlson on 9/12/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import "User.h"
#import "CheckIn.h"
#import "CheckOut.h"
#import "Family.h"
#import "ToDoItem.h"


@implementation User

@dynamic activeUser;
@dynamic currentlyCheckedIn;
@dynamic familyName;
@dynamic userEmail;
@dynamic userFirstName;
@dynamic userLastName;
@dynamic userPhoneNumber;
@dynamic userPhoto;
@dynamic userRole;
@dynamic syncedBefore;
@dynamic checkIns;
@dynamic checkouts;
@dynamic myFamily;
@dynamic toDoList;

@end
