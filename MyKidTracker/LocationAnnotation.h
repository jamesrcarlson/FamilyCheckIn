//
//  LocationAnnotation.h
//  MyKidTracker
//
//  Created by James Carlson on 8/20/15.
//  Copyright (c) 2015 JC2DEV, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
@import MapKit;
@import CoreLocation;

@interface LocationAnnotation : NSObject <MKAnnotation>

@property (nonatomic) CLLocationCoordinate2D coordinate;


// Title and subtitle for use by selection UI.
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;

// Called as a result of dragging an annotation view.
//- (void)setCoordinate:(CLLocationCoordinate2D)newCoordinate;

@end
