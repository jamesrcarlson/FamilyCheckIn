//
//  DetailsTableViewController.m
//  MyKidTracker
//
//  Created by James Carlson on 8/29/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import "DetailsTableViewController.h"
#import "LocationAnnotation.h"
#import "LocationController.h"
#import "UserController.h"
@import MapKit;


@interface DetailsTableViewController ()<MKMapViewDelegate>

@property (strong, nonatomic) IBOutlet UILabel *CheckInUserName;
@property (strong, nonatomic) IBOutlet UILabel *checkInLocation;
@property (strong, nonatomic) IBOutlet UILabel *checkInTime;
@property (strong, nonatomic) IBOutlet MKMapView *checkInMapView;
@property (strong, nonatomic) CLLocationManager *checkinLocationManager;

@end

@implementation DetailsTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.checkInMapView.delegate = self;
    [self setPoints];
    [self setLabels];
}

- (void)setLabels {
    CheckIn *checkin = self.theCheckIn;
    User *user = self.theCheckIn.primaryUser;
    self.CheckInUserName.text = [NSString stringWithFormat:@"%@ %@",user.userFirstName, user.userLastName];
    self.checkInTime.text = [NSString stringWithFormat:@"%@",checkin.date];
}

- (void) setPoints {
    
//    CheckIn *checkin = self.theCheckIn;
    Location *location = self.theCheckIn.location;
    self.checkInLocation.text = location.locationTitle;
    
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(location.latitude.doubleValue, location.longitude.doubleValue);
            coordinate.latitude = location.latitude.doubleValue; // same thing as above
            coordinate.longitude = location.longitude.doubleValue;

    LocationAnnotation *myAnnotation = [[LocationAnnotation alloc] init];
    myAnnotation.coordinate = coordinate;
    myAnnotation.title = location.locationTitle;
    myAnnotation.subtitle = location.locationSnippet;
    
    MKCoordinateRegion mapRegion;
    mapRegion.center = coordinate;
    mapRegion.span.latitudeDelta = 0.2;
    mapRegion.span.longitudeDelta = 0.2;
    
    [self.checkInMapView setRegion:mapRegion animated:YES];
    [self.checkInMapView addAnnotation:myAnnotation];
    
}
- (IBAction)changeMapStyle:(id)sender {
    
    switch (((UISegmentedControl *)sender).selectedSegmentIndex) {
        case 0:
            self.checkInMapView.mapType = MKMapTypeStandard;
            break;
        case 1:
            self.checkInMapView.mapType = MKMapTypeSatellite;
            break;
        case 2:
            self.checkInMapView.mapType = MKMapTypeHybrid;
            break;
            
        default:
            break;
    };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return 10;
//}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end
