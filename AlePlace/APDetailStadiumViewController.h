//
//  APDetailStadiumViewController.h
//  AlePlace
//
//  Created by Apple on 6/8/14.
//
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>
#import "APStadium.h"
@interface APDetailStadiumViewController : UIViewController<GMSMapViewDelegate>
@property(nonatomic,strong) APStadium *stadium;
@property(nonatomic,weak) IBOutlet UIView *map;
@property(nonatomic,weak) IBOutlet GMSMapView *mapView;
@property(nonatomic,weak) IBOutlet UIImageView *imageDetail;
@property(nonatomic,weak) IBOutlet UILabel *titleDetail;
@property(nonatomic,weak) IBOutlet UILabel *description;
@property(nonatomic,weak) IBOutlet UILabel *capacity;
@property(nonatomic,weak) IBOutlet UILabel *address;
@property(nonatomic,weak) IBOutlet UIWebView *webView;
@property(nonatomic,weak) IBOutlet UIButton *showFull;
@property(nonatomic,weak) IBOutlet UIButton *zoomMax;
@property(nonatomic,weak) IBOutlet UIButton *zoomMin;
@property(nonatomic,weak) IBOutlet UIScrollView *scrollStadium;
@property(nonatomic,weak) IBOutlet UIWebView *webviewDes;
-(IBAction)showFullMap:(id)sender;
@end
