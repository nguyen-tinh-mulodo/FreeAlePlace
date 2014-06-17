//
//  APHomeViewController.h
//  AlePlace
//
//  Created by Apple on 6/5/14.
//
//

#import <UIKit/UIKit.h>
#import "APEventTableViewCell.h"
#import "GADBannerViewDelegate.h"
@interface APHomeViewController : UIViewController<GADBannerViewDelegate>
@property (nonatomic,weak)IBOutlet UITableView *tableViewEvent;
@property (nonatomic,weak)IBOutlet UIImageView *imageViewStart;
@property (nonatomic,weak)IBOutlet UIImageView *imageViewRound;
@property (weak, nonatomic) IBOutlet APEventTableViewCell *customCell;
@property (nonatomic,strong) UILabel *titleHeader;
- (IBAction)backBtnClick:(id)sender;
@end
