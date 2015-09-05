//
//  ToDoListDetailViewTableViewController.m
//  MyKidTracker
//
//  Created by James Carlson on 9/2/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import "ToDoListDetailViewTableViewController.h"
@import MapKit;

@interface ToDoListDetailViewTableViewController ()<MKMapViewDelegate>

@property (strong, nonatomic) IBOutlet UILabel *itemTitle;
@property (strong, nonatomic) IBOutlet UILabel *itemDescription;
@property (strong, nonatomic) IBOutlet UILabel *locationName;
@property (strong, nonatomic) IBOutlet UILabel *personAssigned;
@property (strong, nonatomic) IBOutlet UILabel *familyAssigned;
@property (strong, nonatomic) IBOutlet UILabel *locLat;
@property (strong, nonatomic) IBOutlet UILabel *locLong;
@property (strong, nonatomic) IBOutlet MKMapView *toDoMapView;
@property (strong, nonatomic) IBOutlet UILabel *assignedPersonLabel;

@end

@implementation ToDoListDetailViewTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.toDoItemLocation = self.toDoItemDetail.itemLocation;
    self.toDoMapView.delegate = self;
    self.toDoUser = self.toDoItemDetail.userForItem;
    self.toDoFamily = self.toDoItemDetail.familyForItem;

    [self setPoints];
    
    [self setLabels];
    
}

-(void)setLabels{
    self.itemTitle.text = self.toDoItemDetail.itemTitle;
    self.itemDescription.text = self.toDoItemDetail.itemDescription;
    self.locLat.text = [NSString stringWithFormat:@"Lat: %@",self.toDoItemDetail.itemLocation.latitude];
    self.locLong.text = [NSString stringWithFormat:@"Long: %@",self.toDoItemDetail.itemLocation.longitude];
    self.locationName.text = self.toDoItemLocation.locationTitle;
    if (self.toDoUser) {
        self.personAssigned.text = self.toDoUser.userFirstName;
    }
    if (!self.toDoUser){
        self.assignedPersonLabel.text = @"";
        self.personAssigned.text = @"";
    }
    
    self.familyAssigned.text = self.toDoFamily.familysName;
}

-(void)setPoints {
    Location *location = self.toDoItemLocation;
    
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
    
    [self.toDoMapView setRegion:mapRegion animated:YES];
    [self.toDoMapView addAnnotation:myAnnotation];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 7) {
        self.toDoItemDetail.itemIsCompleted = YES;
        [[ToDoItemController sharedInstance]save];
    }
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
            self.toDoMapView.mapType = MKMapTypeStandard;
            break;
        case 1:
            self.toDoMapView.mapType = MKMapTypeSatellite;
            break;
        case 2:
            self.toDoMapView.mapType = MKMapTypeHybrid;
            break;
    };
}

@end
