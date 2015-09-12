//
//  Location.m
//  FamilyCheckIn
//
//  Created by James Carlson on 9/12/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import "Location.h"
#import "CheckIn.h"
#import "CheckOut.h"
#import "Family.h"
#import "ToDoItem.h"


@implementation Location

@dynamic address;
@dynamic latitude;
@dynamic locationSnippet;
@dynamic locationTitle;
@dynamic longitude;
@dynamic radius;
@dynamic gotSynced;
@dynamic checkIns;
@dynamic checkouts;
@dynamic familysForLocation;
@dynamic toDoLists;

@end
