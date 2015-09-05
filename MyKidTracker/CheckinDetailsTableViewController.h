//
//  DetailsTableViewController.h
//  MyKidTracker
//
//  Created by James Carlson on 8/29/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CheckInController.h"
#import "UserController.h"
@import MapKit;

@interface CheckinDetailsTableViewController : UITableViewController {
    MKMapView *checkInMapView;
}

@property (strong, nonatomic) CheckIn *theCheckIn;
@property (strong, nonatomic) User *userDetail;


@end
