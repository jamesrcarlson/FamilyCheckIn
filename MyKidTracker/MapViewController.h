//
//  MapViewController.h
//  MyKidTracker
//
//  Created by James Carlson on 8/20/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
@import MapKit;
@import CoreLocation;

@interface MapViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate, UIAdaptivePresentationControllerDelegate>{
    MKMapView *mapView;
}

@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) CLLocationManager *locationManager;

@end
