//
//  APDetailPlaceViewController.m
//  AlePlace
//
//  Created by VinhPhuc on 6/11/14.
//
//

#import "APDetailPlaceViewController.h"
#import <GoogleMaps/GoogleMaps.h>
#import "UIImageView+AFNetworking.h"
#import "FMConstants.h"
#import "FMUtils.h"
#import "APShowFullMapViewController.h"
#import "FMUtils.h"
#import "GADBannerView.h"
@interface UIView (ARES)

- (void)roundCornerShadowAndBorder;

@end

@implementation UIView (ARES)
UIImage *markerImg;
- (void)roundCornerShadowAndBorder {
    
    [self.layer setCornerRadius:6];
    [self.layer setMasksToBounds:NO];
    
    [self.layer setShadowColor:[UIColor darkTextColor].CGColor];
    [self.layer setShadowOpacity:0.6];
    [self.layer setShadowOffset:CGSizeMake(1,1)];
    [self.layer setShadowRadius:0.9];
    [self.layer setShadowPath:[[UIBezierPath bezierPathWithRoundedRect:self.layer.bounds cornerRadius:self.layer.cornerRadius] CGPath]];
    
    [self.layer setShouldRasterize:YES];
    [self.layer setRasterizationScale:[UIScreen mainScreen].scale];
}
@end
@interface APDetailPlaceViewController ()
{
    GMSMapView *mapView_;
    APShowFullMapViewController *showFullMapViewController;
    GADBannerView *bannerView;
}
@end

@implementation APDetailPlaceViewController
@synthesize map,viewContaintImaves,imageDetail,titleDetail,description,address,hours,price,webView,showFull,zoomMax,zoomMin,scrollStadium,place,imagePhone,webViewDes,numberString;
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
    [[NSNotificationCenter defaultCenter]postNotificationName:kAleViewController object:self userInfo:@{kNameView:@"APDetailPlaceViewController"}];
    [self loadData];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(removeView) name:kRemoveDetailPlaceViewController object:nil];
    [self showbannerAdmod];
}
-(void)removeView{
    [self.view removeFromSuperview];
}
-(IBAction)showFullMap:(id)sender{
    showFullMapViewController = [[APShowFullMapViewController alloc] initWithNibName:@"APShowFullMapViewController" bundle:nil];
    showFullMapViewController.place = place;
    showFullMapViewController.view.frame = self.view.frame;
    [self.view addSubview:showFullMapViewController.view];
}

- (IBAction)CallNumber:(id)sender {
    //show your alert...
    self.numberString = place.phone;
    self.numberString = [self.numberString stringByReplacingOccurrencesOfString:@"+" withString:@""];
     self.numberString = [self.numberString stringByReplacingOccurrencesOfString:@"-" withString:@""];
     self.numberString = [self.numberString stringByReplacingOccurrencesOfString:@" " withString:@""];
     self.numberString = [self.numberString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *phoneNumber = [@"telprompt://" stringByAppendingString:self.numberString];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber]];
    
}
-(void)loadData{
    
    // load image marker
    CGSize markerSize=CGSizeMake(40, 45);

    NSString *catagory=[place.category_id stringByTrimmingCharactersInSet:
                        [NSCharacterSet whitespaceCharacterSet]];
    switch ([catagory intValue]) {
        case 1:
            markerImg=[FMUtils imageWithImage:[UIImage imageNamed:@"Shopping_map"] scaledToSize:markerSize];
            break;
        case 2:
            markerImg=[FMUtils imageWithImage:[UIImage imageNamed:@"Eat&-drink_map"] scaledToSize:markerSize];
            break;
        case 3:
            markerImg=[FMUtils imageWithImage:[UIImage imageNamed:@"police_map"] scaledToSize:markerSize];
            
            break;
        case 4:
            markerImg=[FMUtils imageWithImage:[UIImage imageNamed:@"hospital_map"] scaledToSize:markerSize];
            
            break;
        case 5:
            markerImg=[FMUtils imageWithImage:[UIImage imageNamed:@"Thing-to-do_map"] scaledToSize:markerSize];
            
            break;
        case 6:
            markerImg=[FMUtils imageWithImage:[UIImage imageNamed:@"See_map"] scaledToSize:markerSize];
            
            break;
        case 7:
            markerImg=[FMUtils imageWithImage:[UIImage imageNamed:@"Restaurant_map"] scaledToSize:markerSize];
            break;
        case 8:
            markerImg=[FMUtils imageWithImage:[UIImage imageNamed:@"Tour_map"] scaledToSize:markerSize];
            
            break;
        case 9:
            markerImg=[FMUtils imageWithImage:[UIImage imageNamed:@"transport_map"] scaledToSize:markerSize];
            
            break;
        case 10:
            markerImg=[FMUtils imageWithImage:[UIImage imageNamed:@"Hotel_map"] scaledToSize:markerSize];
            
            break;
            
        default:
            markerImg=[FMUtils imageWithImage:[UIImage imageNamed:@"Places-icon"] scaledToSize:markerSize];
            break;
    }
    
    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:place.latitude
                                                            longitude:place.longitude
                                                                 zoom:20];
    mapView_ = [GMSMapView mapWithFrame:CGRectMake(0, 0, self.map.frame.size.width, self.map.frame.size.height) camera:camera];
    mapView_.myLocationEnabled = YES;
    [self.map addSubview:mapView_];
    [self.map addSubview:showFull];
    // Creates a marker in the center of the map.
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(place.latitude, place.longitude);
    marker.title = place.nameplace;
    marker.snippet = place.city;
    marker.icon=markerImg;
    marker.map = mapView_;
    self.titleDetail.text = place.nameplace;
    [self.imageDetail setImageWithURL:[NSURL URLWithString:[place.thumb_photoplace stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]] placeholderImage:[UIImage imageNamed:@"placeholder"]];

    self.description.text = place.description;
    [webViewDes loadHTMLString:place.description baseURL:nil];
    webViewDes.scrollView.scrollEnabled = NO;
    webViewDes.scrollView.bounces = NO;
    [webViewDes setOpaque:NO];
    webViewDes.backgroundColor = [UIColor clearColor];
    self.description.hidden = YES;
    webViewDes.frame = CGRectMake(self.description.frame.origin.x,CGRectGetMaxY(self.map.frame)+ 20, self.description.frame.size.width, [FMUtils heightForCell:place.description size:17 font:@"Helvetica" width:self.description.frame.size.width]);
    self.description.frame = CGRectMake(self.description.frame.origin.x,CGRectGetMaxY(self.map.frame)+ 20, self.description.frame.size.width, [FMUtils heightForCell:place.description size:17 font:@"Helvetica" width:self.description.frame.size.width]);
    self.price.text=place.price;
    self.hours.text=place.service_hour;
    self.address.text = place.address;
    [self.phoneNumber setTitle:place.phone forState:UIControlStateNormal];
    if([place.phone isEqualToString: @"" ])
    {
        imagePhone.hidden=YES;
    }

//    self.phone.text = place.phone;
//    self.phone.userInteractionEnabled=YES;
//
//    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc]
//                                             initWithTarget:self action:@selector(phoneTap:)];
//    [self.phone addGestureRecognizer:tapRecognizer];
//    
    
    self.webView.frame = CGRectMake(self.webView.frame.origin.x, CGRectGetMaxY(self.description.frame)+10, self.webView.frame.size.width, self.view.frame.size.height);
    if (place.media.count > 0) {
        NSURL *urlforWebView=[NSURL URLWithString:[place.media objectAtIndex:0]];
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

- (void)phoneTap:(UITapGestureRecognizer *)tapGestureRecognizer
{
    //show your alert...
    NSString *phoneNumber = [@"telprompt://" stringByAppendingString: place.phone];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber]];
    
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
