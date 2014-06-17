//
//  APParserData.m
//  AlePlace
//
//  Created by Apple on 6/5/14.
//
//

#import "APParserData.h"
#import "APEvent.h"
#import "APStadium.h"
#import "APCity.h"
#import "APCountry.h"
#import "APPlace.h"
@implementation APParserData
+ (NSArray *)parseJSONtoArrayOfProduct:(id)responseObject {
    //NSArray *postsFromResponse =[[responseObject objectForKey:@"xml"] objectForKey:@"item"];
    NSMutableArray *mutableProducts = [NSMutableArray arrayWithCapacity:[responseObject count]];
    for (NSDictionary *attributes in responseObject) {
        APEvent *event = [[APEvent alloc] initWithAttributes:attributes];
        [mutableProducts addObject:event];
    }
    return mutableProducts;
}
+ (NSArray *)parseJSONtoArrayOfStadiums:(id)responseObject {

    NSMutableArray *mutableProducts = [NSMutableArray arrayWithCapacity:[responseObject count]];
    for (NSDictionary *attributes in responseObject) {
        APStadium *stadium = [[APStadium alloc] initWithAttributes:attributes];
        [mutableProducts addObject:stadium];
    }
    return mutableProducts;
}
+ (NSArray *)parseJSONtoArrayOfPlaceData:(id)responseObject {
    
    NSMutableArray *mutableProducts = [NSMutableArray arrayWithCapacity:[responseObject count]];
    for (NSDictionary *attributes in [responseObject objectForKey:@"data"]) {
        APPlace *place = [[APPlace alloc] initWithAttributes:attributes];
        [mutableProducts addObject:place];
    }
    return mutableProducts;
}
+ (NSArray *)parseJSONtoArrayOfEventDetail:(id)responseObject {
    //NSArray *postsFromResponse =[[responseObject objectForKey:@"xml"] objectForKey:@"item"];
    NSMutableArray *mutableProducts = [[NSMutableArray alloc] init];
        APEvent *event = [[APEvent alloc] initWithAttributes:responseObject];
        [mutableProducts addObject:event];
    return mutableProducts;
} 
+ (NSArray *)parseJSONtoArrayOfCountries:(id)responseObject { // chua parse nha
    //NSArray *postsFromResponse =[[responseObject objectForKey:@"xml"] objectForKey:@"item"];
 NSMutableArray *mutableProducts = [[NSMutableArray alloc] init];
 APEvent *event = [[APEvent alloc] initWithAttributes:responseObject];
 [mutableProducts addObject:event];
    return mutableProducts;
}
+ (NSArray *)parseJSONtoArrayOfCity:(id)responseObject {
    //NSArray *postsFromResponse =[[responseObject objectForKey:@"xml"] objectForKey:@"item"];
    NSMutableArray *mutableProducts = [NSMutableArray arrayWithCapacity:[responseObject count]];
    for (NSDictionary *attributes in responseObject) {
        APCity *city = [[APCity alloc] initWithAttributes:attributes];
    [mutableProducts addObject:city];
    }
    return mutableProducts;
}
@end
