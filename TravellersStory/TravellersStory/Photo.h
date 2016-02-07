//
//  Photo.h
//  TravellersStory
//
//  Created by Stella on 2/4/16.
//  Copyright © 2016 Stella. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Photo : NSObject

@property (strong, nonatomic) NSString *note;
@property (strong, nonatomic) NSData *image;


-(instancetype)initWithNote: (NSString*) note
                   andImage: (NSData*) image;

+(Photo*) photoWithNote: (NSString*) note
                 andImage: (NSData*) image;
@end
