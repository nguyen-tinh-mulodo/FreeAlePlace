//
//  APPlaceViewController.m
//  AlePlace
//
//  Created by Apple on 6/7/14.
//
//

#import "APPlaceViewController.h"
#import "APPlaceTableViewCell.h"
#import "APPlaceMapViewController.h"
#import "APPlaceDataListViewController.h"
#import "APAppDelegate.h"
#import "GADBannerView.h"
#import "FMUtils.h"
@interface APPlaceViewController ()
{
    APPlaceMapViewController *mapView;
    APPlaceDataListViewController *placeDataListViewController;
    GADBannerView *bannerView ;
}
@end

@implementation APPlaceViewController
@synthesize tableViewPlace;
APPlaceMapViewController *mapView;
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
    [self.tableViewPlace setEditing:NO];
    [self.tableViewPlace setAllowsSelection:NO];
    [[NSNotificationCenter defaultCenter]postNotificationName:kAleViewController object:self userInfo:@{kNameView:@"APPlaceViewController"}];
    NSString *title = titleHome;
    [[NSNotificationCenter defaultCenter]postNotificationName:editTitle object:self userInfo:@{editTitle: title}];
    [self showbannerAdmod];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    if (indexPath.row < 3) {
        static NSString *CellIdentifier = @"APAleViewCellBt";
        APPlaceTableViewCell *cell = nil;
        cell = (APPlaceTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            // cell = [[APEventTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"APPlaceTableViewCell" owner:self options:nil];
            // Grab a pointer to the first object (presumably the custom cell, as that's all the XIB should contain).
            cell = [topLevelObjects objectAtIndex:0];
            cell.delegate = self;
        }
        cell.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        if (indexPath.row == 0) {
            cell.bt1.tag = 100;
            cell.bt2.tag = 200;
            [cell.bt1 setImage:[UIImage imageNamed:@"eat.png"] forState:UIControlStateNormal];
            [cell.bt2 setImage:[UIImage imageNamed:@"do.png"] forState:UIControlStateNormal];
        }
        if (indexPath.row == 1) {
            cell.bt1.tag = 300;
            cell.bt2.tag = 400;
            [cell.bt1 setImage:[UIImage imageNamed:@"see.png"] forState:UIControlStateNormal];
            [cell.bt2 setImage:[UIImage imageNamed:@"restaurant.jpg"] forState:UIControlStateNormal];
        }
        if (indexPath.row == 2) {
            cell.bt1.tag = 500;
            cell.bt2.tag = 600;
            [cell.bt1 setImage:[UIImage imageNamed:@"tour.png"] forState:UIControlStateNormal];
            [cell.bt2 setImage:[UIImage imageNamed:@"shopping.jpg"] forState:UIControlStateNormal];
        }
        return cell;
    }else{
        static NSString *CellIdentifier = @"APAleViewCellBt";
        APPlaceTableViewCell *cell = nil;
        cell = (APPlaceTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            // cell = [[APEventTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"APPlaceTableViewCell" owner:self options:nil];
            // Grab a pointer to the first object (presumably the custom cell, as that's all the XIB should contain).
            cell = [topLevelObjects objectAtIndex:0];
            cell.delegate = self;
        }
        cell.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        return cell;
    }

    
    
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 3) {
        return 50;
    }
    return 150;
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
-(void)shopping{
    //categoryId/1
        
        
        [self showDataListView:@"1"];
   
    
}

- (void)eat{
    //categoryId/2
        // show data
        [self showDataListView:@"2"];
    
}
- (void)do_do{

        [self showDataListView:@"5"];

}
-(void)see{
        [self showDataListView:@"6"];



}
-(void)restaurant{
     //categoryId/7
        [self showDataListView:@"7"];

  

}
-(void)tour{
     //categoryId/8
        [self showDataListView:@"8"];

   

}


-(void) showDataListView:(NSString *) catagory
{
    if ([APAppDelegate appDelegate].idCity > 0) {
    placeDataListViewController = [[APPlaceDataListViewController alloc] initWithNibName:@"APPlaceDataListViewController" bundle:nil];
    placeDataListViewController.city_id =[NSString stringWithFormat:@"%d",[APAppDelegate appDelegate].idCity];
    placeDataListViewController.catagoryId=catagory;
    placeDataListViewController.view.frame = self.view.frame;

 
    [self.view addSubview:placeDataListViewController.view];
      }
    else
    {
        [self showMap:[catagory intValue]];

    }

}
-(void)showMap:(NSInteger)categoryId{

    mapView = [[APPlaceMapViewController alloc] init];
    mapView.idcategory = categoryId;
    mapView.view.frame = self.view.frame;
    [self.view addSubview:mapView.view];
/*
    dataView = [[APPlaceDataListTableViewController alloc] initWithNibName:@"APPlaceDataListTableViewController" bundle:nil];
        [self.view addSubview:dataView.view];
    */
    /*APPlaceDataListTableViewController *dataView = [[APPlaceDataListTableViewController alloc] initWithNibName:@"APPlaceDataListTableViewController" bundle:nil];
    dataView.view.frame = self.view.frame;
    [self.view addSubview:dataView.view];*/
    
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
