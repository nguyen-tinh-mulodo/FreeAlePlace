//
//  APStadium.m
//  AlePlace
//
//  Created by Apple on 6/8/14.
//
//

#import "APStadium.h"

@implementation APStadium
@synthesize stadiumID,nameStadium,address,descriptionStadium,latitude,longitude,capacity,thumb_photoStadium,photoStadium,album,media,country,country_id,city,city_id;

- (id)initWithAttributes:(NSDictionary *)attributes{
    self = [super init];
    if (!self) {
        return nil;
    }
    stadiumID = [[attributes valueForKeyPath:@"id"] integerValue];
    self.nameStadium = [attributes valueForKeyPath:@"name"];
    self.address = [attributes valueForKey:@"address"];
    self.descriptionStadium = [attributes valueForKeyPath:@"description"];
    self.thumb_photoStadium = [[attributes valueForKeyPath:@"main_photo"] valueForKeyPath:@"thumb_photo"];
    self.photoStadium = [[attributes valueForKeyPath:@"main_photo"] valueForKeyPath:@"photo"];
    self.album = [attributes valueForKey:@"album"];
    self.city = [attributes valueForKey:@"city"];
    self.media = [attributes valueForKey:@"media"];
    self.longitude = [[attributes valueForKey:@"longitude"] floatValue];
    self.latitude = [[attributes valueForKey:@"latitude"] floatValue];
    self.city_id = [[attributes valueForKey:@"city_id"] integerValue];
    self.country =  [attributes valueForKey:@"country"];
    self.capacity = [[attributes valueForKey:@"capacity"] integerValue];
    
    return self;
}
@end
