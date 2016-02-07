//
//  LocationProvider.m
//  TravellersStory
//
//  Created by Stella on 2/7/16.
//  Copyright © 2016 Stella. All rights reserved.
//

#import "LocationProvider.h"
#import <CoreLocation/CoreLocation.h>

@implementation LocationProvider
    CLLocationManager *locationManager;
    CLGeocoder *geocoder;
    CLPlacemark *placemark;

    id _target;
    SEL _action;

-(instancetype)init{
    if(self = [super init]){
        locationManager = [[CLLocationManager alloc] init];
        geocoder = [[CLGeocoder alloc] init];
        placemark = [[CLPlacemark alloc]init];
        [self setupLocationManager];
    }
    return self;
}

-(void) setupLocationManager{
    locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters ;
    locationManager.delegate = self;
}

-(void)getLocationWithTarget:(id)target
                   andAction:(SEL)action{
    _target = target;
    _action = action;
    [locationManager requestAlwaysAuthorization];
    [locationManager startUpdatingLocation];
}

-(void)locationManager:(CLLocationManager *)manager
    didUpdateLocations:(NSArray *)locations {
    
    CLLocation* location = [locations lastObject];

    
    if(_target && _action && [_target respondsToSelector:_action]){
        [_target performSelector:_action withObject:location];
        _target = nil;
        _action = nil;
    }
    [locationManager stopUpdatingLocation];
}

@end
