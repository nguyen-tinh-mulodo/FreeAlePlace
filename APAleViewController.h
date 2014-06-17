//
//  APAleViewController.h
//  AlePlace
//
//  Created by Apple on 6/6/14.
//
//

#import <UIKit/UIKit.h>
#import "APAleViewCellBt.h"
#import "APEvent.h"
@interface APAleViewController : UIViewController<APAleViewCellBtDelegate>
@property(nonatomic,weak)IBOutlet UIButton *stadiumBt;
@property(nonatomic,weak)IBOutlet UIButton *teamBt;
@property(nonatomic,weak)IBOutlet UIButton *scheduleBt;
@property(nonatomic,weak)IBOutlet UIButton *resultBt;
@property(nonatomic,weak)IBOutlet UIImageView *bannerAle;
@property(nonatomic,strong)IBOutlet UITableView *aleScroll;
@property(nonatomic,strong)APEvent *event;
-(IBAction)stadiumAc:(id)sender;
-(IBAction)teamBt:(id)sender;
-(IBAction)scheduleBt:(id)sender;
-(IBAction)resultBt:(id)sender;
-(void)layout;
@end
