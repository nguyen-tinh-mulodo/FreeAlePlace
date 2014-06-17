#import <Foundation/Foundation.h>
#import <GoogleMaps/GoogleMaps.h>
//#import "ASIHTTPRequest.h"
#import "AFNetworking/AFNetworking.h"

typedef enum tagTravelMode
{
    TravelModeDriving,
    TravelModeBicycling,
    TravelModeTransit,
    TravelModeWalking
}TravelMode;


@interface LRouteController : NSObject
{
    NSURLRequest *_request;
}


- (void)getPolylineWithLocations:(NSArray *)locations travelMode:(TravelMode)travelMode andCompletitionBlock:(void (^)(GMSPolyline *polyline, NSError *error))completitionBlock;
- (void)getPolylineWithLocations:(NSArray *)locations andCompletitionBlock:(void (^)(GMSPolyline *polyline, NSError *error))completitionBlock;


@end