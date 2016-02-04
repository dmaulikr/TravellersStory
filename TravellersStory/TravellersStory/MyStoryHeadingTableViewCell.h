//
//  MyStoryHeadingTableViewCell.h
//  TravellersStory
//
//  Created by Stella on 2/4/16.
//  Copyright © 2016 Stella. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyStoryHeadingTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *destinationLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateFromLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateToLabel;

@end
