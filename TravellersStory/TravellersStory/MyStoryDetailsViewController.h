//
//  MyStoryDetailsViewController.h
//  TravellersStory
//
//  Created by Stella on 2/3/16.
//  Copyright © 2016 Stella. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyStory.h"

@interface MyStoryDetailsViewController : UITableViewController

@property (strong, nonatomic) MyStory *myStory;
@property (strong, nonatomic) NSArray *photos;

@end
