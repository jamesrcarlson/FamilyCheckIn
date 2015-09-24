//
//  TheToken.h
//  FamilyCheckIn
//
//  Created by James Carlson on 9/23/15.
//  Copyright © 2015 JC2DEV, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TheToken : NSObject

@property (strong, nonatomic)NSString *token;

+ (TheToken *)sharedInstance ;

@end
