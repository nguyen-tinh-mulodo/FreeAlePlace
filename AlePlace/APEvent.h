//
//  APEvent.h
//  AlePlace
//
//  Created by Apple on 6/5/14.
//
//

#import <Foundation/Foundation.h>

@interface APEvent : NSObject
@property (readonly) NSUInteger eventID;
@property (nonatomic,strong) NSString *nameEvent;
@property (nonatomic,strong) NSString *descriptionEvent;
@property (nonatomic,strong) NSString *start_dateEvent;
@property (nonatomic,strong) NSString *end_dateEvent;
@property (nonatomic,strong) NSString *thumb_photoEvent;
@property (nonatomic,strong) NSString *photoEvent;
@property (nonatomic,strong) NSArray *album;
@property (nonatomic,strong) NSArray *media;
@property (nonatomic,strong) NSString *team;
@property (nonatomic,strong) NSString *schedule;
@property (nonatomic, strong)NSString *result;
@property (readonly)NSInteger country_id;
@property (readonly)NSInteger city_id;
@property (nonatomic,strong)NSString *country;
@property (nonatomic,strong)NSString *city;
- (id)initWithAttributes:(NSDictionary *)attributes;
@end
