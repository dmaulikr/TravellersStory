//
//  AddStoryViewController.m
//  TravellersStory
//
//  Created by Stella on 2/3/16.
//  Copyright © 2016 Stella. All rights reserved.
//

#import "AddStoryViewController.h"
#import "AddPhotoTableViewCell.h"
#import "MyStory.h"
#import "Photo.h"

@interface AddStoryViewController ()
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;

@property (weak, nonatomic) IBOutlet UITextField *destinationTextField;
@property (weak, nonatomic) IBOutlet UIDatePicker *dateFromDatePicker;
@property (weak, nonatomic) IBOutlet UIDatePicker *dateToDatePicker;
@property (weak, nonatomic) IBOutlet UITableView *photosTableView;
- (IBAction)addPhoto:(id)sender;

@end

@implementation AddStoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.photosTableView.dataSource = self;
    self.photosTableView.delegate = self;
    
    UIBarButtonItem *doneBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(saveStory)];
    self.navigationItem.rightBarButtonItem = doneBarButton;
    
    self.numberOfRows = 2;
}


-(void) saveStory {
    
    MyStory *newStory = [MyStory myStoryWithTitle:self.titleTextField.text
                                         dateFrom:self.dateFromDatePicker.date
                                           dateTo:self.dateToDatePicker.date
                                      andImageUrl:@""];
    
    NSMutableArray *photosForStory = [[NSMutableArray alloc]init];
    
    NSInteger numberOfPhotos = [self.photosTableView numberOfRowsInSection:0];
    
    for (int row = 0; row < numberOfPhotos; row++) {
        NSIndexPath* cellPath = [NSIndexPath indexPathForRow:row inSection:0];
        AddPhotoTableViewCell *cell = [self.photosTableView cellForRowAtIndexPath:cellPath];
        
        Photo *newPhoto = [Photo photoWithNote:cell.addNoteTextView.text
                                      andImage: @"hah"];
        [photosForStory addObject:newPhoto];
    }
}
                         
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.numberOfRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"addPhotoCell";
    
    UITableViewCell *originalCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(![originalCell isKindOfClass:[AddPhotoTableViewCell class]] || originalCell == nil) {
        originalCell = [[[NSBundle mainBundle] loadNibNamed:@"AddPhotoTableViewCell" owner:nil options:nil] objectAtIndex:0];
    }
    
    AddPhotoTableViewCell *cell = (AddPhotoTableViewCell*) originalCell;
    
    cell.delegate = self;
    
    return cell;
}

-(void)loadNewScreen:(UIViewController *)controller;
{
    [self presentViewController:controller animated:YES completion:nil];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 375;
}

- (IBAction)addPhoto:(id)sender {
    self.numberOfRows++;    
    NSArray *paths = [self.photosTableView indexPathsForVisibleRows];
    
    [self.photosTableView beginUpdates];
    [self.photosTableView insertRowsAtIndexPaths:(NSArray *) paths withRowAnimation:UITableViewRowAnimationMiddle];
    [self.photosTableView endUpdates];
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
