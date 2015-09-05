//
//  LogInController.h
//  MyKidTracker
//
//  Created by James Carlson on 9/3/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LogInController : NSObject

@property (strong, nonatomic) NSString *userN;
@property (strong, nonatomic) NSString *passW;

-(void)userLogon;

@end
