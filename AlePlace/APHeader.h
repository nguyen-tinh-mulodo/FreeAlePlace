//
//  APHeader.h
//  AlePlace
//
//  Created by Apple on 6/10/14.
//
//

#import <UIKit/UIKit.h>

@interface APHeader : UIView
@property(nonatomic,weak)IBOutlet UILabel *titleHeader;
- (IBAction)backBtnClick:(id)sender;
- (IBAction)more:(id)sender;
@end
