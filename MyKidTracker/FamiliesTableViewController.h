//
//  FamiliesTableViewController.h
//  MyKidTracker
//
//  Created by James Carlson on 8/29/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FamilyController.h"

@protocol selectedAFamilyDelegate <NSObject>

-(void)userDidSelectFamily:(Family *)familyName;

@end

@interface FamiliesTableViewController : UITableViewController

@property (strong, nonatomic)id <selectedAFamilyDelegate> delegate;

@end
