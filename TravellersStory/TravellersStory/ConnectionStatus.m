//
//  ConnectionStatus.m
//  TravellersStory
//
//  Created by Stella on 2/8/16.
//  Copyright © 2016 Stella. All rights reserved.
//

#import "ConnectionStatus.h"
#import "Reachability.h"
#import <SystemConfiguration/SystemConfiguration.h>


@implementation ConnectionStatus

-(NSString *)getConnectionStatus{
    
    Reachability *networkReachability = [Reachability reachabilityForInternetConnection];
    
    NetworkStatus networkStatus = [networkReachability currentReachabilityStatus];
    
    if (networkStatus == NotReachable) {
        return @"Not connected";
    } else {
        return @"Connected";
    }
}

@end
