//
//  MyStoriesTableViewCell.m
//  TravellersStory
//
//  Created by Stella on 2/3/16.
//  Copyright © 2016 Stella. All rights reserved.
//

#import "MyStoriesTableViewCell.h"
#import "ConnectionStatus.h"

@implementation MyStoriesTableViewCell

static ConnectionStatus *status;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)shareStory:(id)sender {
    
    NSString *connect = [status getConnectionStatus];
    
    if ([connect isEqualToString:@"Not connected"]) {
        
        UIAlertController * alert=   [UIAlertController
                                      alertControllerWithTitle:@"Not Connected"
                                      message:@"You are not connected to internet!"
                                      preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction
                             actionWithTitle:@"OK"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 [alert dismissViewControllerAnimated:YES completion:nil];
                                 
                             }];
        [alert addAction:ok];
        
        [self.delegate loadNewScreen: alert];
    }
}
@end
