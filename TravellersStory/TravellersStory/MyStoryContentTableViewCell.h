//
//  MyStoryContentTableViewCell.h
//  TravellersStory
//
//  Created by Stella on 2/4/16.
//  Copyright © 2016 Stella. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyStoryContentTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@property (weak, nonatomic) IBOutlet UITextView *noteTextView;
@property (weak, nonatomic) IBOutlet UIView *containerView;

@end
