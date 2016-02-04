//
//  MyStoriesTableViewCell.h
//  TravellersStory
//
//  Created by Stella on 2/3/16.
//  Copyright © 2016 Stella. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyStoriesTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *cellImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *datesLabel;

@end
