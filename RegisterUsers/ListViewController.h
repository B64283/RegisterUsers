//
//  ListViewController.h
//  RegisterUsers
//
//  Created by Matthew Darke on 6/8/15.
//  Copyright (c) 2015 Matthew Darke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomCell.h"
#import <Parse/Parse.h>

@interface ListViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    
    NSMutableArray *userStrArray;
    
}



@property (strong, nonatomic) NSMutableArray* userStrArray;


@property (weak, nonatomic) IBOutlet UITableView* myTableView;



@end
