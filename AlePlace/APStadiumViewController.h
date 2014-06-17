//
//  APStadiumViewController.h
//  AlePlace
//
//  Created by Apple on 6/7/14.
//
//

#import <UIKit/UIKit.h>
#import "APStadiumTableViewCell.h"
@interface APStadiumViewController : UIViewController<APStadiumTableViewCellDelegate>
@property(nonatomic,weak)IBOutlet UITableView *tableStadium;
@end
