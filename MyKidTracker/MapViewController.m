//
//  MapViewController.m
//  MyKidTracker
//
//  Created by James Carlson on 8/20/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import "MapViewController.h"
#import "LocationController.h"
#import "LocationAnnotation.h"


@implementation MapViewController

@synthesize mapView, locationManager;

-(void)viewDidLoad {
    [super viewDidLoad];
    
    self.mapView.delegate = self;
    self.locationManager = [[CLLocationManager alloc]init];
    [locationManager setDelegate:self];
    [locationManager requestAlwaysAuthorization];
    [locationManager setDistanceFilter:kCLDistanceFilterNone];
    [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    [self.mapView setShowsUserLocation:YES];
    
    [self setPoints];
    
}

- (void) setPoints {
    
    for (Location *location in [[LocationController sharedInstance]locations]){
        CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(location.latitude.doubleValue, location.longitude.doubleValue);
//        coordinate.latitude = location.latitude.doubleValue; // same thing as above
//        coordinate.longitude = location.longitude.doubleValue;
        LocationAnnotation *myAnnotation = [[LocationAnnotation alloc] init];
        myAnnotation.coordinate = coordinate;
        myAnnotation.title = location.locationTitle;
        myAnnotation.subtitle = location.locationSnippet;
        [mapView addAnnotation:myAnnotation];
    }
    
}

//-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
//
//    if ([annotation isKindOfClass:[MKUserLocation class]]) {
//        return nil;
//    }
//    if ([annotation isKindOfClass:[MKPointAnnotation class]]) {
//        MKAnnotationView *pinView = (MKAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:@"CustomPinAnnotationView"];
//        pinView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"CustomPinAnnotationView"];
//        //pinView.animatesDrop = YES;
//        pinView.canShowCallout = YES;
//        pinView.image = [UIImage imageNamed:@"download.jpeg"];
//        pinView.calloutOffset = CGPointMake(0, 32);
//        return nil;
//    } //else //{
////        pinView.annotation = annotation;
////    }
////    return pinView;
////    }
//    
//    return nil;
//    
//}

//- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view {
//
//    
////    LocationAnnotation *annotation = view.annotation;
////    
////    
////    UIViewController *controller = [[UIViewController alloc] init];
////    controller.preferredContentSize = CGSizeMake(100, 100);
////    
////    controller.modalPresentationStyle = UIModalPresentationPopover;
////    controller.presentationController.delegate = self;
////    controller.popoverPresentationController.sourceRect = view.bounds;
////    controller.popoverPresentationController.sourceView = view;
////    
////    UILabel *mylabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
////    
////    mylabel.text = annotation.subtitle;
////    
////    
////    [self presentViewController:controller animated:true completion:^{
////        
////    }];
//    
//}

//- (void)mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)view {
//    
//}

-(UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller traitCollection:(UITraitCollection *)traitCollection {
    return UIModalPresentationNone;
}


-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    
    MKCoordinateRegion mapRegion;
    mapRegion.center = self.mapView.userLocation.coordinate;
    mapRegion.span.latitudeDelta = 0.2;
    mapRegion.span.longitudeDelta = 0.2;
    
    [self.mapView setRegion:mapRegion animated:YES];
    
}

- (IBAction)changeMapType:(id)sender {
    
    switch (((UISegmentedControl *)sender).selectedSegmentIndex) {
        case 0:
            mapView.mapType = MKMapTypeStandard;
            break;
        case 1:
            mapView.mapType = MKMapTypeSatellite;
            break;
        case 2:
            mapView.mapType = MKMapTypeHybrid;
            break;
            
        default:
            break;
    };
    
}

@end
