//
//  MyStoryDetailsViewController.h
//  TravellersStory
//
//  Created by Stella on 2/3/16.
//  Copyright © 2016 Stella. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyStory.h"
#import "CoreData/CoreData.h"
@interface MyStoryDetailsViewController : UITableViewController <UIGestureRecognizerDelegate>

@property (strong, nonatomic) NSManagedObject *myStory;
@property (strong, nonatomic) NSArray *photos;

@end
