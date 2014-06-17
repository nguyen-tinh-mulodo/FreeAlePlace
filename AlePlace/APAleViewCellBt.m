//
//  APAleViewCellBt.m
//  AlePlace
//
//  Created by Apple on 6/7/14.
//
//

#import "APAleViewCellBt.h"

@implementation APAleViewCellBt
@synthesize stadiumBt,teamBt,delegate;
- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(IBAction)stadiumAc:(id)sender{
    UIButton *bt = sender;
    if (bt.tag == 100) {
        [self.delegate showStadium];
    }else{
        if (bt.tag == 300) {
            [self.delegate showSchedule];
        }
    }
}
-(IBAction)teamBt:(id)sender{
    UIButton *bt = sender;
    if (bt.tag == 200) {
       [self.delegate showTerm];
    }else{
        if (bt.tag == 400) {
            [self.delegate showResult];

        }
    }
}

@end
