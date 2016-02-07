//
//  ImageFullScreenViewController.m
//  TravellersStory
//
//  Created by Stella on 2/7/16.
//  Copyright © 2016 Stella. All rights reserved.
//

#import "ImageFullScreenViewController.h"

@interface ImageFullScreenViewController ()

@end

@implementation ImageFullScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.fullScreenImageView.image = self.theImage;
    
    NSLog(@"loaded");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
