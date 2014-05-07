//
//  CFViewController.m
//  CoreDataMusic
//
//  Created by Brad on 5/5/14.
//  Copyright (c) 2014 Brad. All rights reserved.
//

#import "CFViewController.h"
#import "CFAppDelegate.h"
#import "CFAppDelegate+CreateManagedObjectContext.h"
#import "Label.h"
#import "CFArtistViewController.h"

@interface CFViewController () <UITableViewDataSource,UITableViewDelegate>

@property (weak,nonatomic) NSManagedObjectContext *managedObjectContext;
@property (weak,nonatomic) UIManagedDocument *managedDocument;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic) NSArray *labels;


@end

@implementation CFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    CFAppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
   [appDelegate createManagedObjectContextWithCompletion:^(NSManagedObjectContext *context,UIManagedDocument *document) {
       
       self.managedObjectContext = context;
       self.managedDocument = document;
   }];
    
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)createPressed:(id)sender {
    
    Label *musicLabel = [NSEntityDescription insertNewObjectForEntityForName:@"Label" inManagedObjectContext:self.managedObjectContext];
    musicLabel.name = @"Rap Music";
    musicLabel.est = @"1998";
    Label *musicLabel2 = [NSEntityDescription insertNewObjectForEntityForName:@"Label" inManagedObjectContext:self.managedObjectContext];
    musicLabel2.name = @"West Side Stuff";
    musicLabel2.est = @"2001";
    Label *musicLabel3 = [NSEntityDescription insertNewObjectForEntityForName:@"Label" inManagedObjectContext:self.managedObjectContext];
    musicLabel3.name = @"Hip Hop etc";
    musicLabel3.est = @"1999";
    Label *musicLabel4 = [NSEntityDescription insertNewObjectForEntityForName:@"Label" inManagedObjectContext:self.managedObjectContext];
    musicLabel4.name = @"auto tune champs";
    musicLabel4.est = @"2003";
    
    [self.managedObjectContext save:nil];
    //[self.managedDocument updateChangeCount:UIDocumentChangeDone];

}
- (IBAction)fetchPressed:(id)sender {
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Label"];
    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"any artists.age = 21"];
    
    NSError *error;
    self.labels = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    [self.tableView reloadData];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.labels.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"labelCell" forIndexPath:indexPath];
    Label *label = self.labels[indexPath.row];
    cell.textLabel.text = label.name;
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"toArtists"])
    {
        CFArtistViewController *destinationVC = segue.destinationViewController;
        //destinationVC.objectContext = self.managedObjectContext;
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        destinationVC.selectedLabel = self.labels[indexPath.row];
    }
}

@end
