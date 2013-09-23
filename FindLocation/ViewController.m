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
    NSString *thePath = [[NSBundle mainBundle] pathForResource:@"RW3" ofType:@"jpg"];
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
