//
//  APAppDelegate.h
//  AlePlace
//
//  Created by Apple on 6/5/14.
//
//

#import <UIKit/UIKit.h>
#import "APLaunchImageViewController.h"
#import "APHomeViewController.h"
#import <GoogleMaps/GoogleMaps.h>
@interface APAppDelegate : UIResponder <UIApplicationDelegate,UINavigationControllerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong,nonatomic ) APLaunchImageViewController *launchImageViewController;
@property (strong,nonatomic) APHomeViewController *homeViewController;
@property (strong,nonatomic) UINavigationController *navigation;
@property (readwrite) NSInteger idCity;
@property (readwrite) NSInteger idStadium;
@property (readwrite) float lat;
@property (readwrite) float longt;
@property (strong, nonatomic)NSString *nameStadium;
@property (strong, nonatomic)NSString *city;
@property (strong, nonatomic)NSString *result;
@property (strong, nonatomic)NSString *schedule;
@property (strong, nonatomic)NSString *team;



+ (APAppDelegate *)appDelegate;
-(void)setTitleLabel;
- (IBAction)backBtnClick:(id)sender;
@end
