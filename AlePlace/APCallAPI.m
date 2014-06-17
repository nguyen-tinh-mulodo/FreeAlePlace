//
//  APCallAPI.m
//  AlePlace
//
//  Created by Apple on 6/5/14.
//
//

#import "APCallAPI.h"
#import "APAlePlaceNetWork.h"
#import "APEvent.h"
#import "APParserData.h"
#import "APStadium.h"

@implementation APCallAPI
+ (void)getEvents:(void (^)(NSArray *ListProduct, NSObject *error))block parameters:(NSDictionary *)parameters didFail:(void (^)(NSObject *))blockFail{
    [[APAlePlaceNetWork sharedClient] getPath:@"events/getData" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
    
        NSMutableArray *dictionary = [NSJSONSerialization JSONObjectWithData:responseObject  options: NSJSONReadingMutableContainers error:nil];
        NSMutableArray *mutableProducts =[[NSMutableArray alloc] initWithArray:[APParserData parseJSONtoArrayOfProduct:dictionary]];
        
        if (block) {
            block([NSArray arrayWithArray:mutableProducts], nil);
        }

       
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error:%@",error);
    }];
    
    
}
+ (void)getDetailEvent:(void (^)(NSArray *ListProduct, NSObject *error))block parameters:(NSDictionary *)parameters didFail:(void (^)(NSObject *))blockFail{
    [[APAlePlaceNetWork sharedClient] getPath:@"events/getDetail" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:responseObject  options: NSJSONReadingMutableContainers error:nil];
        NSMutableArray *mutableProducts =[[NSMutableArray alloc] initWithArray:[APParserData parseJSONtoArrayOfEventDetail:dictionary]];
        
        if (block) {
            block([NSArray arrayWithArray:mutableProducts], nil);
        }
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error:%@",error);
    }];
    
}
+ (void)getStadiums:(void (^)(NSArray *ListProduct, NSObject *error))block parameters:(NSDictionary *)parameters didFail:(void (^)(NSObject *))blockFail{
    [[APAlePlaceNetWork sharedClient] getPath:@"stadiums/getData" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSMutableArray *dictionary = [NSJSONSerialization JSONObjectWithData:responseObject  options: NSJSONReadingMutableContainers error:nil];
        NSMutableArray *mutableProducts =[[NSMutableArray alloc] initWithArray:[APParserData parseJSONtoArrayOfStadiums:dictionary]];
        
        if (block) {
            block([NSArray arrayWithArray:mutableProducts], nil);
        }
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error:%@",error);
    }];
    
}
+ (void)getStadiumData:(void (^)(NSArray *ListProduct, NSObject *error))block parameters:(NSDictionary *)parameters didFail:(void (^)(NSObject *))blockFail{
    [[APAlePlaceNetWork sharedClient] getPath:@"places/getDataBy" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSMutableArray *dictionary = [NSJSONSerialization JSONObjectWithData:responseObject  options: NSJSONReadingMutableContainers error:nil];
        NSMutableArray *mutableProducts =[[NSMutableArray alloc] initWithArray:[APParserData parseJSONtoArrayOfPlaceData:dictionary]];
        
        if (block) {
            block([NSArray arrayWithArray:mutableProducts], nil);
        }
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error:%@",error);
    }];
    
}
+ (void)getCountries:(void (^)(NSArray *ListProduct, NSObject *error))block parameters:(NSDictionary *)parameters didFail:(void (^)(NSObject *))blockFail{
    [[APAlePlaceNetWork sharedClient] getPath:@"countries/getData" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSMutableArray *dictionary = [NSJSONSerialization JSONObjectWithData:responseObject  options: NSJSONReadingMutableContainers error:nil];
        NSMutableArray *mutableProducts =[[NSMutableArray alloc] initWithArray:[APParserData parseJSONtoArrayOfCountries:dictionary]];
        
        if (block) {
            block([NSArray arrayWithArray:mutableProducts], nil);
        }
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error:%@",error);
    }];
    
}
+ (void)getCities:(void (^)(NSArray *ListProduct, NSObject *error))block parameters:(NSDictionary *)parameters didFail:(void (^)(NSObject *))blockFail{
    [[APAlePlaceNetWork sharedClient] getPath:@"cities/getDataByCountryId" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSMutableArray *dictionary = [NSJSONSerialization JSONObjectWithData:responseObject  options: NSJSONReadingMutableContainers error:nil];
        NSMutableArray *mutableProducts =[[NSMutableArray alloc] initWithArray:[APParserData parseJSONtoArrayOfCity:dictionary]];
        
        if (block) {
            block([NSArray arrayWithArray:mutableProducts], nil);
        }
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error:%@",error);
    }];
    
}

//places/getDataBy
@end
