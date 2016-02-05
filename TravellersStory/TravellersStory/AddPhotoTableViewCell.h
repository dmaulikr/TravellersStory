//
//  AddPhotoTableViewCell.h
//  TravellersStory
//
//  Created by Stella on 2/5/16.
//  Copyright © 2016 Stella. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddPhotoTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *addImageView;
@property (weak, nonatomic) IBOutlet UITextView *addNoteTextView;
- (IBAction)addPhoto:(id)sender;

@end
