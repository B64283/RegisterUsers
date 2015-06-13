//
//  ListViewController.m
//  RegisterUsers
//
//  Created by Matthew Darke on 6/8/15.
//  Copyright (c) 2015 Matthew Darke. All rights reserved.
//

#import "ListViewController.h"
#import "CustomCell.h"
@interface ListViewController ()

@end

@implementation ListViewController

@synthesize myTableView;

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
    // Do any additional setup after loading the view.
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] init];
    barButton.title = @"Log Out";
    self.navigationController.navigationBar.topItem.backBarButtonItem = barButton;
    
    
    [self performSelector:@selector(retrieveFromParse)];
}

- (void)retrieveFromParse
{
    PFQuery *query = [PFQuery queryWithClassName:@"savedItems"];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
           
            userStrArray = [[NSMutableArray alloc]initWithArray:objects];
            
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    
        [myTableView reloadData];
    
    }];
   
    
}

- (void)viewWillAppear:(BOOL)animated {
   
    [super viewWillAppear:animated];
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] init];
    barButton.title = @"Log Out";
    self.navigationController.navigationBar.topItem.backBarButtonItem = barButton;
 
    
    [self performSelector:@selector(retrieveFromParse)];
    [self.myTableView reloadData];
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [userStrArray count];
    
}





- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCustomCell"];
    if (cell != nil)
    {
        PFObject *tempObject = [userStrArray objectAtIndex:indexPath.row];
       
        cell.itemNameText = [tempObject objectForKey:@"itemName"];
        cell.itemNumberText = [tempObject objectForKey:@"itemNumber"];
    
  
    
    }
     [cell refreshCell];
    return cell;
    
    
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{    //are we in delete mode
    
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        PFObject *object = [self.userStrArray objectAtIndex:indexPath.row];
        // removes data from data array
        [userStrArray removeObjectAtIndex:indexPath.row];
        
                [myTableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    
        [object deleteInBackground];
        
        
        // Saves the field deletion to the Parse Cloud
        //[object saveInBackground];
        // If the backend reports an error, you'd need to readd the cell or
        // display an error message to the user
        
        
        // Remove the row from data model
        
        
        //remove the line item
    
        
    }
}


   /*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


-(void) viewWillDisappear:(BOOL)animated {
    if ([self.navigationController.viewControllers indexOfObject:self]==NSNotFound) {
        // back button was pressed.
        //We know this is true because self is no longer
        // in the navigation stack.
        
        [PFUser logOut];
    }
    [super viewWillDisappear:animated];
}













@end
