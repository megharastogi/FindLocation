//
//  ViewController.m
//  FindLocation
//
//  Created by MEGHA GULATI on 9/23/13.
//  Copyright (c) 2013 MEGHA GULATI. All rights reserved.
//

#import "ViewController.h"
#import "LocationManager.h"
#import <CoreLocation/CoreLocation.h>
#import "BikeRepairAnnotations.h"
#import "CustomAnnotationView.h"
#import <MapKit/MapKit.h>

@interface ViewController ()

    @property (strong,nonatomic) LocationManager * myLocation;
    @property (strong,nonatomic) NSDictionary * bikeList;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    MKUserTrackingBarButtonItem *buttonItem = [[MKUserTrackingBarButtonItem alloc] initWithMapView:_mapView];
    self.navigationItem.rightBarButtonItem = buttonItem;
    
    
    NSDictionary *jimmy = @{@"title": @"Jimmy Johns", @"coordinate": [[CLLocation alloc] initWithLatitude:47.62122 longitude:-122.33]};
      NSDictionary *mcdonalds = @{@"title": @"McDonalds", @"coordinate": [[CLLocation alloc] initWithLatitude:47.621662 longitude:-122.32]};
    NSDictionary *daniels = @{@"title": @"Daniels Broiler", @"coordinate": [[CLLocation alloc] initWithLatitude:47.61 longitude:-122.33]};
      NSDictionary *codeFellows = @{@"title": @"Code Fellows", @"coordinate": [[CLLocation alloc] initWithLatitude:47.61 longitude:-122.34]};
    NSArray *array = @[jimmy,mcdonalds,daniels,codeFellows];
    
    
    
    self.myLocation = [[LocationManager alloc] init];
    
    _mapView.showsUserLocation = TRUE;
    _mapView.userTrackingMode = MKUserTrackingModeFollow;
    
    _mapView.delegate = self;
    
    for (NSDictionary *dict in array)
    {
    BikeRepairAnnotations *annotation = [[BikeRepairAnnotations alloc] initWithDict:dict];
    [_mapView addAnnotation:annotation];
    }
    
    
    UILongPressGestureRecognizer *lgpr = [[UILongPressGestureRecognizer alloc] initWithTarget:self action: @selector(createNewPin:)];
    lgpr.minimumPressDuration = 1.0;
    [_mapView addGestureRecognizer:lgpr];
}

- (void)createNewPin:(UIGestureRecognizer *)gesture
{

    if(gesture.state != UIGestureRecognizerStateEnded){
    
        return;
    }
    
    CGPoint touchPoint = [gesture locationInView:_mapView];
    CLLocationCoordinate2D newPinCoordinate = [_mapView convertPoint:touchPoint toCoordinateFromView:_mapView];
    CLLocation * location = [[CLLocation alloc] initWithLatitude:newPinCoordinate.latitude longitude:newPinCoordinate.longitude];
    NSDictionary *newLocation = @{@"title": @"New Place", @"coordinate": location};

    
    BikeRepairAnnotations *newPin = [[BikeRepairAnnotations alloc] initWithDict:newLocation];
    
    [_mapView addAnnotation:newPin];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    
    NSString *identifier = @"test";
    
    MKAnnotationView *ourView = [_mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    
    if (ourView)
    {
        ourView.annotation = annotation;
    }
    else {
        ourView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        
    }
    
    //set our image
    NSString *thePath = [[NSBundle mainBundle] pathForResource:@"pin" ofType:@"png"];
    UIImage *russellWilson = [[UIImage alloc] initWithContentsOfFile:thePath];
    ourView.image = russellWilson;
    
    ourView.canShowCallout = YES;
    
    
    
    return ourView;
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
