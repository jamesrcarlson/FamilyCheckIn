//
//  SetNewLocationViewController.m
//  MyKidTracker
//
//  Created by James Carlson on 8/22/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import "SetNewLocationMapViewController.h"
#import "LocationAnnotation.h"
#import "NewLocationTableViewController.h"

@interface SetNewLocationMapViewController () 

@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;

@property (strong, nonatomic) CLLocationManager *locationManager;

@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@end

@implementation SetNewLocationMapViewController

@synthesize mapView, locationManager;

-(void)viewDidLoad {
    [super viewDidLoad];
    
    self.searchBar.delegate = self;
    self.mapView.delegate = self;
    self.locationManager = [[CLLocationManager alloc]init];
    [locationManager setDelegate:self];
    [locationManager requestAlwaysAuthorization];
    [locationManager setDistanceFilter:kCLDistanceFilterNone];
    [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    [self.mapView setShowsUserLocation:YES];
    
    
    UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(handleLongPressGesture:)];
    [self.mapView addGestureRecognizer:longPressGesture];
//    [self.navigationItem.backBarButtonItem setTitle:@"Done"];//not working
    self.navigationController.navigationItem.backBarButtonItem.title = @"Done";//also not working
    

}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    
    [searchBar resignFirstResponder];
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder geocodeAddressString:searchBar.text completionHandler:^(NSArray *placemarks, NSError *error) {
        //Error checking
        
        CLPlacemark *placemark = [placemarks objectAtIndex:0];
        MKCoordinateRegion region;
        
        CLCircularRegion *pmCircularRegion = (CLCircularRegion *)placemark.region;
        region = MKCoordinateRegionMakeWithDistance(
                                                    pmCircularRegion.center,
                                                    pmCircularRegion.radius,
                                                    pmCircularRegion.radius);
//        CLPlacemark *placemark = [placemarks objectAtIndex:0];
//        MKCoordinateRegion region;
//        region.center.latitude = placemark.region.center.latitude;
//        region.center.longitude = placemark.region.center.longitude;
//        MKCoordinateSpan span;
//        double radius = placemark.region.radius / 1000; // convert to km
        
//        NSLog(@"[searchBarSearchButtonClicked] Radius is %f", radius);
//        span.latitudeDelta = radius / 112.0;
//        
//        region.span = span;
        
        [mapView setRegion:region animated:YES];
    }];
}

//- (IBAction)doneWithMap:(id)sender {
//    
//    [self.navigationController popViewControllerAnimated:YES];
//    
//}


- (void) handleLongPressGesture:(UIGestureRecognizer*)sender {
    // This is important if you only want to receive one tap and hold event
    if (sender.state == UIGestureRecognizerStateEnded || sender.state == UIGestureRecognizerStateChanged)
//        return; //this will allow the user to continue to set additional pins
//    if (sender.state == UIGestureRecognizerStateEnded)
    {
        [self.mapView removeGestureRecognizer:sender];
    }
    else
    {
        // Here we get the CGPoint for the touch and convert it to latitude and longitude coordinates to display on the map
        CGPoint point = [sender locationInView:self.mapView];
        CLLocationCoordinate2D locCoord = [self.mapView convertPoint:point toCoordinateFromView:self.mapView];
        // Then all you have to do is create the annotation and add it to the map
        LocationAnnotation *dropPin = [[LocationAnnotation alloc] init];
//        NewLocationTableViewController *newLocation = [NewLocationTableViewController new];
//        newLocation.locationLatitude = [NSString stringWithFormat:@"%f",locCoord.latitude];
//        newLocation.locationLongitude = [NSString stringWithFormat:@"%f",locCoord.longitude];
        self.latitudeText = [NSString stringWithFormat:@"%f",locCoord.latitude];
        self.longitudeText = [NSString stringWithFormat:@"%f",locCoord.longitude];
//        NSLog(@"location :%@, %@",newLocation.locationLatitude, newLocation.locationLongitude);
//        dropPin.latitude = [NSNumber numberWithDouble:locCoord.latitude];
//        dropPin.longitude = [NSNumber numberWithDouble:locCoord.longitude];
        dropPin.coordinate = locCoord;
        [self.mapView addAnnotation:dropPin];
    }
}

- (void) setNewPoint {
    
    
    
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
    [locationManager stopUpdatingLocation];
    
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
