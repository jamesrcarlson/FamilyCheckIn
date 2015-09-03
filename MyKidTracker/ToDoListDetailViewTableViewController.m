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

@end

@implementation ToDoListDetailViewTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.toDoMapView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
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
