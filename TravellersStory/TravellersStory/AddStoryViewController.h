//
//  AddStoryViewController.h
//  TravellersStory
//
//  Created by Stella on 2/3/16.
//  Copyright © 2016 Stella. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddPhotoTableViewCell.h"

@interface AddStoryViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, changePictureProtocol>

@property (nonatomic) NSInteger numberOfRows;



@end
