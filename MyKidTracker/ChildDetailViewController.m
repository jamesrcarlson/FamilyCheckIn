//
//  ChildDetailViewController.m
//  KidTracker
//
//  Created by James Carlson on 8/18/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import "ChildDetailViewController.h"

@interface ChildDetailViewController ()

@end

@implementation ChildDetailViewController

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        self.childDetailDescriptionLabel.text = [self.detailItem description];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //    CLLocationManager *locationManager = [CLLocationManager new];
    //    locationManager.location;
    
    
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
