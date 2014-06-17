//
//  APPlaceTableViewCell.m
//  AlePlace
//
//  Created by Apple on 6/7/14.
//
//

#import "APPlaceTableViewCell.h"

@implementation APPlaceTableViewCell
@synthesize bt1,bt2,delegate;
- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(IBAction)actionBt1:(id)sender{
    UIButton *bt = sender;
    if (bt.tag == 100) {
        [self.delegate eat];
    }else{
        if (bt.tag == 300) {
            [self.delegate see];
        }else{
            if (bt.tag == 500) {
                [self.delegate tour];
            }
        }
    }
}
-(IBAction)actionBt2:(id)sender{
    UIButton *bt = sender;
    if (bt.tag == 200) {
        [self.delegate do_do];
    }else{
        if (bt.tag == 400) {
            [self.delegate restaurant];
        }else{
            if (bt.tag == 600) {
                [self.delegate shopping];
            }
        }
    }
}
@end
