//
//  APPlaceTableViewCell.h
//  AlePlace
//
//  Created by Apple on 6/7/14.
//
//

#import <UIKit/UIKit.h>
@protocol APPlaceTableViewCellDelegate <NSObject>
@optional
- (void)eat;
- (void)do_do;
-(void)see;
-(void)restaurant;
-(void)tour;
-(void)shopping;

@end

@interface APPlaceTableViewCell : UITableViewCell
@property(nonatomic,weak)IBOutlet UIButton *bt1;
@property(nonatomic,weak)IBOutlet UIButton *bt2;
@property (weak,nonatomic) id<APPlaceTableViewCellDelegate> delegate;
-(IBAction)actionBt1:(id)sender;
-(IBAction)actionBt2:(id)sender;
@end
