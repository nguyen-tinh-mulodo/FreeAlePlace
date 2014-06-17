//
//  APStadiumTableViewCell.m
//  AlePlace
//
//  Created by Apple on 6/7/14.
//
//

#import "APStadiumTableViewCell.h"

@implementation APStadiumTableViewCell

@synthesize imageView,imageStadium,city,country,add,btMap,btPreview,delegate,fromView,cityTitle,countryTitle,addTitle;


- (void)awakeFromNib
{
    
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(IBAction)showFullMap:(id)sender{
    [self.delegate showMap:self.tag];
}
@end
