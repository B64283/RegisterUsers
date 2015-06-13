//
//  AddInfoViewController.m
//  RegisterUsers
//
//  Created by Matthew Darke on 6/11/15.
//  Copyright (c) 2015 Matthew Darke. All rights reserved.
//

#import "AddInfoViewController.h"
#import <Parse/Parse.h>
@interface AddInfoViewController ()

@end

@implementation AddInfoViewController

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
    barButton.title = @"Back";
    self.navigationController.navigationBar.topItem.backBarButtonItem = barButton;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





- (IBAction)saveButn:(id)sender {
    
    
    
    PFObject *gameScore = [PFObject objectWithClassName:@"savedItems"];
    gameScore[@"itemName"] = _itemName.text;
    gameScore[@"itemNumber"] = _itemNumber.text;
    
    [gameScore saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            // The object has been saved.
            UIAlertView *eventAlertView = [[UIAlertView alloc]initWithTitle:@"Saved!" message:@"  item successfully saved" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            if(eventAlertView != nil)
                
            {
                [eventAlertView show];
                
            }
 
            
        } else {
            // There was a problem, check error.description
            
            UIAlertView *eventAlertView = [[UIAlertView alloc]initWithTitle:@"Oops!" message:@" There was an error" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            if(eventAlertView != nil)
                
            {
                [eventAlertView show];
                
            }

        }
    }];
    
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

@end
