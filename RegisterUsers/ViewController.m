//
//  ViewController.m
//  RegisterUsers
//
//  Created by Matthew Darke on 6/6/15.
//  Copyright (c) 2015 Matthew Darke. All rights reserved.
//

#import "ViewController.h"
#import "RegisterViewController.h"


@interface ViewController ()

@end

@implementation ViewController




- (void)viewDidLoad
{
    [super viewDidLoad];
    PFUser *currentUser = [PFUser currentUser];
    if (currentUser) {
        // do stuff with the user
    [self performSegueWithIdentifier:@"Signin" sender:self];    
    } else {
        // show the signup or login screen
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)signInAction:(id)sender{
    
    
    
    [PFUser logInWithUsernameInBackground:_userNameSin.text password:_userPassword.text
            block:^(PFUser *userS, NSError *error) {
        
                if (userS) {
        
                    // Do stuff after successful login.
    UIAlertView *eventAlertView = [[UIAlertView alloc]initWithTitle:@"Sign in successful!" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                                            
            if(eventAlertView != nil)
                
            {
                [eventAlertView show];
                
            }
   [self performSegueWithIdentifier:@"Signin" sender:self];
        } else {
    // The login failed. Check error to see why.
    UIAlertView *eventAlertView = [[UIAlertView alloc]initWithTitle:@"  Sign in unsuccessful. Please enter correct name and password" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            if(eventAlertView != nil)
                
            {
                [eventAlertView show];
            }

                                        
                                        }
                                    }];
   
    
    

}





@end
