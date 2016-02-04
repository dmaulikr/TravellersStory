//
//  MyStory.m
//  TravellersStory
//
//  Created by Stella on 2/4/16.
//  Copyright © 2016 Stella. All rights reserved.
//

#import "MyStory.h"

@implementation MyStory



-(instancetype)initWithTitle:(NSString *)title
                    dateFrom:(NSDate *)dateFrom
                      dateTo:(NSDate *)dateTo
                 andImageUrl:(NSString *)imageUrl {
    if(self = [super init]) {
        self.title = title;
        self.dateFrom = dateFrom;
        self.dateTo = dateTo;
        self.imageUrl = imageUrl;
    }
    return self;
}

+(MyStory*)myStoryWithTitle:(NSString *)title
                   dateFrom:(NSDate *)dateFrom
                     dateTo:(NSDate *)dateTo
                andImageUrl:(NSString *)imageUrl {
    return [[MyStory alloc] initWithTitle:title dateFrom:dateFrom dateTo:dateTo andImageUrl:imageUrl];
}

@end
