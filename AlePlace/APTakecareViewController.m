//
//  APTakecareViewController.m
//  AlePlace
//
//  Created by Apple on 6/7/14.
//
//

#import "APTakecareViewController.h"
#import "APAleViewCellBt.h"
#import "APAleViewCell.h"
#import "FMConstants.h"
#import "APAppDelegate.h"
#import "APPlaceMapViewController.h"
#import "APPlaceDataListViewController.h"
#import "APCallAPI.h"
#import "GADBannerView.h"
#import "FMUtils.h"
@interface APTakecareViewController ()
{
    APPlaceMapViewController *mapView;
    APPlaceDataListViewController *placeDataListViewController;
    GADBannerView *bannerView;

}
@end

@implementation APTakecareViewController
@synthesize taceCareTable;
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
    [self.taceCareTable setAllowsSelection:NO];
    [self callAPIGet];
    NSString *title = titleHome;
    
    [[NSNotificationCenter defaultCenter]postNotificationName:editTitle object:self userInfo:@{editTitle: title}];
    [self showbannerAdmod];
    // Do any additional setup after loading the view from its nib.
}
-(void)callAPIGet{
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    [dictionary setValue:@"json" forKey:@"format"];
    [dictionary setValue:@"33" forKey:@"countryId"];
    [dictionary setValue:@"5d7299e5d3ea2698b9ef43527eae374e1ce439da" forKey:@"esapikey"];
    [APCallAPI getCities:^(NSArray *listPlaces, NSObject *error) {
        mapDataList = [NSMutableArray arrayWithArray:listPlaces];
        // [self.tableStadium reloadData];
    } parameters:dictionary didFail:^(NSObject *error) {
    }];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    
    /* switch (toInterfaceOrientation) {
     case UIInterfaceOrientationPortrait: {
     NSLog(@"Portrait");
     [self layout:[FMUtils getMainView].frame.size.width h:[FMUtils getMainView].frame.size.height];
     self.aleScroll.contentSize = CGSizeMake([FMUtils getMainView].frame.size.width,[FMUtils getMainView].frame.size.height+20);
     break;
     }
     
     case UIInterfaceOrientationLandscapeLeft: {
     NSLog(@"Landscape Left");
     [self layout:[FMUtils getMainView].frame.size.height h:[FMUtils getMainView].frame.size.width];
     self.aleScroll.contentSize = CGSizeMake([FMUtils getMainView].frame.size.height,[FMUtils getMainView].frame.size.width+50);
     
     
     break;
     }
     
     case UIInterfaceOrientationLandscapeRight: {
     NSLog(@"Landscape Right");
     [self layout:[FMUtils getMainView].frame.size.width h:[FMUtils getMainView].frame.size.width];
     self.aleScroll.contentSize = CGSizeMake([FMUtils getMainView].frame.size.height,[FMUtils getMainView].frame.size.width+50);
     
     break;
     }
     
     default:
     break;
     }
     */
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        static NSString *CellIdentifier = @"APEventTableViewCell";
        APAleViewCell *cell = nil;
        cell = (APAleViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            // cell = [[APEventTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"APAleViewCell" owner:self options:nil];
            // Grab a pointer to the first object (presumably the custom cell, as that's all the XIB should contain).
            cell = [topLevelObjects objectAtIndex:0];
        }
        cell.banner.image = [UIImage imageNamed:@"bannerTake.png"];
        cell.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        return cell;
    }else{
        static NSString *CellIdentifier = @"APAleViewCellBt";
        APAleViewCellBt *cell = nil;
        cell = (APAleViewCellBt*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            // cell = [[APEventTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"APAleViewCellBt" owner:self options:nil];
            // Grab a pointer to the first object (presumably the custom cell, as that's all the XIB should contain).
            cell = [topLevelObjects objectAtIndex:0];
            cell.delegate = self;
        }
        cell.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        if (indexPath.row == 1) {
            cell.stadiumBt.tag = 100;
            cell.teamBt.tag = 200;
            [cell.stadiumBt setImage:[UIImage imageNamed:@"Police.png"] forState:UIControlStateNormal];
            [cell.teamBt setImage:[UIImage imageNamed:@"hospital.png"] forState:UIControlStateNormal];
        }
        if (indexPath.row == 2) {
            cell.stadiumBt.tag = 300;
            cell.teamBt.tag = 400;
            [cell.stadiumBt setImage:[UIImage imageNamed:@"transport.png"] forState:UIControlStateNormal];
            [cell.teamBt setImage:[UIImage imageNamed:@"maps.png"] forState:UIControlStateNormal];
        }
        if (indexPath.row == 3) {
            
        }
        return cell;
    }
    
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 3) {
        return 50;
    }
    return 150;
}
#pragma APAleViewCellBtDelegate
- (void)showStadium{
    //categoryId/3
    if ([APAppDelegate appDelegate].idCity > 0) {
        // show data
        placeDataListViewController = [[APPlaceDataListViewController alloc] initWithNibName:@"APPlaceDataListViewController" bundle:nil];
        placeDataListViewController.city_id =[NSString stringWithFormat:@"%d",[APAppDelegate appDelegate].idCity];
        placeDataListViewController.catagoryId=@"3";
        placeDataListViewController.view.frame = self.view.frame;
        [self.view addSubview:placeDataListViewController.view];
    }else{
        // show map
        [self showMap:3];
    }
}
- (void)showTerm{
     //categoryId/4
    if ([APAppDelegate appDelegate].idCity > 0) {
        // show data
        placeDataListViewController = [[APPlaceDataListViewController alloc] initWithNibName:@"APPlaceDataListViewController" bundle:nil];
        placeDataListViewController.city_id =[NSString stringWithFormat:@"%d",[APAppDelegate appDelegate].idCity];
        placeDataListViewController.catagoryId=@"4";
        placeDataListViewController.view.frame = self.view.frame;
        [self.view addSubview:placeDataListViewController.view];
    }else{
        // show map
        [self showMap:4];
    }
}
-(void)showSchedule{
     //categoryId/9
    if ([APAppDelegate appDelegate].idCity > 0) {
        // show data
        placeDataListViewController = [[APPlaceDataListViewController alloc] initWithNibName:@"APPlaceDataListViewController" bundle:nil];

        placeDataListViewController.city_id =[NSString stringWithFormat:@"%d",[APAppDelegate appDelegate].idCity];
        placeDataListViewController.catagoryId=@"9";
         placeDataListViewController.view.frame = self.view.frame;
        [self.view addSubview:placeDataListViewController.view];
    }else{
        // show map
        [self showMap:9];
    }
}
-(void)showResult{
     //categoryId/10
    if ([APAppDelegate appDelegate].idCity > 0) {
        // show data
        placeDataListViewController = [[APPlaceDataListViewController alloc] initWithNibName:@"APPlaceDataListViewController" bundle:nil];

        placeDataListViewController.city_id =[NSString stringWithFormat:@"%d",[APAppDelegate appDelegate].idCity];
        placeDataListViewController.catagoryId=@"10";
        placeDataListViewController.view.frame = self.view.frame;
        [self.view addSubview:placeDataListViewController.view];
    }else{
        // show map
        [self showMap:10];
    }
}
-(void)showMap:(NSInteger)categoryId{
    
    mapView = [[APPlaceMapViewController alloc] init];
    mapView.idcategory = categoryId;
    mapView.view.frame = self.view.frame;
    [self.view addSubview:mapView.view];
    
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
