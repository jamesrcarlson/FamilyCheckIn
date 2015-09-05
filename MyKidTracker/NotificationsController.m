//
//  NotificationsController.m
//  MyKidTracker
//
//  Created by James Carlson on 9/1/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import "NotificationsController.h"
@import MapKit;
@import CoreLocation;

@interface NotificationsController ()

@property (strong, nonatomic) CLLocationManager *locationManager;


@end

@implementation NotificationsController


- (void) registerNotifications {
    
}

- (void) setUpLocations {
    
}

- (void) alertUserToStatus {
    
}

- (void)registerRegionWithCircularOverlay:(MKCircle*)overlay andIdentifier:(NSString*)identifier {
    
    // If the overlay's radius is too large, registration fails automatically,
    // so clamp the radius to the max value.
    CLLocationDistance radius = overlay.radius;
    if (radius > self.locationManager.maximumRegionMonitoringDistance) {
        radius = self.locationManager.maximumRegionMonitoringDistance;
    }
    
    // Create the geographic region to be monitored.
    CLLocationCoordinate2D center = CLLocationCoordinate2DMake(42.280597,-83.751891);
    CLRegion *bridge = [[CLCircularRegion alloc]initWithCenter:center radius:100.0 identifier:@"Bridge"];
    [self.locationManager startMonitoringForRegion:bridge];

    
    CLCircularRegion *geoRegion = [[CLCircularRegion alloc] initWithCenter:overlay.coordinate radius:radius identifier:identifier];
    
    [self.locationManager startMonitoringForRegion:geoRegion];
}

- (void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region {
    
}

- (void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region {
    
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    
}

- (void)locationManager:(CLLocationManager *)manager didStartMonitoringForRegion:(CLRegion *)region {
    
}

- (void)locationManager:(CLLocationManager *)manager monitoringDidFailForRegion:(CLRegion *)region withError:(NSError *)error {
    
}

@end
