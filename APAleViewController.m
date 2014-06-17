//
//  APAleViewController.m
//  AlePlace
//
//  Created by Apple on 6/6/14.
//
//

#import "APAleViewController.h"
#import "FMUtils.h"
#import "APAleViewCell.h"
#import "APAleViewCellBt.h"
#import "APStadiumViewController.h"
#import "APAppDelegate.h"
#import "UIImageView+AFNetworking.h"
#import "FMConstants.h"
#import "APTeamViewController.h"
#import "APEcheduleViewController.h"
#import "APResultViewController.h"
#import "GADBannerView.h"

@interface APAleViewController ()
{
    APStadiumViewController *stadiumViewController;
    APTeamViewController *teamViewController;
    APEcheduleViewController *echeduleViewController;
    APResultViewController  *resultViewController;
     GADBannerView *bannerView;
    
}
@end

@implementation APAleViewController
@synthesize stadiumBt,teamBt,resultBt,scheduleBt,bannerAle,aleScroll,event;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        NSLog(@"%f,%f",self.view.frame.size.width,self.view.frame.size.height);
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [bannerAle setImageWithURL:[NSURL URLWithString:event.photoEvent] placeholderImage:[UIImage imageNamed:@"placeholder"]];
    [self.aleScroll setAllowsSelection:NO];
    [[NSNotificationCenter defaultCenter]postNotificationName:kAleViewController object:self userInfo:@{kNameView:@"APAleViewController"}];
    NSString *title = titleHome;
    [[NSNotificationCenter defaultCenter]postNotificationName:editTitle object:self userInfo:@{editTitle: title}];
   // Do any additional setup after loading the view from its nib.
    [self showbannerAdmod];
}
-(void)viewWillAppear:(BOOL)animated{
    
}
-(void)layout{
    [self.aleScroll reloadData];
    [self.aleScroll setAllowsSelection:NO];
    /*self.view.backgroundColor = [UIColor yellowColor];
    CGRect rect = [[UIScreen mainScreen] bounds];
    self.aleScroll.frame = CGRectMake(0, 50, self.view.frame.size.width, self.view.frame.size.height-50);
    [self.aleScroll setContentSize:CGSizeMake(self.view.frame.size.width, rect.size.height+50)];
    
    bannerAle.frame = CGRectMake(20, 10, self.view.frame.size.width-40, 100);
    stadiumBt.frame = CGRectMake(20, CGRectGetMaxY(bannerAle.frame), self.view.frame.size.width/2 -20, self.view.frame.size.width/2 -30);
    teamBt.frame = CGRectMake(CGRectGetMaxX(stadiumBt.frame)+20, CGRectGetMaxY(bannerAle.frame), self.view.frame.size.width/2 -30, self.view.frame.size.width/2 -30);
    scheduleBt.frame = CGRectMake(20, CGRectGetMaxY(stadiumBt.frame), self.view.frame.size.width/2 -30, self.view.frame.size.width/2 -30);
    resultBt.frame = CGRectMake(CGRectGetMaxX(scheduleBt.frame)+20, CGRectGetMaxY(teamBt.frame), self.view.frame.size.width/2 -30, self.view.frame.size.width/2 -30);
     */
    

}
-(void)layout:(float)width h:(float)h{
    /*self.view.backgroundColor = [UIColor yellowColor];
    self.aleScroll.frame = CGRectMake(0, 50,width,h-50);
    [self.aleScroll setContentSize:CGSizeMake(width,h+50)];
    
    bannerAle.frame = CGRectMake(20, 10,width-40, 100);
    stadiumBt.frame = CGRectMake(20, CGRectGetMaxY(bannerAle.frame), width/2 -20, self.view.frame.size.width/2 -30);
    teamBt.frame = CGRectMake(CGRectGetMaxX(stadiumBt.frame)+20, CGRectGetMaxY(bannerAle.frame), width/2 -30,width/2 -30);
    scheduleBt.frame = CGRectMake(20, CGRectGetMaxY(stadiumBt.frame), width/2 -30, width/2 -30);
    resultBt.frame = CGRectMake(CGRectGetMaxX(scheduleBt.frame)+20, CGRectGetMaxY(teamBt.frame), width/2 -30, width/2 -30);*/
    
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)stadiumAc:(id)sender{
    
}
-(IBAction)teamBt:(id)sender{
    
}
-(IBAction)scheduleBt:(id)sender{
    
}
-(IBAction)resultBt:(id)sender{
    
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
        cell.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        [cell.banner setImageWithURL:[NSURL URLWithString:event.photoEvent] placeholderImage:[UIImage imageNamed:@"placeholder"]];
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
            //[cell.stadiumBt setImage:[UIImage imageNamed:@"Ale_01_11.png"] forState:UIControlStateNormal];
            [cell.stadiumBt setBackgroundImage:[UIImage imageNamed:@"Ale_01_11.png"] forState:UIControlStateNormal];
            [cell.stadiumBt.imageView setContentMode:UIViewContentModeScaleAspectFill];
            //[cell.teamBt setImage:[UIImage imageNamed:@"Ale_01_12.png"] forState:UIControlStateNormal];
            [cell.teamBt setBackgroundImage:[UIImage imageNamed:@"Ale_01_12.png"] forState:UIControlStateNormal];
            [cell.teamBt.imageView setContentMode:UIViewContentModeScaleAspectFill];
        }
        if (indexPath.row == 2) {
            cell.stadiumBt.tag = 300;
            cell.teamBt.tag = 400;
            //[cell.stadiumBt setImage:[UIImage imageNamed:@"Ale_01_14.png"] forState:UIControlStateNormal];
            [cell.stadiumBt setBackgroundImage:[UIImage imageNamed:@"Ale_01_14.png"] forState:UIControlStateNormal];
            [cell.stadiumBt setContentMode:UIViewContentModeScaleAspectFill];
            //[cell.teamBt setImage:[UIImage imageNamed:@"Ale_01_15.png"] forState:UIControlStateNormal];
            [cell.teamBt setBackgroundImage:[UIImage imageNamed:@"Ale_01_15.png"] forState:UIControlStateNormal];
            [cell.teamBt.imageView setContentMode:UIViewContentModeScaleAspectFill];
        }
        if (indexPath.row == 3) {
            
        }
        return cell;
    }
    
    
}


//- (void)handleGesture:(UIGestureRecognizer *)gestureRecognizer {
//    // get the imageView that was tapped
//    UIImageView *imageView = gestureRecognizer.view;
//    imageView.image = [UIImage imageNamed:NSLocalizedString(@"button_continue",@"")];
//    // do something else
//}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 3) {
        return 50;
    }
    return 150;
}
#pragma APAleViewCellBtDelegate
- (void)showStadium{
    stadiumViewController = [[APStadiumViewController alloc] initWithNibName:@"APStadiumViewController" bundle:nil];
    stadiumViewController.view.frame = CGRectMake(0, stadiumViewController.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height);
    //stadiumViewController.tableStadium.frame = CGRectMake(0, 0, 10, 300);
    //[[APAppDelegate appDelegate].navigation pushViewController:stadiumViewController animated:NO];
    //[self addChildViewController:stadiumViewController];
    [self.view addSubview:stadiumViewController.view];
    
}
- (void)showTerm{
    teamViewController = [[APTeamViewController alloc] initWithNibName:@"APTeamViewController" bundle:nil];
    teamViewController.team = event.team;
    teamViewController.view.frame = CGRectMake(0, teamViewController.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height);
    //[[APAppDelegate appDelegate].navigation pushViewController:stadiumViewController animated:NO];
    //[self addChildViewController:stadiumViewController];
    [self.view addSubview:teamViewController.view];
    
}
-(void)showSchedule{
    echeduleViewController = [[APEcheduleViewController alloc] initWithNibName:@"APEcheduleViewController" bundle:nil];
     echeduleViewController.echedule = event.schedule;
    echeduleViewController.view.frame = CGRectMake(0, echeduleViewController.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height);
    
    [self.view addSubview:echeduleViewController.view];
    
}
-(void)showResult{
    resultViewController  = [[APResultViewController alloc] initWithNibName:@"APResultViewController" bundle:nil];
    resultViewController.result = event.result;
    resultViewController.view.frame = CGRectMake(0, resultViewController.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height);
    
    [self.view addSubview:resultViewController.view];
    
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
