//
//  APAlePlaceNetWork.m
//  AlePlace
//
//  Created by Apple on 6/5/14.
//
//

#import "APAlePlaceNetWork.h"

@implementation APAlePlaceNetWork
+ (APAlePlaceNetWork *)sharedClient {
    
    static APAlePlaceNetWork *sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        sharedInstance = [[APAlePlaceNetWork alloc] initWithBaseURL:[NSURL URLWithString:@"http://cms.aleplace.com/ws/api/"]];
    });
    
    return sharedInstance;
}
@end
