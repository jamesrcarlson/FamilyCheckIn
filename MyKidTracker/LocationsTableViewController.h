//
//  LocationsTableViewController.h
//  MyKidTracker
//
//  Created by James Carlson on 8/26/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LocationController.h"

@protocol selectLocationDelegate <NSObject>

- (void) userDidSelectLocation:(Location *)location locationTitle:(NSString *)locationTitle withLocation:(NSString *)longitude latitude:(NSString *)latitude;

@end


@interface LocationsTableViewController : UITableViewController

@property (nonatomic, weak) id <selectLocationDelegate>delegate;

@end
