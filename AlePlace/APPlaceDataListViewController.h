//
//  APPlaceDataListViewController.h
//  AlePlace
//
//  Created by Apple on 6/11/14.
//
//

#import <UIKit/UIKit.h>
#import "APStadiumTableViewCell.h"
@interface APPlaceDataListViewController : UIViewController<APStadiumTableViewCellDelegate>
@property(nonatomic,weak)IBOutlet UITableView *tableStadium;
@property(nonatomic,strong) NSString *city_id;
@property(nonatomic,strong) NSString *catagoryId;
@property(nonatomic,strong) NSString *stadiumId;

@end
