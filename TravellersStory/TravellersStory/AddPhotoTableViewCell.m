//
//  AddPhotoTableViewCell.m
//  TravellersStory
//
//  Created by Stella on 2/5/16.
//  Copyright © 2016 Stella. All rights reserved.
//

#import "AddPhotoTableViewCell.h"


@implementation AddPhotoTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
    self.capturedImages = [[NSMutableArray alloc] init];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (IBAction)addPhoto:(id)sender {
         [self showImagePickerForSourceType:UIImagePickerControllerSourceTypeCamera];
}

- (IBAction)openPhotoGallery:(id)sender {
    [self showImagePickerForSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
}

- (void)showImagePickerForSourceType:(UIImagePickerControllerSourceType)sourceType
{
    
    
    if (self.imageView.isAnimating)
    {
        [self.imageView stopAnimating];
    }
    
    if (self.capturedImages.count > 0)
    {
        [self.capturedImages removeAllObjects];
    }
    
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
     
    
    imagePickerController.modalPresentationStyle = UIModalPresentationCurrentContext;
    imagePickerController.sourceType = sourceType;
    imagePickerController.allowsEditing = YES;
    imagePickerController.delegate = self;
    
   
    
    
    if (sourceType == UIImagePickerControllerSourceTypeCamera)
    {
   
      /*   The user wants to use the camera interface. Set up our custom overlay view for the camera.*/
   
         imagePickerController.showsCameraControls = YES;
        
        /*
         Load the overlay view from the OverlayView nib file. Self is the File's Owner for the nib file, so the overlayView outlet is set to the main view in the nib. Pass that view to the image picker controller to use as its overlay view, and set self's reference to the view to nil.
        
        
        [[NSBundle mainBundle] loadNibNamed:@"OverlayView" owner:self.delegate options:nil];
        self.overlayView.frame = imagePickerController.cameraOverlayView.frame;
       imagePickerController.cameraOverlayView = self.overlayView;
        self.overlayView = nil;
          */     }

    
    self.imagePickerController = imagePickerController;
    
    
    
    [self.delegate loadNewScreen:imagePickerController];
    
}

- (IBAction)takePhoto:(id)sender
{
    [self.imagePickerController takePicture];
}

// This method is called when an image has been chosen from the library or taken from the camera.
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [info valueForKey:UIImagePickerControllerOriginalImage];
    
    [self.capturedImages addObject:image];
   /*
    if ([self.cameraTimer isValid])
    {
        return;
    }*/
    
    [self finishAndUpdate];
    
   
}


- (void)finishAndUpdate
{
    [self.delegate dismissImagePicker];
    
    if ([self.capturedImages count] > 0)
    {
        if ([self.capturedImages count] == 1)
        {
            // Camera took a single picture.
            [self.addImageView setImage:[self.capturedImages objectAtIndex:0]];
        }
        else
        {
            // Camera took multiple pictures; use the list of images for animation.
            self.imageView.animationImages = self.capturedImages;
            self.imageView.animationDuration = 5.0;    // Show each captured photo for 5 seconds.
            self.imageView.animationRepeatCount = 0;   // Animate forever (show all photos).
            [self.imageView startAnimating];
        }
        
        // To be ready to start again, clear the captured images array.
        [self.capturedImages removeAllObjects];
    }
    
    self.imagePickerController = nil;
}



- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self.delegate dismissImagePicker];
    
}

@end
