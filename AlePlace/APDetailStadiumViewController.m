//
//  APDetailStadiumViewController.m
//  AlePlace
//
//  Created by Apple on 6/8/14.
//
//

#import "APDetailStadiumViewController.h"
#import <GoogleMaps/GoogleMaps.h>
#import "UIImageView+AFNetworking.h"
#import "FMConstants.h"
#import "FMUtils.h"
#import "APShowFullMapViewController.h"
#import "FMUtils.h"
#import "APAppDelegate.h"
#import "GADBannerView.h"
@interface UIView (ARES)

- (void)roundCornerShadowAndBorder;

@end

@implementation UIView (ARES)

- (void)roundCornerShadowAndBorder {
    
    [self.layer setCornerRadius:6];
    [self.layer setMasksToBounds:NO];
    
    [self.layer setShadowColor:[UIColor darkTextColor].CGColor];
    [self.layer setShadowOpacity:0.9];
    [self.layer setShadowOffset:CGSizeMake(1,1)];
    [self.layer setShadowRadius:0.9];
    [self.layer setShadowPath:[[UIBezierPath bezierPathWithRoundedRect:self.layer.bounds cornerRadius:self.layer.cornerRadius] CGPath]];
    
    [self.layer setShouldRasterize:YES];
    [self.layer setRasterizationScale:[UIScreen mainScreen].scale];
}
@end
@interface APDetailStadiumViewController ()
{
    GMSMapView *mapView_;
    APShowFullMapViewController *showFullMapViewController;
    GADBannerView *bannerView;
}
@end

@implementation APDetailStadiumViewController
@synthesize map;
@synthesize stadium,imageDetail,titleDetail,description,capacity,address,webView,showFull,zoomMax,zoomMin,scrollStadium,mapView,webviewDes;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [[NSNotificationCenter defaultCenter]postNotificationName:kAleViewController object:self userInfo:@{kNameView:@"APDetailStadiumViewController"}];
    [self loadData];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(removeView) name:kRemoveStadiumDetailViewController object:nil];
    [self showbannerAdmod];
}
-(void)removeView{
    [self.view removeFromSuperview];
}
-(IBAction)showFullMap:(id)sender{
   showFullMapViewController = [[APShowFullMapViewController alloc] initWithNibName:@"APShowFullMapViewController" bundle:nil];
    showFullMapViewController.stadium = stadium;
    showFullMapViewController.flgShowStadium = TRUE;
    showFullMapViewController.view.frame = self.view.frame;
    [self.view addSubview:showFullMapViewController.view];
}
-(void)loadData{
    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:stadium.latitude
                                                            longitude:stadium.longitude
                                                                 zoom:20];
    mapView_ = [GMSMapView mapWithFrame:CGRectMake(0, 0, self.map.frame.size.width, self.map.frame.size.height) camera:camera];
    mapView_.myLocationEnabled = YES;
    mapView.delegate = self;
    [self.map addSubview:mapView_];
    // Creates a marker in the center of the map.
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(stadium.latitude, stadium.longitude);
    marker.title = stadium.nameStadium;
    marker.snippet = stadium.city;
    marker.icon = [FMUtils imageWithImage:[UIImage imageNamed:@"stadium_map.png"] scaledToSize:CGSizeMake(40, 40)];
    marker.map = mapView_;
    
    
    self.titleDetail.text = stadium.nameStadium;
    [self.imageDetail roundCornerShadowAndBorder];
    [self.imageDetail setImageWithURL:[NSURL URLWithString:[stadium.thumb_photoStadium stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]] placeholderImage:nil];
    self.description.text = stadium.descriptionStadium;
    [self.webviewDes loadHTMLString:stadium.descriptionStadium baseURL:nil];
    [self.webviewDes setOpaque:NO];
    self.webviewDes.backgroundColor = [UIColor clearColor];
    self.description.hidden = YES;
    self.webviewDes.frame = CGRectMake(self.description.frame.origin.x,CGRectGetMaxY(self.map.frame)+ 30, self.description.frame.size.width, [FMUtils heightForCell:stadium.descriptionStadium size:17 font:@"Helvetica" width:self.description.frame.size.width]);
    self.address.text = stadium.address;
    self.description.frame = CGRectMake(self.description.frame.origin.x,CGRectGetMaxY(self.map.frame)+ 20, self.description.frame.size.width, [FMUtils heightForCell:stadium.descriptionStadium size:17 font:@"Helvetica" width:self.description.frame.size.width]);
    self.address.text = stadium.address;
    self.capacity.text = [NSString stringWithFormat:@"%d",stadium.capacity];
    
    self.description.hidden = YES;
     self.webView.frame = CGRectMake(self.webView.frame.origin.x, CGRectGetMaxY(self.description.frame)+10, self.webView.frame.size.width, self.view.frame.size.height);
    if (stadium.media.count > 0) {
        NSURL *urlforWebView=[NSURL URLWithString:[stadium.media objectAtIndex:0]];
        NSURLRequest *urlRequest=[NSURLRequest requestWithURL:urlforWebView];
        self.webView.frame = CGRectMake(self.webView.frame.origin.x, self.webView.frame.origin.y, self.webView.frame.size.width, self.webView.frame.size.height+ 50);
        [self.webView loadRequest:urlRequest];
    }
     
    self.scrollStadium.contentSize = CGSizeMake(self.scrollStadium.frame.size.width,CGRectGetMaxY(self.webView.frame)+100);
     
    
}
#pragma mark - Rotate View Support
- (BOOL)shouldAutorotate {
    return YES;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return YES;
}
- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    
}
- (NSUInteger)supportedInterfaceOrientations
{
    //return orientations you want to support
    return (UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationMaskLandscapeRight | UIInterfaceOrientationMaskPortraitUpsideDown);
}
- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    [super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
    
    switch (toInterfaceOrientation) {
        case UIInterfaceOrientationPortrait: {
            NSLog(@"Portrait");
            
            mapView_.frame = CGRectMake(mapView_.frame.origin.x, mapView_.frame.origin.y, [FMUtils getMainView].frame.size.width -20, mapView_.frame.size.height);
           
            break;
        }
            
        case UIInterfaceOrientationLandscapeLeft: {
            NSLog(@"Landscape Left");
            
            mapView_.frame = CGRectMake(mapView_.frame.origin.x, mapView_.frame.origin.y, [FMUtils getMainView].frame.size.height -20, mapView_.frame.size.height);
            
            
            break;
        }
            
        case UIInterfaceOrientationLandscapeRight: {
            NSLog(@"Landscape Right");
            
            mapView_.frame = CGRectMake(mapView_.frame.origin.x, mapView_.frame.origin.y, [FMUtils getMainView].frame.size.height -20, mapView_.frame.size.height);
            
            break;
        }
            
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)mapView:(GMSMapView *)mapView
didTapInfoWindowOfMarker:(GMSMarker*)marker
{
    stadium=marker.userData;
    
    NSLog(@"MARKER..... %ld",(long)stadium.city_id);
    [APAppDelegate appDelegate].idCity = stadium.city_id;
    
    
    
}
-(void)showbannerAdmod{
    if ([kUseAdmod isEqualToString:@"YES"]) {
        /*if (bannerView) {
         [bannerView removeFromSuperview];
         }
         bannerView = [[GADBannerView alloc]initWithAdSize:kGADAdSizeSmartBannerPortrait origin:CGPointMake(0, 0)];
         bannerView.rootViewController = self;
         bannerView.delegate = self;
         bannerView.adUnitID = ADMOBS_ID;
         //requestAdmod.testDevices = @[@"Simulator"];
         [bannerView loadRequest:[GADRequest request]];
         UIView *bannerAdmod = [[UIView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height - kHeightWhenAdmod, self.view.frame.size.width, kHeightWhenAdmod)];
         [bannerAdmod addSubview:bannerView];
         bannerAdmod.layer.zPosition =0;
         
         [self.view addSubview:bannerView];
         [bannerView setHidden:YES];
         
         // turn off scrolling on Ads
         for (UIWebView *webViewAD in bannerView.subviews) {
         if ([webViewAD isKindOfClass:[UIWebView class]]) {
         webViewAD.scrollView.bounces = NO;
         }
         }
         */
        
        bannerView = [[GADBannerView alloc] initWithAdSize:kGADAdSizeBanner];
        
        // Specify the ad unit ID.
        bannerView.adUnitID = ADMOBS_ID;
        if ([FMUtils isIPhone5]) {
            bannerView.frame = CGRectMake(0,self.view.frame.size.height  - 4-3*kHeightWhenAdmod,bannerView.frame.size.width, bannerView.frame.size.height);
        }else{
            bannerView.frame = CGRectMake(0,self.view.frame.size.height +8-5*kHeightWhenAdmod,bannerView.frame.size.width, bannerView.frame.size.height);
        }

        // Let the runtime know which UIViewController to restore after taking
        // the user wherever the ad goes and add it to the view hierarchy.
        bannerView.rootViewController = self;
        [self.view addSubview:bannerView];
        
        // Initiate a generic request to load it with an ad.
        [bannerView loadRequest:[GADRequest request]];
        
    }
    
}
#pragma GADBannerViewDelegate
- (void)adViewDidReceiveAd:(GADBannerView *)view{
    
}
- (void)adView:(GADBannerView *)view
didFailToReceiveAdWithError:(GADRequestError *)error{
    
}
@end
