//
//  SetNewLocationViewController.h
//  MyKidTracker
//
//  Created by James Carlson on 8/22/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
@import MapKit;
@import CoreLocation;

@interface SetNewLocationMapViewController : UIViewController<MKMapViewDelegate, CLLocationManagerDelegate, UIAdaptivePresentationControllerDelegate, UISearchBarDelegate>{
    MKMapView *mapView;
}

@property (strong, nonatomic) NSString *latitudeText;
@property (strong, nonatomic) NSString *longitudeText;


@end
