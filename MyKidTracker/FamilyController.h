//
//  FamilyController.h
//  MyKidTracker
//
//  Created by James Carlson on 8/28/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Family.h"

@interface FamilyController : NSObject

@property (strong, nonatomic) NSArray *families;

+ (FamilyController *)sharedInstance;

- (Family *)createFamilyWithName:(NSString *)familyName;

@end
