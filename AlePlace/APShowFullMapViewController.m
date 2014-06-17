//
//  APShowFullMapViewController.m
//  AlePlace
//
//  Created by Apple on 6/8/14.
//
//

#import "APShowFullMapViewController.h"
#import <GoogleMaps/GoogleMaps.h>
#import "FMConstants.h"
#import "FMUtils.h"
#import "APAppDelegate.h"

@interface APShowFullMapViewController ()
{
    GMSMapView *mapView_ ;
}
@end

@implementation APShowFullMapViewController
@synthesize stadium,place,locationManager,distanceFromHere,showLocation,flgShowStadium,geocode;
UIImage *markerImg;
float lat,longt;
GMSCoordinateBounds *bounds;
NSString * _titlestr;
NSString *_snip;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    
    
    place =[[APPlace alloc] init];
    stadium=[[APStadium alloc] init];
    locationManager = [[CLLocationManager alloc] init];
    locationManager.distanceFilter = kCLDistanceFilterNone;
    locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters; // 100 m
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    //    geocode = [[NSDictionary alloc]initWithObjectsAndKeys:@"0.0",@"lat",@"0.0",@"lng",@"Null Island",@"address",nil];
    //
    //    [self geocodeAddress:@"Island" withCallback:@selector(loadData) withDelegate:self];
    
    [[NSNotificationCenter defaultCenter]postNotificationName:kAleViewController object:self userInfo:@{kNameView:@"APShowFullMapViewController"}];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(removeView) name:kRemoveAPShowFullMapViewController object:nil];
    [self loadData];
    
}
// get current location

- (NSString *)deviceLocation {
    NSString *theLocation = [NSString stringWithFormat:@"latitude: %f longitude: %f", locationManager.location.coordinate.latitude, locationManager.location.coordinate.longitude];
    return theLocation;
    
}


-(void)loadData{
    _coordinates = [NSMutableArray new];
    _routeController = [LRouteController new];
    CGSize markerSize=CGSizeMake(40, 50);
    CGSize markerSizeStadium=CGSizeMake(50, 50);
    if (flgShowStadium) {
        if(stadium.latitude)
        {
            lat=stadium.latitude;
            longt=stadium.longitude;
            _titlestr = stadium.nameStadium;
            _snip = stadium.city;
            
            markerImg=[FMUtils imageWithImage:[UIImage imageNamed:@"stadium_map"] scaledToSize:markerSizeStadium];
            
        }
        
        [CATransaction begin];
        [CATransaction setAnimationDuration:2.0];
        GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:lat
                                                                longitude:longt
                                                                     zoom:5];
        bounds = [[GMSCoordinateBounds alloc] init];
        mapView_ = [GMSMapView mapWithFrame:self.view.frame camera:camera];
        mapView_.myLocationEnabled = YES;
        mapView_.settings.myLocationButton = YES;
        mapView_.settings.compassButton = YES;
        //[self.locationManager startUpdatingLocation];
        
        self.view = mapView_;
        
        // Place marker
        
        GMSMarker *marker = [[GMSMarker alloc] init];
        
        marker.position = CLLocationCoordinate2DMake(lat, longt);
        marker.title = _titlestr;
        marker.snippet = _snip;
        marker.icon=markerImg;
        marker.appearAnimation = kGMSMarkerAnimationPop;
        
        
        bounds = [bounds includingCoordinate:marker.position];
        
        marker.map = mapView_;
        
        [mapView_ animateWithCameraUpdate:[GMSCameraUpdate fitBounds:bounds withPadding:60.0f]];
        
        GMSCameraUpdate *update = [GMSCameraUpdate fitBounds:bounds];
        [mapView_ moveCamera:update];
        [CATransaction commit];
        
        [mapView_ addSubview:distanceFromHere];
        distanceFromHere.text=[NSString stringWithFormat:@"Distance from here : %d m",1];
        
        [self.view addSubview:showLocation];
    }else{
        if(place.latitude)
        {
            lat=place.latitude;
            longt=place.longitude;
            _titlestr = place.nameplace;
            _snip = place.city;
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
            
        }
        else
        {
            
            
            
            lat=stadium.latitude;
            longt=stadium.longitude;
            _titlestr = stadium.nameStadium;
            _snip = stadium.city;
        }
        if(lat==0 && longt==0) // set default location for place incase have no data
        {
            
            
            lat=-15.7834997;
            longt=-47.8991013;
           // markerImg=[FMUtils imageWithImage:[UIImage imageNamed:@"stadium_map"] scaledToSize:markerSizeStadium];
        }
        [CATransaction begin];
        [CATransaction setAnimationDuration:2.0];
        GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:lat
                                                                longitude:longt
                                                                     zoom:5];
        bounds = [[GMSCoordinateBounds alloc] init];
        mapView_ = [GMSMapView mapWithFrame:self.view.frame camera:camera];
        mapView_.myLocationEnabled = YES;
        mapView_.settings.myLocationButton = YES;
        mapView_.settings.compassButton = YES;
        //[self.locationManager startUpdatingLocation];
        
        self.view = mapView_;
        
        // Place marker
        
        GMSMarker *marker = [[GMSMarker alloc] init];
        
        marker.position = CLLocationCoordinate2DMake(lat, longt);
        marker.title = _titlestr;
        marker.snippet = _snip;
        marker.icon=markerImg;
        marker.appearAnimation = kGMSMarkerAnimationPop;
        
        
        bounds = [bounds includingCoordinate:marker.position];
        
        marker.map = mapView_;
        
        
        // stadium marker
        
        
        GMSMarker *myMarker = [[GMSMarker alloc] init];
        myMarker.position = CLLocationCoordinate2DMake([APAppDelegate appDelegate].lat,[APAppDelegate appDelegate].longt);
        markerImg=[FMUtils imageWithImage:[UIImage imageNamed:@"stadium_map"] scaledToSize:markerSizeStadium];
        myMarker.title = [APAppDelegate appDelegate].nameStadium;
        myMarker.snippet = [APAppDelegate appDelegate].city;
        myMarker.icon=markerImg;
        myMarker.appearAnimation = kGMSMarkerAnimationPop;
        
        
        myMarker.map = mapView_;
        bounds = [bounds includingCoordinate:myMarker.position];
        
        [mapView_ animateWithCameraUpdate:[GMSCameraUpdate fitBounds:bounds withPadding:20.0f]];
        CLLocation* stadiumLocation =
        [[CLLocation alloc]
         initWithLatitude: [APAppDelegate appDelegate].lat
         longitude: [APAppDelegate appDelegate].longt];
        [_coordinates addObject:[[CLLocation alloc] initWithLatitude:lat longitude:longt]];
        
        [_coordinates addObject:[[CLLocation alloc] initWithLatitude:[APAppDelegate appDelegate].lat longitude:[APAppDelegate appDelegate].longt]];
        _polyline.map = nil;
        
        [_routeController getPolylineWithLocations:_coordinates travelMode:TravelModeWalking andCompletitionBlock:^(GMSPolyline *polyline, NSError *error) {
            _polyline.strokeWidth = 4;
            _polyline.strokeColor = [UIColor redColor];
            
            polyline.map = mapView_;
            
            GMSCameraUpdate *update = [GMSCameraUpdate fitBounds:bounds withPadding:35.0f];
            [mapView_ moveCamera:update];
            [CATransaction commit];
            CLLocation* location2 =
            [[CLLocation alloc]
             initWithLatitude: lat
             longitude: longt];
            
            double distance=[stadiumLocation distanceFromLocation: location2]/1000;
            int roundedDistance = lroundf(distance);
            
            [mapView_ addSubview:distanceFromHere];
            distanceFromHere.text=[NSString stringWithFormat:@"Distance from here : %d km",roundedDistance];
            
            [self.view addSubview:showLocation];
            [mapView_ animateToViewingAngle:50];
        }];
        /*GMSMutablePath *path = [GMSMutablePath path];
         [path addCoordinate:CLLocationCoordinate2DMake([APAppDelegate appDelegate].lat,[APAppDelegate appDelegate].longt)];
         [path addCoordinate:CLLocationCoordinate2DMake(lat, longt)];
         
         GMSPolyline *rectangle = [GMSPolyline polylineWithPath:path];
         rectangle.strokeWidth = 2.f;
         rectangle.map = mapView_;
         bounds = [[GMSCoordinateBounds alloc] initWithPath:path];
         //There are several useful init methods for the GMSCoordinateBounds!
         */
        
    }
    
}
-(void)removeView{
    [self.view removeFromSuperview];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)showLocation:(id)sender
{
    [CATransaction begin];
    [CATransaction setAnimationDuration:1.0];
    [mapView_ animateWithCameraUpdate:[GMSCameraUpdate fitBounds:bounds withPadding:60.0f]];
    [CATransaction commit];
    
}

- (void)geocodeAddress:(NSString *)address withCallback:(SEL)sel withDelegate:(id)delegate {
    
    
    NSString *geocodingBaseUrl = @"http://maps.googleapis.com/maps/api/geocode/json?";
    NSString *url = [NSString stringWithFormat:@"%@address=%@&sensor=false", geocodingBaseUrl,address];
    url = [url stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
    
    NSURL *queryUrl = [NSURL URLWithString:url];
    dispatch_async(dispatch_get_main_queue(), ^{
        NSData *data = [NSData dataWithContentsOfURL: queryUrl];
        
        [self fetchedData:data withCallback:sel withDelegate:delegate];
        
    });
    
}
- (void)fetchedData:(NSData *)data withCallback:(SEL)sel withDelegate:(id)delegate{
    
    NSError* error;
    NSDictionary *json = [NSJSONSerialization
                          JSONObjectWithData:data
                          options:kNilOptions
                          error:&error];
    
    NSArray* results = [json objectForKey:@"results"];
    NSDictionary *result = [results objectAtIndex:0];
    NSString *address = [result objectForKey:@"formatted_address"];
    NSDictionary *geometry = [result objectForKey:@"geometry"];
    NSDictionary *location = [geometry objectForKey:@"location"];
    NSString *lat = [location objectForKey:@"lat"];
    NSString *lng = [location objectForKey:@"lng"];
    
    NSDictionary *gc = [[NSDictionary alloc]initWithObjectsAndKeys:lat,@"lat",lng,@"lng",address,@"address",nil];
    
    geocode = gc;
    [delegate performSelector:sel];
}



@end
