//
//  LocationManager.m
//  FindLocation
//
//  Created by MEGHA GULATI on 9/23/13.
//  Copyright (c) 2013 MEGHA GULATI. All rights reserved.
//

#import "LocationManager.h"

@implementation LocationManager

-(id)init
{
    self = [super init];
    if(self)
    {
        myLocationManager = [CLLocationManager new];
        myLocationManager.delegate = self;
        
        [myLocationManager startUpdatingLocation];

    }
    
    return self;
}

-(void)startLocationServices
{
    
    [myLocationManager startUpdatingLocation];
    
}


@end
