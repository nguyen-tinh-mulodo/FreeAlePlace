//
//  APPlaceViewController.h
//  AlePlace
//
//  Created by Apple on 6/7/14.
//
//

#import <UIKit/UIKit.h>
#import "APPlaceTableViewCell.h"
#import "APCallAPI.h"

@interface APPlaceViewController : UIViewController<APPlaceTableViewCellDelegate>
{
    NSMutableArray * mapDataList;
}
@property (nonatomic,weak)IBOutlet UITableView *tableViewPlace;
@end
