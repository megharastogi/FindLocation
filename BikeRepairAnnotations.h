//
//  BikeRepairAnnotations.h
//  FindLocation
//
//  Created by Brad on 9/23/13.
//  Copyright (c) 2013 MEGHA GULATI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface BikeRepairAnnotations : NSObject <MKAnnotation>

@property (nonatomic,readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic) CLLocationCoordinate2D bikeCoordinate;
@property (nonatomic, strong) NSDictionary *bikeDict;



//@property (nonatomic,readonly,copy) NSString *title;
//@property (nonatomic,readonly,copy) NSString *subtitle;

-(id)initWithLocation:(CLLocation *)location;

-(id)initWithDict:(NSDictionary*)dict;


@end
