//
//  APAleViewCellBt.h
//  AlePlace
//
//  Created by Apple on 6/7/14.
//
//

#import <UIKit/UIKit.h>
@protocol APAleViewCellBtDelegate <NSObject>
@optional
- (void)showStadium;
- (void)showTerm;
-(void)showSchedule;
-(void)showResult;

@end
@interface APAleViewCellBt : UITableViewCell
@property(nonatomic,weak)IBOutlet UIButton *stadiumBt;
@property(nonatomic,weak)IBOutlet UIButton *teamBt;
@property (weak,nonatomic) id<APAleViewCellBtDelegate> delegate;
-(IBAction)stadiumAc:(id)sender;
-(IBAction)teamBt:(id)sender;

@end
