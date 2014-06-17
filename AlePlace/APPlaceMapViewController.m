//
//  APPlaceMapViewController.m
//  AlePlace
//
//  Created by VinhPhuc on 6/10/14.
//
//

#import "APPlaceMapViewController.h"

#import "APCallAPI.h"
#import "APStadium.h"
#import "FMUtils.h"
#import "APPlaceDataListViewController.h"
#import "APAppDelegate.h"


@interface APPlaceMapViewController (){
    NSInteger page;
    NSMutableDictionary *dictionary;
    APStadium * stadium;
    APPlaceDataListViewController * dataView;
    
}
@end

@implementation APPlaceMapViewController
@synthesize mapData,idcategory;
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
    mapData =[[NSMutableArray alloc] init];
    [self callAPIGetStadium];
    
    
    markerImg=[FMUtils imageWithImage:[UIImage imageNamed:@"stadium_map"] scaledToSize:CGSizeMake(40, 40)];
    [[NSNotificationCenter defaultCenter]postNotificationName:kAleViewController object:self userInfo:@{kNameView:@"APPlaceMapViewController"}];
    // Do any additional setup after loading the view from its nib.
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(removeView) name:kRemoveMapViewController object:nil];
}
-(void)removeView{
    [self.view removeFromSuperview];
}

-(void)callAPIGetStadium{
    dictionary = [[NSMutableDictionary alloc] init];
    [dictionary setValue:@"json" forKey:@"format"];
    [dictionary setValue:[NSString stringWithFormat:@"%d",5] forKey:@"page"];
    [dictionary setValue:@"5d7299e5d3ea2698b9ef43527eae374e1ce439da" forKey:@"esapikey"];
    [APCallAPI getStadiums:^(NSArray *listEvent, NSObject *error) {
        mapData = [NSMutableArray arrayWithArray:listEvent];
        [self showMultiAnonation:mapData];
        
    } parameters:dictionary didFail:^(NSObject *error) {
    }];
    
}
-(void) showMultiAnonation:(NSMutableArray*) listData{
    stadium=[[APStadium alloc] init];

    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:0
                                                            longitude:0
                                                                 zoom:6];
    mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView.delegate = self;
    
    mapView.myLocationEnabled = YES;
    
    mapView.settings.compassButton = YES;
    mapView.settings.myLocationButton = YES;
    self.view=mapView;
    
    GMSCoordinateBounds *bounds = [[GMSCoordinateBounds alloc] init];
    
    for ( int i=0; i<[listData count]; i++)
    {
        stadium =[listData objectAtIndex:i];
        
        CLLocationCoordinate2D position = CLLocationCoordinate2DMake(stadium.latitude,stadium.longitude);
        CLLocationDegrees degrees = 0;
        GMSMarker *gmarker = [GMSMarker markerWithPosition:position];
        gmarker.appearAnimation=kGMSMarkerAnimationPop;
        gmarker.groundAnchor = CGPointMake(0.5, 0.5);
        bounds = [bounds includingCoordinate:gmarker.position];
        gmarker.icon=markerImg;
        gmarker.userData=stadium;
        gmarker.title=stadium.nameStadium;
        gmarker.snippet = stadium.city;
        gmarker.infoWindowAnchor = CGPointMake(0.4, 0.4);
        gmarker.rotation = degrees;
        gmarker.map = mapView;
        
        
    }
    [mapView animateWithCameraUpdate:[GMSCameraUpdate fitBounds:bounds withPadding:30.0f]];
    
}

-(void)mapView:(GMSMapView *)mapView
didTapInfoWindowOfMarker:(GMSMarker*)marker
{
    stadium=marker.userData;
    
    NSLog(@"MARKER..... %ld",(long)stadium.city_id);
    [APAppDelegate appDelegate].idCity = stadium.city_id;
    [APAppDelegate appDelegate].longt = stadium.longitude;
    [APAppDelegate appDelegate].lat = stadium.latitude;
    [APAppDelegate appDelegate].nameStadium = stadium.nameStadium;
    [APAppDelegate appDelegate].city = stadium.city;

     dataView = [[APPlaceDataListViewController alloc] initWithNibName:@"APPlaceDataListViewController" bundle:nil];
    dataView.city_id=[NSString stringWithFormat:@"%d",stadium.city_id ];
    dataView.catagoryId= [NSString stringWithFormat:@"%d",self.idcategory];
    dataView.view.frame = self.view.frame;
    self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self.view addSubview:dataView.view];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
