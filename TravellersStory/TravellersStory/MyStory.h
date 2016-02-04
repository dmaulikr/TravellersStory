//
//  MyStory.h
//  TravellersStory
//
//  Created by Stella on 2/4/16.
//  Copyright © 2016 Stella. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyStory : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSDate *dateFrom;
@property (strong, nonatomic) NSDate *dateTo;
@property (strong, nonatomic) NSString *imageUrl;

-(instancetype)initWithTitle: (NSString*) title
                    dateFrom: (NSDate*) dateFrom
                      dateTo: (NSDate*) dateTo
                 andImageUrl: (NSString*) imageUrl;

+(MyStory*) myStoryWithTitle: (NSString*) title
                    dateFrom: (NSDate*) dateFrom
                      dateTo: (NSDate*) dateTo
                 andImageUrl: (NSString*) imageUrl;
@end
