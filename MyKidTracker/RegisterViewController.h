//
//  RegisterViewController.h
//  FamilyCheckIn
//
//  Created by James Carlson on 8/18/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol userDidRegisterDelegate <NSObject>

-(void)userDidRegisterName:(NSString *)name password:(NSString *)password;

@end

@interface RegisterViewController : UITableViewController

@property (strong, nonatomic) id <userDidRegisterDelegate>delegate;

@end
