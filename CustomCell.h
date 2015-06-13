//
//  CustomCell.h
//  RegisterUsers
//
//  Created by Matthew Darke on 6/8/15.
//  Copyright (c) 2015 Matthew Darke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
@interface CustomCell : UITableViewCell {
    
    IBOutlet UILabel * itemNameLable;
    IBOutlet UILabel * itemNumberLable;
    
    

}

-(void)refreshCell;

@property(nonatomic, strong) NSString *itemNameText;
@property(nonatomic, strong) NSString *itemNumberText;

@end
