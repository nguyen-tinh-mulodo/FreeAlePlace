//
//  APDetailEventViewController.h
//  AlePlace
//
//  Created by Apple on 6/6/14.
//
//

#import <UIKit/UIKit.h>
#import "FMControllShowFullImage.h"
#import "GADBannerViewDelegate.h"
@interface APDetailEventViewController : UIViewController<UIScrollViewDelegate,UITabBarDelegate,FMControllShowFullImageDelegate,GADBannerViewDelegate>
@property(nonatomic,readwrite)NSInteger idEvent;
@property(nonatomic,weak)IBOutlet UILabel *titleEvent;
@property(nonatomic,weak)IBOutlet UIScrollView *scrollDetailEvent;
@property(nonatomic,weak)IBOutlet UILabel *startdate;
@property(nonatomic,weak)IBOutlet UILabel *enddate;
@property(nonatomic,weak)IBOutlet UILabel *titleDescription;
@property(nonatomic,weak)IBOutlet UILabel *description;
@property(nonatomic,weak)IBOutlet UIWebView *webView;
@property(nonatomic,weak)IBOutlet UIImageView *imageDetailEvent;
@property(nonatomic,weak)IBOutlet UIButton *album1;
@property(nonatomic,weak)IBOutlet UIButton *album2;
@property(nonatomic,weak)IBOutlet UIButton *album3;
@property(nonatomic,weak)IBOutlet UITabBar *tabBarAle;
@property(nonatomic,weak)IBOutlet UITabBarItem *tabBarItemAle;
@property(nonatomic,weak)IBOutlet UITabBarItem *tabBarItemTace;
@property(nonatomic,weak)IBOutlet UITabBarItem *tabBarItemPlace;
@property(nonatomic,weak)IBOutlet UITabBarItem *tabBarItemHome;
@property(nonatomic,weak)IBOutlet UIButton *btItemAle;
@property(nonatomic,weak)IBOutlet UIButton *btItemTake;
@property(nonatomic,weak)IBOutlet UIButton *btItemPlace;
@property(nonatomic,weak)IBOutlet UIButton *btItemHome;
@property(nonatomic,weak)IBOutlet UIView *viewBg;
@property(nonatomic,weak)IBOutlet UIWebView *webViewDes;
-(IBAction)showAle:(id)sender;
-(IBAction)showTake:(id)sender;
-(IBAction)showPlace:(id)sender;
-(IBAction)showHome:(id)sender;

@end
