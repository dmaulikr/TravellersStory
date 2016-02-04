//
//  Photo.m
//  TravellersStory
//
//  Created by Stella on 2/4/16.
//  Copyright © 2016 Stella. All rights reserved.
//

#import "Photo.h"

@implementation Photo

-(instancetype) initWithNote:(NSString *)note andImage:(NSString *)image {
    if (self = [super init]) {
        self.note = note,
        self.image = image;
    }
    
    return self;
}

+(Photo*)photoWithNote:(NSString *)note andImage:(NSString *)image{
    return [[Photo alloc]initWithNote:note andImage:image];
}

@end
