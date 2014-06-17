//
//  APEventCellTableViewCell.h
//  AlePlace
//
//  Created by Apple on 6/10/14.
//
//

#import <UIKit/UIKit.h>

@interface APEventCellTableViewCell : UITableViewCell
@property(nonatomic,weak)IBOutlet UILabel *nameEvent;
@property(nonatomic,weak)IBOutlet UILabel *dateEvent;
@property(nonatomic,weak)IBOutlet UIImageView *imageEvent;
@end
