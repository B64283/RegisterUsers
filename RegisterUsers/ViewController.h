//
//  ViewController.h
//  RegisterUsers
//
//  Created by Matthew Darke on 6/6/15.
//  Copyright (c) 2015 Matthew Darke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "RegisterViewController.h"
#import "CustomCell.h"

@interface ViewController : UIViewController   {
    
    
    NSArray *userStringArray;
    
}
@property (weak, nonatomic)IBOutlet UITextField *userNameSin;

@property (weak, nonatomic)IBOutlet UITextField *userPassword;

-(IBAction)signInAction:(id)sender;






@end
