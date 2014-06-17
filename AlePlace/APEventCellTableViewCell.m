//
//  APEventCellTableViewCell.m
//  AlePlace
//
//  Created by Apple on 6/10/14.
//
//

#import "APEventCellTableViewCell.h"

@implementation APEventCellTableViewCell
@synthesize nameEvent,dateEvent,imageEvent;
- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
