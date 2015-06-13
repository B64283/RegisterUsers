//
//  AddInfoViewController.h
//  RegisterUsers
//
//  Created by Matthew Darke on 6/11/15.
//  Copyright (c) 2015 Matthew Darke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddInfoViewController : UIViewController

@property (weak, nonatomic)IBOutlet UITextField *itemName;
@property (weak, nonatomic)IBOutlet UITextField *itemNumber;

- (IBAction)saveButn:(id)sender;


@end
