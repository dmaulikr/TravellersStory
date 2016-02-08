//
//  AddStoryViewController.h
//  TravellersStory
//
//  Created by Stella on 2/3/16.
//  Copyright © 2016 Stella. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddPhotoTableViewCell.h"

@interface AddStoryViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, changePictureProtocol,UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (nonatomic) NSInteger numberOfRows;

@property (weak, nonatomic) IBOutlet UIImageView *mainImageView;
@property (weak, nonatomic) IBOutlet UIButton *addMainImageButton;
- (IBAction)addMainImg:(id)sender;

@property (nonatomic) UIImagePickerController *imagePickerController;
@property (nonatomic) NSMutableArray *capturedImages;

- (IBAction)getLocation:(id)sender;

@end
