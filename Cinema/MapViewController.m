//
//  MapViewController.m
//  Cinema
//
//  Created by David Manuntag on 2015-02-05.
//  Copyright (c) 2015 David Manuntag. All rights reserved.
//

#import "MapViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface MapViewController ()<CLLocationManagerDelegate> {

    CLLocationManager * _locationManager;
}
@property (strong, nonatomic) Theatres * theatre;

@property (nonatomic, strong) NSMutableArray * theatresArray;
@property (nonatomic, strong) NSMutableArray * pinArray;

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    _locationManager = [[CLLocationManager alloc]init];
    _locationManager.delegate = self;

    [_locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    
    [_locationManager requestWhenInUseAuthorization];
    [_locationManager startUpdatingLocation];
    self.mapView.showsUserLocation = true;
    self.mapView.delegate = self;
    
    _pinArray = [NSMutableArray array];
    
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [self.movieTextField resignFirstResponder]; 
    
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    
    
    if (!self.initialLocation) {
        
        self.initialLocation = userLocation.location;
        
        MKCoordinateRegion region;
        region.center = mapView.userLocation.coordinate;
        region.span = MKCoordinateSpanMake(0.05, 0.05);
        
        region = [mapView regionThatFits:region];
        [mapView setRegion:region animated:YES];
        
    }
}



-(NSString*)movieSearchWithTitle:(NSString*)title {
    
    NSString * formattedTitle = [title  stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    
    NSString * apiURL = @"http://lighthouse-movie-showtimes.herokuapp.com/theatres.json?address=V6B1E6&movie=";
    
    NSString * completeURLAndTitle = [apiURL stringByAppendingString:formattedTitle];
    
    return completeURLAndTitle;
    
}


-(void)setUpAPI:(NSString*)comepleteSearchEntry {
    
    NSURL * movieTheatreUrl = [NSURL URLWithString:comepleteSearchEntry];
    
    NSData * jsonData = [NSData dataWithContentsOfURL:movieTheatreUrl];
    
    NSError * error = nil;
    
    NSDictionary * dataDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
    
    self.theatresArray = [NSMutableArray array];
    
    NSArray * dataDictionaryArray = [dataDictionary objectForKey:@"theatres"];
    
    for (NSDictionary * theatreDictionary in dataDictionaryArray) {
        
        Theatres * theatre = [[Theatres alloc]initWithTheatreTitle:[theatreDictionary objectForKey:@"name"] latitude:[theatreDictionary objectForKey:@"lat"] longitude:[theatreDictionary objectForKey:@"lng"]];
        
        [self.theatresArray addObject:theatre];
        
        
    }
    
}

- (IBAction)searchButton:(id)sender {
    
    
    [self.mapView removeAnnotations:self.pinArray];
    
    NSString * userSearchString = self.movieTextField.text;
    
    NSString * apiSearchString = [self movieSearchWithTitle:userSearchString];
    
    [self setUpAPI:apiSearchString];
    
    for (Theatres * theatreObj in self.theatresArray) {
       
        MKPointAnnotation * marker = [[MKPointAnnotation alloc]init];
        CLLocationCoordinate2D theatre;
        theatre.latitude =[theatreObj.latitude  doubleValue];
        theatre.longitude = [theatreObj.longitude doubleValue];
        marker.coordinate = theatre;
        marker.title = theatreObj.theatreName;
        
        [self.mapView addAnnotation:marker];
        
        [self.pinArray addObject:marker];
    }
   
    [self.movieTextField resignFirstResponder];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
