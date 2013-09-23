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

@interface ViewController ()

    @property (strong,nonatomic) LocationManager * myLocation;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.myLocation = [[LocationManager alloc] init];
    
    _mapView.showsUserLocation = TRUE;
    _mapView.userTrackingMode = MKUserTrackingModeFollow;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
