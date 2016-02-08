//
//  DataSQLite.h
//  TravellersStory
//
//  Created by Stella on 2/7/16.
//  Copyright © 2016 Stella. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataSQLite : NSObject

-(NSArray*)fetchMyStories:(NSString*)entityName andSorter:(NSString*)sortExpr;

@end
