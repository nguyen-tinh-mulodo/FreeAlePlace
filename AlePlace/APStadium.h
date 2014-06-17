//
//  APStadium.h
//  AlePlace
//
//  Created by Apple on 6/8/14.
//
//

#import <Foundation/Foundation.h>

@interface APStadium : NSObject
@property (readonly) NSUInteger stadiumID;
@property (nonatomic,strong) NSString *nameStadium;
@property (readwrite)NSInteger capacity;
@property (nonatomic,strong)NSString *address;
@property (readwrite)float latitude;
@property (readwrite)float longitude;
@property (nonatomic,strong) NSString *descriptionStadium;
@property (nonatomic,strong) NSString *thumb_photoStadium;
@property (nonatomic,strong) NSString *photoStadium;
@property (nonatomic,strong) NSArray *album;
@property (nonatomic,strong) NSArray *media;


@property (readwrite)NSInteger country_id;
@property (readwrite)NSInteger city_id;
@property (nonatomic,strong)NSString *country;
@property (nonatomic,strong)NSString *city;
- (id)initWithAttributes:(NSDictionary *)attributes;
@end
