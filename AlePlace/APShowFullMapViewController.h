//
//  APShowFullMapViewController.h
//  AlePlace
//
//  Created by Apple on 6/8/14.
//
//

#import <UIKit/UIKit.h>
#import "APStadium.h"
#import "APPlace.h"
#import <CoreLocation/CoreLocation.h>
#import "LRouteController.h"

@interface APShowFullMapViewController : UIViewController
{
    LRouteController *_routeController;
    GMSPolyline *_polyline;
    NSMutableArray *_coordinates;
    
}
@property(nonatomic,weak) IBOutlet UILabel *distanceFromHere;

@property(nonatomic,strong) APStadium *stadium;
@property(nonatomic,strong) APPlace *place;
@property(nonatomic,retain) CLLocationManager *locationManager;
@property(readwrite)BOOL flgShowStadium;

@property(nonatomic,weak) IBOutlet UIButton *showLocation;
@property (nonatomic, strong) NSDictionary *geocode;


@end
