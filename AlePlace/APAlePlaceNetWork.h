//
//  APAlePlaceNetWork.h
//  AlePlace
//
//  Created by Apple on 6/5/14.
//
//

#import <UIKit/UIKit.h>
#import "AFHTTPClient.h"

@interface APAlePlaceNetWork : AFHTTPClient
+ (APAlePlaceNetWork *)sharedClient;
@end
