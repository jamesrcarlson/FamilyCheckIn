//
//  TheToken.m
//  FamilyCheckIn
//
//  Created by James Carlson on 9/23/15.
//  Copyright © 2015 JC2DEV, LLC. All rights reserved.
//

#import "TheToken.h"

@implementation TheToken

+ (TheToken *)sharedInstance {
    static TheToken *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [TheToken new];
        [sharedInstance token];
    });
    return sharedInstance;
}
@end
