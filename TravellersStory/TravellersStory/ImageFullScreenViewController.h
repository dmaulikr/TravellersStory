//
//  ImageFullScreenViewController.h
//  TravellersStory
//
//  Created by Stella on 2/7/16.
//  Copyright © 2016 Stella. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageFullScreenViewController : UIViewController <UIScrollViewDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *fullScreenImageView;

@property (strong, nonatomic) UIImage *theImage;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;


@end

