//
//  Stack.m
//
//  Created by James Carlson on 8/30/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//


#import <Foundation/Foundation.h>
@import CoreData;

@interface Stack : NSObject

+ (Stack *)sharedInstance;

@property (nonatomic, strong, readonly) NSManagedObjectContext *managedObjectContext;

@end