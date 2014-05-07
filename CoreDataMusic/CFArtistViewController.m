//
//  CFArtistViewController.m
//  CoreDataMusic
//
//  Created by Brad on 5/6/14.
//  Copyright (c) 2014 Brad. All rights reserved.
//

#import "CFArtistViewController.h"

@interface CFArtistViewController () <UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *firstNameField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameField;
@property (weak, nonatomic) IBOutlet UITextField *age;
@property (weak, nonatomic) IBOutlet UITextField *genre;

@property (strong,nonatomic) NSArray *artists;


@end

@implementation CFArtistViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.objectContext = self.selectedLabel.managedObjectContext;
    
    self.firstNameField.delegate = self;
    self.lastNameField.delegate = self;
    self.age.delegate = self;
    self.genre.delegate =  self;
    self.artists = [self.selectedLabel.artists allObjects];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.tableView reloadData];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)addArtist:(id)sender {
    
    Artist *newArtist = [NSEntityDescription insertNewObjectForEntityForName:@"Artist" inManagedObjectContext:self.objectContext];
    newArtist.firstName = self.firstNameField.text;
    newArtist.lastName = self.lastNameField.text;
    newArtist.age = self.age.text;
    newArtist.genre = self.genre.text;
    newArtist.label = self.selectedLabel;
    [self.objectContext save:nil];
    
    self.artists = [self.selectedLabel.artists allObjects];
    
    [self.tableView reloadData];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.artists.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"artistCell" forIndexPath:indexPath];
    Artist *artist = self.artists[indexPath.row];
    cell.textLabel.text = artist.firstName;
    //cell.textLabel.text = artist.objectID.description;
    NSLog(@" %@",artist.objectID.description);
    return cell;
}


@end
