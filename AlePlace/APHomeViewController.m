//
//  APHomeViewController.m
//  AlePlace
//
//  Created by Apple on 6/5/14.
//
//

#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0) //1
#define kLatestKivaLoansURL [NSURL URLWithString: @"http://cms.aleplace.com/ws/api/events/getData?esapikey=5d7299e5d3ea2698b9ef43527eae374e1ce439da&format=json"]
#import "APHomeViewController.h"
#import "APCallAPI.h"
#import "APParserData.h"
#import "APEvent.h"
#import "APEventTableViewCell.h"
#import "UIImageView+AFNetworking.h"
#import "APDetailEventViewController.h"
#import "FMConstants.h"
#import "APMoreViewController.h"
#import "FMUtils.h"
#import "APEventCellTableViewCell.h"
#import "APHeader.h"
#import "GADBannerView.h"
#import "GADRequest.h"
#import "FMUtils.h"
@interface UIView (ARES)

- (void)roundCornerShadowAndBorder;

@end

@implementation UIView (ARES)

- (void)roundCornerShadowAndBorder {
    
    [self.layer setMasksToBounds:YES];
    
    [self.layer setBorderColor:[[UIColor darkTextColor] CGColor]];
    [self.layer setBorderWidth:1.0f];
    if(YES)
    {
        [self.layer setShadowColor:[[UIColor darkTextColor] CGColor]];
        [self.layer setShadowOffset:CGSizeMake(0, 0)];
        [self.layer setShadowOpacity:1];
        [self.layer setShadowRadius:2.0];
    }
}

@end
@interface APHomeViewController ()
{
    NSMutableArray *listEvents;
    BOOL flagMore;
    APHeader *view;
    GADBannerView *bannerView;
    GADRequest *requestAdmod;
}
@end

@implementation APHomeViewController
@synthesize tableViewEvent,imageViewStart,imageViewRound,titleHeader;
@synthesize customCell = _customCell;
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
    flagMore = FALSE;
    imageViewStart.hidden = YES;
    imageViewRound.hidden = YES;
    listEvents = [[NSMutableArray alloc] init];
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7)
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.navigationController.navigationBar.translucent = NO;
    }
    [self callAPIGetEvents];
    [self.tableViewEvent setSeparatorStyle:UITableViewCellSeparatorStyleNone];
//    dispatch_async(kBgQueue, ^{
//        NSData* data = [NSData dataWithContentsOfURL: kLatestKivaLoansURL];
//        [self performSelectorOnMainThread:@selector(fetchedData:) withObject:data waitUntilDone:YES];
//    });
//    
    // Do any additional setup after loading the view from its nib.
    [self.tableViewEvent registerNib:[UINib nibWithNibName:@"APEventTableViewCell" bundle:nil] forCellReuseIdentifier:@"APEventTableViewCell"];
    [self.tableViewEvent registerNib:[UINib nibWithNibName:@"APEventCellTableViewCell" bundle:nil] forCellReuseIdentifier:@"APEventCellTableViewCell"];
    
    self.tableViewEvent.scrollEnabled = NO;
    
    
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"testView" owner:self options:nil];
     view = [[APHeader alloc] init]; // or if it exists, MCQView *view = [[MCQView alloc] init];
     view = (APHeader *)[nib objectAtIndex:0]; // or if it exists, (MCQView *)[nib objectAtIndex:0];
    titleHeader = [[UILabel alloc] initWithFrame:CGRectMake(60, 0, self.view.frame.size.width -120, 40)];
    titleHeader.text = titleHome;
    titleHeader.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    titleHeader.textColor = [UIColor whiteColor];
    titleHeader.textAlignment = NSTextAlignmentCenter;
    [titleHeader setBackgroundColor:[UIColor clearColor]];
    [view addSubview:titleHeader];
     [self.navigationController.navigationBar addSubview:view];
      [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(setTextLable:) name:editTitle object:nil];
    [self showbannerAdmod];
}

-(void)callAPIGetEvents{
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    [dictionary setValue:@"json" forKey:@"format"];
    [dictionary setValue:@"5d7299e5d3ea2698b9ef43527eae374e1ce439da" forKey:@"esapikey"];
    [APCallAPI getEvents:^(NSArray *listEvent, NSObject *error) {
        listEvents = [NSMutableArray arrayWithArray:listEvent];
        [self.tableViewEvent reloadData];
        imageViewStart.hidden = NO;
        imageViewRound.hidden = NO;
    } parameters:dictionary didFail:^(NSObject *error) {
    }];
    
}
- (void)fetchedData:(NSData *)responseData {
    //parse out the json data
    NSError* error;
    NSDictionary* json = [NSJSONSerialization JSONObjectWithData:responseData //1
                                                         options:kNilOptions
                                                           error:&error];
    [APParserData parseJSONtoArrayOfProduct:json];
   
    
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

    return [listEvents count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        static NSString *CellIdentifier = @"APEventTableViewCell";
        //    APEventTableViewCell *cell = nil;
        APEventTableViewCell *cell = (APEventTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if(cell == nil)
        {
            cell = [[APEventTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            
            [[NSBundle mainBundle] loadNibNamed:@"APEventTableViewCell" owner:self options:nil];
            
        }
        APEvent *event = [listEvents objectAtIndex:indexPath.row];
        cell.nameEvent.text = event.nameEvent;
        cell.dateEvent.text = [NSString stringWithFormat:@"%@-%@",[FMUtils timeToDate:event.start_dateEvent],[FMUtils timeToDate:event.end_dateEvent]];
        [cell.imageEvent setImageWithURL:[NSURL URLWithString:event.thumb_photoEvent] placeholderImage:[UIImage imageNamed:@"placeholder"]];
        return cell;
    }else{
        static NSString *CellIdentifier = @"APEventCellTableViewCell";
        //    APEventTableViewCell *cell = nil;
        APEventCellTableViewCell *cell = (APEventCellTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if(cell == nil)
        {
            cell = [[APEventCellTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            
            [[NSBundle mainBundle] loadNibNamed:@"APEventCellTableViewCell" owner:self options:nil];
            
        }
        APEvent *event = [listEvents objectAtIndex:indexPath.row];
        cell.nameEvent.text = event.nameEvent;
        cell.dateEvent.text = [NSString stringWithFormat:@"%@-%@",[FMUtils timeToDate:event.start_dateEvent],[FMUtils timeToDate:event.end_dateEvent]];
        [cell.imageEvent setImageWithURL:[NSURL URLWithString:event.thumb_photoEvent] placeholderImage:[UIImage imageNamed:@"placeholder"]];
        
        return cell;

    }
    //    if (cell == nil) {
//       // cell = [[APEventTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
//        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"APEventTableViewCell" owner:self options:nil];
//        // Grab a pointer to the first object (presumably the custom cell, as that's all the XIB should contain).
//        /*for( id obj in topLevelObjects ) {
//            if( [obj isMemberOfClass:[APEventTableViewCell class] ]  || [obj isKindOfClass:[APEventTableViewCell class]] ) {
//                cell = obj;
//            }
//        }*/
//       
//
//        APEventTableViewCell* temp = [topLevelObjects objectAtIndex:0];
//        
//       
//        cell =temp;
//    }
}


//- (void)handleGesture:(UIGestureRecognizer *)gestureRecognizer {
//    // get the imageView that was tapped
//    UIImageView *imageView = gestureRecognizer.view;
//    imageView.image = [UIImage imageNamed:NSLocalizedString(@"button_continue",@"")];
//    // do something else
//}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    APEvent *event = [listEvents objectAtIndex:indexPath.row];
    APDetailEventViewController *detailEventViewController = [[APDetailEventViewController alloc] initWithNibName:@"APDetailEventViewController" bundle:nil];
    detailEventViewController.idEvent = event.eventID;
    [self.navigationController pushViewController:detailEventViewController animated:NO];
}

- (IBAction)backBtnClick:(id)sender {
    if (flagMore) {
        flagMore = FALSE;
        [[NSNotificationCenter defaultCenter]postNotificationName:kRevovemore object:self];
    }else{
        [[NSNotificationCenter defaultCenter]postNotificationName:ktest object:self userInfo:@{kNameView:@"APStadiumViewController"}];
    }
}
- (IBAction)more:(id)sender{
    if (!flagMore) {
        flagMore = TRUE;
        APMoreViewController *moreView = [[APMoreViewController alloc] initWithNibName:@"APMoreViewController" bundle:nil];
        [self.navigationController pushViewController:moreView animated:NO];
    }
}


-(void)setTextLable:(NSNotification *)notification{
    self.titleHeader.text = [notification.userInfo objectForKey:editTitle] ;
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
        NSLog(@"%f",self.view.frame.size.height);
        if ([FMUtils isIPhone5]) {
            bannerView.frame = CGRectMake(0,self.view.frame.size.height - 12 - 2*kHeightWhenAdmod,bannerView.frame.size.width, bannerView.frame.size.height);
        }else{
            bannerView.frame = CGRectMake(0,self.view.frame.size.height  - 4*kHeightWhenAdmod,bannerView.frame.size.width, bannerView.frame.size.height);
        }
        // Let the runtime know which UIViewController to restore after taking
        // the user wherever the ad goes and add it to the view hierarchy.
        bannerView.rootViewController = self;
        bannerView.delegate = self;
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
