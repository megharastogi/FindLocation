//
//  LocationManager.h
//  FindLocation
//
//  Created by MEGHA GULATI on 9/23/13.
//  Copyright (c) 2013 MEGHA GULATI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface LocationManager : NSObject <CLLocationManagerDelegate>
{
    CLLocationManager * myLocationManager;
}

-(void)startLocationServices;

@end
