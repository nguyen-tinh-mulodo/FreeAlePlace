//
//  APCity.h
//  AlePlace
//
//  Created by VinhPhuc on 6/9/14.
//
//

#import <Foundation/Foundation.h>

@interface APCity : NSObject
@property (nonatomic)NSString* cityName;
@property (nonatomic)int id_city;
@property (nonatomic)double latitude;
@property (nonatomic)double longitude;
- (id)initWithAttributes:(NSDictionary *)attributes;
@end
