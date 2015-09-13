//
//  LocationDeatilsTableViewController.m
//  MyKidTracker
//
//  Created by James Carlson on 9/2/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import "LocationDeatilsTableViewController.h"
#import "LocationAnnotation.h"
@import MapKit;

@interface LocationDeatilsTableViewController ()<MKMapViewDelegate>
@property (strong, nonatomic) IBOutlet UILabel *locationName;
@property (strong, nonatomic) IBOutlet UILabel *locationSnippet;
@property (strong, nonatomic) IBOutlet UILabel *locLat;
@property (strong, nonatomic) IBOutlet UILabel *locLong;
@property (strong, nonatomic) IBOutlet UILabel *famiyName;
@property (strong, nonatomic) IBOutlet UILabel *locationRadius;
@property (strong, nonatomic) IBOutlet MKMapView *locationMapView;

@property (strong, nonatomic) NSString *string;

@end

@implementation LocationDeatilsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.locationMapView.delegate = self;
    self.string = @"";
    for (Family *family in self.locationDetail.familysForLocation) {
        self.string = [self.string stringByAppendingString:[NSString stringWithFormat:@"%@\n",family.familysName]];
    }
    [self setLabels];
    [self setPoints];
}

-(void)setLabels{
    self.locationName.text = self.locationDetail.locationTitle;
    self.locationSnippet.text = self.locationDetail.locationSnippet;
    self.locLat.text = [NSString stringWithFormat:@"Lat: %@",self.locationDetail.latitude];
    self.locLong.text = [NSString stringWithFormat:@"Long: %@",self.locationDetail.longitude];
    self.locationRadius.text = [NSString stringWithFormat:@"%@",self.locationDetail.radius];
    
    self.famiyName.text = self.string;
}

-(void)setPoints {
    Location *location = self.locationDetail;
    
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(location.latitude.doubleValue, location.longitude.doubleValue);
    coordinate.latitude = location.latitude.doubleValue; // same thing as above
    coordinate.longitude = location.longitude.doubleValue;
    
    LocationAnnotation *myAnnotation = [[LocationAnnotation alloc] init];
    myAnnotation.coordinate = coordinate;
    myAnnotation.title = location.locationTitle;
    myAnnotation.subtitle = location.locationSnippet;
    
    MKCoordinateRegion mapRegion;
    mapRegion.center = coordinate;
    mapRegion.span.latitudeDelta = 0.01;
    mapRegion.span.longitudeDelta = 0.01;
    
    [self.locationMapView setRegion:mapRegion animated:YES];
    [self.locationMapView addAnnotation:myAnnotation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return UITableViewAutomaticDimension;
}

- (IBAction)changeMapView:(id)sender {
    
    switch (((UISegmentedControl *)sender).selectedSegmentIndex) {
        case 0:
            self.locationMapView.mapType = MKMapTypeStandard;
            break;
        case 1:
            self.locationMapView.mapType = MKMapTypeSatellite;
            break;
        case 2:
            self.locationMapView.mapType = MKMapTypeHybrid;
            break;

    };
}

@end
