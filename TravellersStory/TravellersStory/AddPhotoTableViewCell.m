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

/*- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}*/


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
        imagePickerController.showsCameraControls = YES;
    }
    
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
        
        // To be ready to start again, clear the captured images array.
        [self.capturedImages removeAllObjects];
    }
    
    self.imagePickerController = nil;
    
    self.addImg.hidden = YES;
    self.openImgGallery.hidden = YES;
}



- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self.delegate dismissImagePicker];
    
}

@end
