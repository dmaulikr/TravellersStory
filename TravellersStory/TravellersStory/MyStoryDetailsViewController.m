//
//  MyStoryDetailsViewController.m
//  TravellersStory
//
//  Created by Stella on 2/3/16.
//  Copyright © 2016 Stella. All rights reserved.
//

#import "MyStoryDetailsViewController.h"
#import "Photo.h"
#import "MyStoryContentTableViewCell.h"
#import "MyStoryHeadingTableViewCell.h"
#import "CoreData/CoreData.h"
#import "ImageFullScreenViewController.h"

@interface MyStoryDetailsViewController ()

@end

@implementation MyStoryDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    /*self.photos = [NSArray arrayWithObjects:
                   [Photo photoWithNote:@"day one at the island..." andImage:@"http://www.odans-travel.com//img/PROGRAMI/BIG_ekskurzia_porto_kaciki_lefkada_1416910147550.jpg"],
                   [Photo photoWithNote:@"beach porto katsiki wow" andImage:@"http://guardianlv.com/wp-content/uploads/2014/06/portokatsiki.jpg"],
                   nil];*/
    NSSet *photosDB =[self.myStory valueForKey:@"photos"];
    self.photos = [NSArray arrayWithArray:photosDB.allObjects];
    
    UILongPressGestureRecognizer *lpgr = [[UILongPressGestureRecognizer alloc]initWithTarget:self action: @selector(onLongPress:)];
    
    lpgr.delegate = self;
    lpgr.delaysTouchesBegan = YES;
    [self.tableView addGestureRecognizer:lpgr];
    
    
}


-(void)onLongPress:(UILongPressGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer.state != UIGestureRecognizerStateEnded) {
        return;
    }
    CGPoint p = [gestureRecognizer locationInView:self.tableView];
    
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:p];
    if (indexPath == nil){
        NSLog(@"couldn't find index path");
    } else {
        
        MyStoryContentTableViewCell* cell =
        [self.tableView cellForRowAtIndexPath:indexPath];
        
        NSString *storyBoardId = @"imageFullScreen";
        
        ImageFullScreenViewController *imageFullScreenViewController = [self.storyboard instantiateViewControllerWithIdentifier:storyBoardId];
        
        imageFullScreenViewController.theImage = cell.photoImageView.image;
        
        [self.navigationController pushViewController:imageFullScreenViewController animated:YES];    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.photos.count+1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        static NSString *cellIdentifierHeading = @"myStoryHeadingCell";
        
        UITableViewCell *originalCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifierHeading];
        
        if(![originalCell isKindOfClass:[MyStoryHeadingTableViewCell class]] || originalCell == nil) {
            originalCell = [[[NSBundle mainBundle] loadNibNamed:@"MyStoryHeadingTableViewCell" owner:nil options:nil] objectAtIndex:0];
        }
        
        MyStoryHeadingTableViewCell *cell = (MyStoryHeadingTableViewCell*) originalCell;
        
        cell.titleLabel.text =  [self.myStory valueForKey:@"title"];
        
        NSDate *dateFrom = [self.myStory valueForKey:@"dateFrom"];
        NSDate *dateTo = [self.myStory valueForKey:@"dateTo"];
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy/MM/dd"];
        
        NSString *dateFromString = [dateFormatter stringFromDate:dateFrom];
        NSString *dateToString = [dateFormatter stringFromDate:dateTo];
        
        cell.dateFromLabel.text = dateFromString;
        cell.dateToLabel.text = dateToString;
        cell.destinationLabel.text = [self.myStory valueForKey:@"destination"];
        
        return  cell;
        
    } else {
        static NSString *cellIdentifierContent = @"myStoryContentCell";
        
        UITableViewCell *originalCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifierContent];
        
        if(![originalCell isKindOfClass:[MyStoryContentTableViewCell class]] || originalCell == nil) {
            originalCell = [[[NSBundle mainBundle] loadNibNamed:@"MyStoryContentTableViewCell" owner:nil options:nil] objectAtIndex:0];
        }
        
        MyStoryContentTableViewCell *cell = (MyStoryContentTableViewCell*) originalCell;
        
        NSInteger index = indexPath.row - 1;
        
        NSManagedObject *photo = [self.photos objectAtIndex:index];
        
        cell.noteTextView.text = [photo valueForKey:@"note"];
        
        UIImage *img = [UIImage imageWithData:[photo valueForKey:@"image"]];
     
        cell.photoImageView.image = img;
        
        return cell;
    }  
   
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 400;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}


#pragma mark - Navigation
/*
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
