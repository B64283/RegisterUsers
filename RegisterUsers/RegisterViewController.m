//
//  RegisterViewController.m
//  RegisterUsers
//
//  Created by Matthew Darke on 6/8/15.
//  Copyright (c) 2015 Matthew Darke. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController



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

- (void)viewDidAppear:(BOOL)animated {
    
   // PFUser *user = [PFUser currentUser];
    
    //if (user.username != nil) {
        
       // [self performSegueWithIdentifier:@"login" sender:self];
   // }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)registerNewUser {
    
    PFUser *newUser = [PFUser user];
    newUser.username = _userName.text;
    newUser.email = _eMail.text;
    newUser.password = _passWord.text;
    
    [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            
            // Hooray! Let them use the app now.
            UIAlertView *eventAlertView = [[UIAlertView alloc]initWithTitle:@" Registration successful!" message:@"Press back to sign in" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            if(eventAlertView != nil)
                
            {
                [eventAlertView show];
                
            }

        
        } else {
            
            NSString *errorString = [error userInfo][@"error"];   // Show the errorString somewhere and let the user try again.
        }
    }];
    
    
}












- (IBAction)registerButn:(id)sender{
    
    [self registerNewUser];
    
    
    
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
