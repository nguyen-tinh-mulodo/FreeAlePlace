//
//  APEvent.m
//  AlePlace
//
//  Created by Apple on 6/5/14.
//
//

#import "APEvent.h"

@implementation APEvent
@synthesize eventID,nameEvent,descriptionEvent,start_dateEvent,end_dateEvent,thumb_photoEvent,photoEvent,album,media,team,schedule,result,country,country_id,city,city_id;

- (id)initWithAttributes:(NSDictionary *)attributes {
    self = [super init];
    if (!self) {
        return nil;
    }
    eventID = [[attributes valueForKeyPath:@"id"] integerValue];
    self.nameEvent = [attributes valueForKeyPath:@"name"];
    self.descriptionEvent = [attributes valueForKeyPath:@"description"];
    self.start_dateEvent = [attributes valueForKeyPath:@"start_date"];
    self.end_dateEvent = [attributes valueForKeyPath:@"end_date"];
    self.thumb_photoEvent = [[attributes valueForKeyPath:@"main_photo"] valueForKeyPath:@"thumb_photo"];
    self.photoEvent = [[attributes valueForKeyPath:@"main_photo"] valueForKeyPath:@"photo"];
    self.album = [attributes valueForKey:@"album"];
    self.city = [attributes valueForKey:@"city"];
    self.media = [attributes valueForKey:@"media"];
    self.team = [attributes valueForKey:@"team"];
    self.schedule = [attributes valueForKey:@"schedule"];
    self.result = [attributes valueForKey:@"result"];
    
    return self;
}

@end
