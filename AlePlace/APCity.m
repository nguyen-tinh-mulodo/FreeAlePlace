//
//  APCity.m
//  AlePlace
//
//  Created by VinhPhuc on 6/9/14.
//
//

#import "APCity.h"

@implementation APCity
@synthesize id_city,cityName,latitude,longitude;

- (id)initWithAttributes:(NSDictionary *)attributes {
    self = [super init];
    if (!self) {
        return nil;
    }
    id_city = [[attributes valueForKeyPath:@"id"] integerValue];
    self.cityName = [attributes valueForKeyPath:@"city"];
    self.latitude = [[attributes valueForKeyPath:@"latitude"] floatValue];
    self.longitude = [[attributes valueForKeyPath:@"longitude"] floatValue];
    return self;
}


@end
