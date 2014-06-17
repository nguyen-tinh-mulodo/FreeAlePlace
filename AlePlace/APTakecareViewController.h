//
//  APTakecareViewController.h
//  AlePlace
//
//  Created by Apple on 6/7/14.
//
//

#import <UIKit/UIKit.h>
#import "APAleViewCellBt.h"
@interface APTakecareViewController : UIViewController<APAleViewCellBtDelegate>
{
     NSMutableArray * mapDataList;
}
@property(nonatomic,strong)IBOutlet UITableView *taceCareTable;
@end
