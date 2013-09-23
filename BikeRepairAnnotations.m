//
//  BikeRepairAnnotations.m
//  FindLocation
//
//  Created by Brad on 9/23/13.
//  Copyright (c) 2013 MEGHA GULATI. All rights reserved.
//

#import "BikeRepairAnnotations.h"

@implementation BikeRepairAnnotations

-(CLLocationCoordinate2D)coordinate
{
    return ((CLLocation*)[self.bikeDict objectForKey:@"coordinate"]).coordinate;
    
    
}

-(NSString*)title
{
    return [self.bikeDict objectForKey:@"title"];
}

-(NSString*)subtitle
{
    return @"a place";
}




-(id)initWithLocation:(CLLocation *)location
{
    self = [super init];
    if (self) {
        self.bikeCoordinate = location.coordinate; }
    
    return self;
    
}
-(id)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        self.bikeDict = [[NSDictionary alloc] initWithDictionary:dict];}
    return self;
    
}



@end
