//
//  CustomCell.m
//  RegisterUsers
//
//  Created by Matthew Darke on 6/8/15.
//  Copyright (c) 2015 Matthew Darke. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell
@synthesize itemNameText, itemNumberText;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



-(void)refreshCell

{
    itemNameLable.text = itemNameText;
    itemNumberLable.text = itemNumberText;
}



@end
