//
//  APCallAPI.h
//  AlePlace
//
//  Created by Apple on 6/5/14.
//
//

#import <Foundation/Foundation.h>

@interface APCallAPI : NSObject
+ (void)getEvents:(void (^)(NSArray *ListEvents, NSObject *error))block parameters:(NSDictionary *)parameters didFail:(void (^)(NSObject *))blockFail;
+ (void)getDetailEvent:(void (^)(NSArray *ListProduct, NSObject *error))block parameters:(NSDictionary *)parameters didFail:(void (^)(NSObject *))blockFail;
+ (void)getStadiums:(void (^)(NSArray *ListProduct, NSObject *error))block parameters:(NSDictionary *)parameters didFail:(void (^)(NSObject *))blockFail;
+ (void)getStadiumData:(void (^)(NSArray *ListProduct, NSObject *error))block parameters:(NSDictionary *)parameters didFail:(void (^)(NSObject *))blockFail;
+ (void)getCountries:(void (^)(NSArray *ListProduct, NSObject *error))block parameters:(NSDictionary *)parameters didFail:(void (^)(NSObject *))blockFail;
+ (void)getCities:(void (^)(NSArray *ListProduct, NSObject *error))block parameters:(NSDictionary *)parameters didFail:(void (^)(NSObject *))blockFail;


@end
