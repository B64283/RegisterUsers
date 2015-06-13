//
//  RegisterViewController.h
//  RegisterUsers
//
//  Created by Matthew Darke on 6/8/15.
//  Copyright (c) 2015 Matthew Darke. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Parse/Parse.h>


@interface RegisterViewController : UIViewController
    
@property (weak, nonatomic)IBOutlet UITextField *userName;
@property (weak, nonatomic)IBOutlet UITextField *eMail;
@property (weak, nonatomic)IBOutlet UITextField *passWord;

- (IBAction)registerButn:(id)sender;


    


@end
