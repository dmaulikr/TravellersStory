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


@interface MyStoriesViewController ()

@end

@implementation MyStoriesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
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
    
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *managedObjectContext = [appDelegate managedObjectContext];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Story" inManagedObjectContext:managedObjectContext];
    [fetchRequest setEntity:entity];
    
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"dateFrom" ascending:NO];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObject: sort]];
    
    
    NSError *error;
    self.myStories = [managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
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

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}

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
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } 
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
