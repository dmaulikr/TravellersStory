//
//  AddStoryViewController.m
//  TravellersStory
//
//  Created by Stella on 2/3/16.
//  Copyright © 2016 Stella. All rights reserved.
//

#import "AddStoryViewController.h"
#import "AddPhotoTableViewCell.h"

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
    
}


-(void) saveStory{

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"addPhotoCell";
    
    UITableViewCell *originalCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(![originalCell isKindOfClass:[AddPhotoTableViewCell class]] || originalCell == nil) {
        originalCell = [[[NSBundle mainBundle] loadNibNamed:@"AddPhotoTableViewCell" owner:nil options:nil] objectAtIndex:0];
    }
    
    AddPhotoTableViewCell *cell = (AddPhotoTableViewCell*) originalCell;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 375;
}

- (IBAction)addPhoto:(id)sender {
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
