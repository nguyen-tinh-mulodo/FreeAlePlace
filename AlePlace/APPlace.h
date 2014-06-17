//
//  APPlace.h
//  AlePlace
//
//  Created by VinhPhuc on 6/11/14.
//
//

#import <Foundation/Foundation.h>

@interface APPlace : NSObject
@property (readonly) NSUInteger placeID;
@property (nonatomic,strong) NSString *nameplace;
@property (nonatomic,strong)NSString *description;
@property (nonatomic,strong)NSString *service_hour;
@property (nonatomic,strong)NSString *price;
@property (nonatomic,strong)NSString *phone;
@property (nonatomic,strong)NSString *hotline;
@property (nonatomic,strong) NSArray *album;
@property (nonatomic,strong) NSArray *media;
@property (nonatomic,strong)NSString *address;
@property (nonatomic)float latitude;
@property (nonatomic)float longitude;
@property (nonatomic,strong)NSString *category_id;
@property (nonatomic,strong)NSString *city_id;
@property (nonatomic,strong)NSString *tags;
@property (nonatomic,strong)NSString *category;
@property (nonatomic,strong)NSString *country;
@property (nonatomic,strong)NSString *city;
@property (nonatomic,strong) NSString *thumb_photoplace;
@property (nonatomic,strong) NSString *photoplace;


- (id)initWithAttributes:(NSDictionary *)attributes;
@end