//
//  MytStoriesViewController.m
//  TravellersStory
//
//  Created by Stella on 2/3/16.
//  Copyright © 2016 Stella. All rights reserved.
//

#import "MyStoriesViewController.h"
#import "MyStoriesTableViewCell.h"
#import "MyStory.h"
#import "MyStoryDetailsViewController.h"
#import "AddStoryViewController.h"
#import "CoreData/CoreData.h"
#import "AppDelegate.h"
#import "DataSQLite.h"


@interface MyStoriesViewController ()

@end

@implementation MyStoriesViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIBarButtonItem *addBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(showAdd)];
    
    self.navigationItem.rightBarButtonItem = addBarButton;
    
    /*
    NSDateComponents *dateComponentsFrom = [[NSDateComponents alloc] init];
    dateComponentsFrom.year   = 2012;
    dateComponentsFrom.month  = 8;
    dateComponentsFrom.day    = 12;
    NSDate *dateFrom = [[NSCalendar currentCalendar] dateFromComponents:dateComponentsFrom];
    
    NSDateComponents *dateComponentsTo = [[NSDateComponents alloc] init];
    dateComponentsTo.year   = 2012;
    dateComponentsTo.month  = 8;
    dateComponentsTo.day    = 12;
    NSDate *dateTo = [[NSCalendar currentCalendar] dateFromComponents:dateComponentsTo];
    
    self.myStories = [NSArray arrayWithObjects:
                        
                        [MyStory myStoryWithTitle:@"Vacation in Lefkada"
                                         dateFrom:dateFrom
                                           dateTo:dateTo
                                      andImageUrl:@"http://www.odans-travel.com//img/PROGRAMI/BIG_ekskurzia_porto_kaciki_lefkada_1416910147550.jpg"],
                        
                        [MyStory myStoryWithTitle:@"3 Days in Rome"
                                         dateFrom:dateFrom
                                           dateTo:dateTo
                                      andImageUrl:@"http://static1.squarespace.com/static/533a4baae4b01b10be99195f/t/540f31c8e4b0b6aef5c7a1e0/1410281928794/Rome-Italy_2501454b.jpg?format=1500w"],
                        
                        [MyStory myStoryWithTitle:@"Paris the city of love"
                                         dateFrom:dateFrom
                                           dateTo:dateTo
                                      andImageUrl:@"http://www.meininger-hotels.com/typo3temp/pics/5576e705b9.jpg"],
                      
                        [MyStory myStoryWithTitle:@"3 Days in Rome"
                                         dateFrom:dateFrom
                                           dateTo:dateTo
                                      andImageUrl:@"http://static1.squarespace.com/static/533a4baae4b01b10be99195f/t/540f31c8e4b0b6aef5c7a1e0/1410281928794/Rome-Italy_2501454b.jpg?format=1500w"],
                      
                        [MyStory myStoryWithTitle:@"Vacation in Lefkada"
                                         dateFrom:dateFrom
                                           dateTo:dateTo
                                      andImageUrl:@"http://www.odans-travel.com//img/PROGRAMI/BIG_ekskurzia_porto_kaciki_lefkada_1416910147550.jpg"],
                      
                        [MyStory myStoryWithTitle:@"Paris the city of love"
                                         dateFrom:dateFrom
                                           dateTo:dateTo
                                      andImageUrl:@"http://www.meininger-hotels.com/typo3temp/pics/5576e705b9.jpg"],
                        nil];
     
     */
    
    
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    
    DataSQLite *data = [[DataSQLite alloc] init];
    self.myStories = [data fetchMyStories:(NSString*)@"Story" andSorter:(NSString*)@"dataFrom"];
    
    [self.tableView reloadData];
}

-(void) showAdd {
    NSString *storyBoardId = @"addStoryScene";
    
    AddStoryViewController *addPhoneVC =
    [self.storyboard instantiateViewControllerWithIdentifier:storyBoardId];
    [self.navigationController pushViewController:addPhoneVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.myStories.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"myStoriesCell";
    
    UITableViewCell *originalCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(![originalCell isKindOfClass:[MyStoriesTableViewCell class]] || originalCell == nil) {
        originalCell = [[[NSBundle mainBundle] loadNibNamed:@"MyStoriesTableViewCell" owner:nil options:nil] objectAtIndex:0];
    }
    
    MyStoriesTableViewCell *cell = (MyStoriesTableViewCell*) originalCell;
    
    NSManagedObject *story = (NSManagedObject *)[self.myStories objectAtIndex:indexPath.row];
    
    cell.titleLabel.text = [story valueForKey:@"title"];
    
    NSDate *dateFrom = [story valueForKey:@"dateFrom"];
    NSDate *dateTo = [story valueForKey:@"dateTo"];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy/MM/dd"];
    
    NSString *dateFromString = [dateFormatter stringFromDate:dateFrom];
    NSString *dateToString = [dateFormatter stringFromDate:dateTo];
    
    NSMutableString *dateFromTo = [[NSMutableString alloc]init];
    [dateFromTo appendString:dateFromString];
    [dateFromTo appendString:@" - "];
    [dateFromTo appendString:dateToString];
    
    cell.datesLabel.text = dateFromTo;
    
    UIImage *img = [UIImage imageWithData:[story valueForKey:@"mainImg"]];
    
    cell.cellImageView.frame = CGRectMake(0,0, 100, 100);
   
    cell.cellImageView.image = img;
    
    [cell setBackgroundColor:[UIColor colorWithRed:0.98 green:0.95 blue:0.93 alpha:1.0]];
    
    [cell.contentView.layer setBorderColor:[UIColor whiteColor].CGColor];
    
    [cell.contentView.layer setBorderWidth:3.0f];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}


 - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
     NSManagedObject *story = (NSManagedObject*)[self.myStories objectAtIndex:indexPath.row];
     NSString *storyBoardId = @"myStoryDetailsScene";
     
     MyStoryDetailsViewController *detailViewController = [self.storyboard instantiateViewControllerWithIdentifier:storyBoardId];
     detailViewController.myStory = story;
 
 [self.navigationController pushViewController:detailViewController animated:YES];
     
 }

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *managedObjectContext = [appDelegate managedObjectContext];
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [managedObjectContext deleteObject:[self.myStories objectAtIndex:indexPath.row]];
        
        NSError *error = nil;
        if (![managedObjectContext save:&error]) {
            NSLog(@"Can't Delete! %@ %@", error, [error localizedDescription]);
            return;
        }
        
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        UIAlertController * alert=   [UIAlertController
                                      alertControllerWithTitle:@"Deleted"
                                      message:@"You have deleted your story!"
                                      preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction
                             actionWithTitle:@"OK"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 [alert dismissViewControllerAnimated:YES completion:nil];
                                 [self.navigationController popViewControllerAnimated:YES];
                             }];
        [alert addAction:ok];
        [self presentViewController:alert animated:YES completion:nil];
        
        //[tableView numberOfRowsInSection:self.myStories.count - 1];
        //[tableView reloadData];
    }
}

-(void)loadNewScreen:(UIViewController *)controller;
{
    [self presentViewController:controller animated:YES completion:nil];
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
