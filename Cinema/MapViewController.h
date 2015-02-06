//
//  MapViewController.h
//  Cinema
//
//  Created by David Manuntag on 2015-02-05.
//  Copyright (c) 2015 David Manuntag. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Theatres.h"

@interface MapViewController : UIViewController <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic, retain) CLLocation * initialLocation;
@property (strong, nonatomic) IBOutlet UITextField *movieTextField;

@end
