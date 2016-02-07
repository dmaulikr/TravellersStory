//
//  LocationProvider.h
//  TravellersStory
//
//  Created by Stella on 2/7/16.
//  Copyright © 2016 Stella. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface LocationProvider : NSObject <CLLocationManagerDelegate>

-(void) getLocationWithTarget:(id) target
                    andAction:(SEL) action;

@end
