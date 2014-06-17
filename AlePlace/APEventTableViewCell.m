//
//  APEventTableViewCell.m
//  AlePlace
//
//  Created by Apple on 6/6/14.
//
//

#import "APEventTableViewCell.h"

@implementation APEventTableViewCell
@synthesize nameEvent,dateEvent,imageEvent;
- (void)awakeFromNib
{
    // Initialization code
       
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        //        CGRect rect = self.contentView.frame;
        
//        NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"SurveyCell" owner:self options:nil];
//        
//        if ([array count]>0) {
//            view = [array objectAtIndex:0];
//            NSLog(@"%@ self ",self);
//            NSLog(@"%@ contentView ",self.contentView);
//            NSLog(@"%@ view ",view);
//            
//            [self.contentView addSubview:view];
//            
//            
//            view.frame = CGRectMake(10, 8, 305, 64);
//            [view release];
//        }
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
