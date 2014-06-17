//
//  APPlace.m
//  AlePlace
//
//  Created by VinhPhuc on 6/11/14.
//
//

#import "APPlace.h"

@implementation APPlace

@synthesize address,album,city,city_id,description,category,category_id,country,hotline,latitude,longitude,media,nameplace,phone,photoplace,placeID,price,service_hour,tags,thumb_photoplace;

- (id)initWithAttributes:(NSDictionary *)attributes{
    self = [super init];
    if (!self) {
        return nil;
    }
    placeID = [[attributes valueForKeyPath:@"id"] integerValue];
    self.nameplace = [attributes valueForKeyPath:@"name"];
    self.description = [attributes valueForKeyPath:@"description"];
    self.service_hour= [attributes valueForKeyPath:@"service_hour"];
    self.price= [attributes valueForKeyPath:@"price"];
    self.phone= [attributes valueForKeyPath:@"phone"];
    self.hotline= [attributes valueForKeyPath:@"hotline"];
    self.album= [attributes valueForKeyPath:@"album"];
    self.media= [attributes valueForKeyPath:@"media"];
    self.address = [attributes valueForKey:@"address"];
    self.longitude = [[attributes valueForKey:@"longitude"] floatValue];
    self.latitude = [[attributes valueForKey:@"latitude"] floatValue];
    self.category_id=[attributes valueForKey:@"category_id"];
    self.city_id = [attributes valueForKey:@"city_id"];
    self.country =  [attributes valueForKey:@"country"];
    self.tags=  [attributes valueForKey:@"tags"];
    self.category=  [attributes valueForKey:@"category"];
    self.city=  [attributes valueForKey:@"city"];
    self.thumb_photoplace=[[attributes valueForKeyPath:@"main_photo"] valueForKeyPath:@"thumb_photo"];
    self.photoplace=[[attributes valueForKeyPath:@"main_photo"] valueForKeyPath:@"photo"];
 
    return self;
}
@end