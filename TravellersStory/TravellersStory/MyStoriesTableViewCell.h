//
//  MyStoriesTableViewCell.h
//  TravellersStory
//
//  Created by Stella on 2/3/16.
//  Copyright © 2016 Stella. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol changePictureProtocol <NSObject>
-(void)loadNewScreen:(UIViewController *)controller;
@end


@interface MyStoriesTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *cellImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *datesLabel;
- (IBAction)shareStory:(id)sender;

@property (nonatomic, retain) id<changePictureProtocol> delegate;
@end
