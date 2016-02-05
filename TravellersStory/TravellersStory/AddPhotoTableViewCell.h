//
//  AddPhotoTableViewCell.h
//  TravellersStory
//
//  Created by Stella on 2/5/16.
//  Copyright © 2016 Stella. All rights reserved.
//


#import <UIKit/UIKit.h>

@protocol changePictureProtocol <NSObject>
-(void)loadNewScreen:(UIViewController *)controller;
@end

@interface AddPhotoTableViewCell : UITableViewCell <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *addImageView;
@property (weak, nonatomic) IBOutlet UITextView *addNoteTextView;
- (IBAction)addPhoto:(id)sender;

@property (nonatomic) UIImagePickerController *imagePickerController;
@property (nonatomic) NSMutableArray *capturedImages;

@property (nonatomic, retain) id<changePictureProtocol> delegate;

- (void)cell:(AddPhotoTableViewCell *)cell presentViewController:(UIViewController *)controller;
@end



